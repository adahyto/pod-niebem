#!/bin/sh
# Runs the prompts of evals/prompts.tsv with the plugin loaded (claude -p), one at a time, and prints for each the
# tools Claude called next to the expected ones; the full answers are in evals/out/<id>.txt and .jsonl.
#   sh evals/run.sh           all prompts
#   sh evals/run.sh 3 7       only these ids
# Each prompt is one request on your Claude account.
cd "$(dirname "$0")/.." || exit 1
mkdir -p evals/out
P=pod-niebem
# The plugin's servers, or the same ones from the account's claude.ai connectors (Claude Code keeps one set per URL)
ALLOW="mcp__plugin_${P}_kosmos__*,mcp__plugin_${P}_slonce__*,mcp__plugin_${P}_zodiak__*,mcp__plugin_${P}_urlhub__*"
ALLOW="$ALLOW,mcp__claude_ai_kosmos__*,mcp__claude_ai_slonce__*,mcp__claude_ai_zodiak__*,mcp__claude_ai_urlhub__*"
grep -v '^#' evals/prompts.tsv | while IFS="$(printf '\t')" read -r id expected prompt; do
  [ -n "$id" ] || continue
  if [ $# -gt 0 ]; then case " $* " in *" $id "*) ;; *) continue ;; esac; fi
  timeout 300 claude -p "$prompt" --plugin-dir "plugins/$P" --allowedTools "$ALLOW" \
    --output-format stream-json --verbose < /dev/null > "evals/out/$id.jsonl" 2> "evals/out/$id.err"
  python3 - "$id" "$expected" <<'PY'
import json, sys
id_, expected = sys.argv[1], sys.argv[2]
tools, text, init = [], '', None
for line in open(f'evals/out/{id_}.jsonl', encoding='utf-8'):
    try:
        e = json.loads(line)
    except ValueError:
        continue
    if e.get('type') == 'system' and e.get('subtype') == 'init':
        init = e
    if e.get('type') == 'assistant':
        for c in e.get('message', {}).get('content', []) or []:
            if c.get('type') == 'tool_use':
                tools.append(c['name'].split('__')[-1])
    if e.get('type') == 'result':
        text = e.get('result') or ''
open(f'evals/out/{id_}.txt', 'w', encoding='utf-8').write(text)
servers = {s.get('name'): s.get('status') for s in (init or {}).get('mcp_servers', [])}
mine = {k: v for k, v in servers.items() if any(n in str(k) for n in ('kosmos', 'slonce', 'zodiak', 'urlhub'))}
ok = all(any(alt in tools for alt in group.split('|')) for group in expected.split(','))
print(f'{id_:>2} {"OK " if ok else "BAD"} expected {expected:<32} called {",".join(tools) or "-"}')
if not mine or any(v not in ('connected', 'pending') for v in mine.values()):
    print(f'   servers: {mine or servers}')
PY
done
