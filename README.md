# Pod niebem: sky & daylight planner

A Claude plugin for planning time under the sky. Ask Claude whether tonight is worth a look in a Polish city, where
and when to watch the Geminids, whether the northern lights can be seen, when the ISS passes over, which planets are up
this week, or when the golden and blue hours are on your photo trip, anywhere in the world. Claude answers from four
free MCP servers run by doner.cloud and links the page with the same data.

## Skills

- **noc-pod-gwiazdami**: a night of skywatching in Poland: the verdict for tonight, a meteor shower, the aurora, ISS
  passes or a planet, with the dark hours, cloud cover, the moon, times and directions.
- **plan-zdjec**: the light for photos at a place and on given days: golden and blue hours day by day, moonrise,
  moonset and phase, the dark window for stars and the Milky Way, and the clouds where a forecast exists.
- **karta-z-nieba**: a printable card of the sky on a birthday, a child's birth, a wedding or any day, with the
  Moon's phase, sunrise and sunset, the planets and a QR code, for A4, A3 or an A6 greeting card.
- **wyjazd-dzien-i-noc**: the daylight and the nights of a trip, in Poland or abroad: how much daylight for a hike,
  when it gets dark (the latest start to be back before dusk), a clock change during the trip, and whether a night will
  be dark and clear for the stars.

## Connectors (remote MCP servers, no account or key)

| Server | Address | Gives |
| --- | --- | --- |
| kosmos.info.pl | https://kosmos.info.pl/mcp | tonight's sky over 18 Polish cities: clouds (MET Norway), moon, ISS, aurora (NOAA Kp), planets, meteor showers |
| slonce.info.pl | https://slonce.info.pl/mcp | sunrise, sunset, twilight, golden and blue hours, moon times and phases, any place |
| zodiak.info.pl | https://zodiak.info.pl/mcp | where the planets are at any moment (positions only), and the sky map card of a day |
| urlhub.cloud | https://urlhub.cloud/mcp | on request: one short link with a QR code for the plan and its pages |

## Privacy

The plugin has no code of its own: it is two skills (instructions for Claude) and the addresses of the four servers.
When Claude uses a tool, it sends that server only what the tool needs: a place (a city name, or coordinates and a time
zone), a date or month, a shower's name, and for urlhub the links of the plan with its title. The servers compute the
answer in memory and do not store what was asked; their logs keep the usual record of the request and the tool's name.
Your conversation stays with Anthropic. Each server's policy:
[kosmos](https://kosmos.info.pl/en/privacy), [slonce](https://slonce.info.pl/en/privacy),
[zodiak](https://zodiak.info.pl/prywatnosc) (Polish), [urlhub](https://urlhub.cloud/privacy?lang=en).

## Install

- Claude Code: `/plugin marketplace add adahyto/pod-niebem`, then `/plugin install pod-niebem@doner-cloud`.
- Claude (chat): Customize → Plugins → Add marketplace → `https://github.com/adahyto/pod-niebem`.

## Po polsku

Pakiet dla Claude do planowania czasu pod niebem: czy dziś w nocy warto patrzeć w niebo w polskim mieście, kiedy i gdzie
oglądać Geminidy, czy będzie zorza, kiedy przeleci ISS, które planety widać w tym tygodniu, kiedy złota i niebieska
godzina na wyjeździe z aparatem, ile dnia na szlak i kiedy zmrok na wyjeździe (w dowolnym miejscu na świecie). Claude odpowiada z czterech darmowych serwerów MCP
doner.cloud i podaje link do strony z tymi samymi danymi. Serwery dostają tylko miejsce, datę i nazwę zjawiska (a urlhub
linki planu, gdy poprosisz o wspólny link) i niczego z zapytania nie zapisują.

Kontakt: aex.tomas@gmail.com · https://doner.cloud/
