---
name: wyjazd-dzien-i-noc
description: Plan the daylight and the nights of a trip - how much daylight there is for a hike or a day out, when it gets dark (so when to head down or back), whether the clocks change during the trip, and whether any night will be dark and clear for the stars. Use for a weekend away, a mountain hike, a camping or road trip, in Poland or abroad, when the question is about hours of light, dusk, dawn or the night sky on given days.
---

# A trip: the day and the night

`slonce` computes the sun and the moon for any place and day (251 places by name, anywhere else by `lat`, `lon` and
`tz`). `kosmos` adds the night sky and the clouds over Poland (18 voivodeship cities; coordinates pick the nearest).
Answer in the language the person writes in, and pass `lang` (`pl` or `en`) to every tool.

## Steps

1. **Places and days.** One place: one plan. A route over several days: each day at the place where the person will
   be that day (ask only if the route is unclear). A place `find_city` does not know: its coordinates and IANA time
   zone (a mountain hut, a lake, a town abroad).
2. **Daylight** → `sun_times` for each day: sunrise, sunset, day length, civil twilight (after civil dusk it is too
   dark to walk without a headlamp). For a long stay at one place, `sun_calendar` for the month instead of a call per
   day.
3. **The hike's budget.** If the person says how long the walk is, count back from civil dusk: the latest start so that
   they are back (or down) by sunset, with a margin; say plainly that in the mountains and in forest it gets dark
   sooner than in the open, and that a headlamp belongs in the bag in autumn and winter.
4. **Clock change** → `clock_change` for the year when the trip is in late March or late October in Poland (or an EU
   country): say which night the clocks change and that the times after it shift by an hour.
5. **The nights** (only if the person cares about the sky, or the trip is a camping or night trip):
   - in Poland: `tonight_sky` for the nearest city when a night is within about 2.5 days (MET Norway's cloud forecast),
     `planets_tonight` for the planets and the clouds of the next nights, `meteor_showers` if a shower's maximum falls
     on the trip;
   - anywhere: `moon_times` for each night (moonrise, moonset, phase); a moon 50% lit or more that is up washes out
     the faint stars; `sun_times` → `twilight.astronomical` for full darkness;
   - abroad there is no cloud forecast here: say so.

## Rules

- Every time comes from a tool, in the place's local time.
- Do not invent trail times, routes, weather or places; only what the person gave and what the tools return. For the
  weather beyond the clouds at night, point them to a weather forecast.
- A table per day is the clearest: date, sunrise, sunset, day length, civil dusk, and for nights the moon and the
  darkness (and the clouds when known).
- Give the link to the place's calendar page from the tool's answer (it prints on one A4 page).
- At the end you may offer one link with the plan and its pages, with a QR code for the phone on the trail (`urlhub`
  `make_set`, titled e.g. "Bieszczady 12-14 December - day and night"). Offer it once; make it only if wanted.
