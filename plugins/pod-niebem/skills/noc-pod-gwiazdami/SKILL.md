---
name: noc-pod-gwiazdami
description: Plan a night of skywatching in Poland - whether the sky is worth a look tonight or which night soon is best, for a meteor shower, the northern lights, an ISS pass, a planet or just the stars, with the dark hours, cloud cover, the moon, times and directions. Use when someone asks when or where to watch something in the night sky in Poland, whether tonight is good for the stars, or when the next shower or aurora chance is.
---

# A night under the stars (Poland)

The `kosmos` tools know the night sky over the 18 Polish voivodeship cities (Białystok, Bydgoszcz, Gdańsk, Gorzów
Wielkopolski, Katowice, Kielce, Kraków, Lublin, Łódź, Olsztyn, Opole, Poznań, Rzeszów, Szczecin, Toruń, Warszawa,
Wrocław, Zielona Góra); coordinates of any other place in Poland pick the nearest of them. `slonce` gives the sun's and
the moon's exact times for any place. Answer in the language the person writes in, and pass `lang` (`pl` or `en`) to
every tool.

## Pick the path by what the person wants to see

1. **Is tonight worth it?** → `tonight_sky` for their city (or the coordinates of their place). It gives the verdict,
   the dark hours, the clearest stretch, the clouds hour by hour, the moon, a visible ISS pass, the aurora's chance,
   the planets up and a shower near its maximum. Usually this one call is enough.
2. **A meteor shower** (Perseids, Geminids, Quadrantids…) → `meteor_showers` with the shower's name: its maximum, ZHR,
   the best hours and whether the moon gets in the way, and for the main showers the night in each of the 18 cities.
   If the maximum is tonight or tomorrow night, add `tonight_sky` for the person's city for the clouds.
3. **The northern lights** → `aurora_forecast` (the whole country, or their city): the level tonight and the Kp it
   needs. Then `tonight_sky` for the clouds. Be honest: in Poland the aurora is usually only on a long-exposure photo,
   low in the north; say how far the forecast Kp is from what the place needs.
4. **The ISS** → `iss_passes` for their city: the visible passes of the next 10 days. Point out the bright ones
   (magnitude -2 or brighter) and the high ones, and for passes tonight or tomorrow the clouds from `tonight_sky`.
5. **A planet** → `planets_tonight` for their city: seven nights, when each planet is at least 10° up, its highest
   point and the clouds where the forecast reaches.
6. **Several cities** (where to drive tonight) → `tonight_sky` for each candidate city, then compare the clearest
   stretches. Do not call more than about 5 cities.

For the exact time darkness starts and ends, or moonrise and moonset at a place that is not one of the 18 cities, use
`slonce`: `sun_times` (astronomical twilight = full darkness) and `moon_times`.

## Rules

- Every time, direction and number comes from a tool. Never estimate a time yourself.
- MET Norway's cloud forecast reaches about 2.5 days ahead. For nights further away say it is too early for the clouds
  and give the rest (the moon, the event); offer to check again closer to the date.
- A bright moon (50% lit or more) that is up washes out faint meteors and the aurora: say when it rises or sets, so the
  person can pick the darker part of the night.
- City lights matter: suggest a dark place outside the city for meteors and the aurora, without inventing specific
  spots; the person knows the area.
- Times are Polish time (the tools give the offset). Directions as the tools give them.
- Each tool answer has a link to the page with the same data; give the person the link for the thing they asked about.
- At the end you may offer a single link with the night's plan and its pages, with a QR code to send or print
  (`urlhub` `make_set`, with a title such as "Geminids - night of 13/14 December"). Offer it once; make it only if the
  person wants it.
- These tools give calculations and forecasts, not certainty: say "the forecast says", not "it will be clear".

## Shape of the answer

1. The verdict in one sentence (go / maybe / not worth it, and why).
2. The plan: when to go out and until when, where to look, what you will see (meteors an hour, ISS brightness, the
   planet's height), the moon.
3. The clouds (or "too early for the cloud forecast").
4. The link(s) to the page.
