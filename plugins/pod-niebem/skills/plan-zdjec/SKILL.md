---
name: plan-zdjec
description: Plan the light for photos at a place and on given days - sunrise and sunset, the golden and blue hours day by day, moonrise, moonset and phase for night shots, the dark hours for the Milky Way and stars, and the clouds where a forecast exists. Use for a photo trip or shoot, landscape or night photography, or questions like "when is the golden hour in Zakopane on Saturday".
---

# Light for photos

The `slonce` tools compute the sun and the moon for any place and day (251 places by name - Polish cities, places for
trips and a few cities abroad - and anywhere else by `lat`, `lon` and `tz`). `kosmos` adds the night sky and the
clouds over Poland. Answer in the language the person writes in, and pass `lang` (`pl` or `en`) to every tool.

## Steps

1. **The place.** If `find_city` does not know it, use its coordinates and IANA time zone (e.g. a mountain hut, a lake,
   a city abroad). Several places on a trip: plan each day at that day's place.
2. **The days.**
   - One or two days → `sun_times` for each day: the golden hours (`golden_hour.morning/evening`), the blue hours
     (`blue_hour`), sunrise, sunset, civil twilight.
   - A longer stay at one place → `sun_calendar` for the month(s) for sunrise, sunset and day length, then
     `sun_times` only for the days where the person needs the golden and blue hours.
3. **Night shots** (stars, the Milky Way, star trails, the moon over a landscape):
   - `moon_times` for each night: moonrise, moonset, phase and lit part. A moon 30% lit or more that is up brightens
     the sky; the darkest window is between the end of astronomical twilight (`sun_times` →
     `twilight.astronomical.end`) and the next morning's start, minus the hours the moon is up.
   - Near a new moon (`moon_phases` for the dates) the whole night is dark.
   - The Milky Way's bright core is a summer target in Poland: from about March (before dawn) to about October
     (evening), low in the south. From November to February it is not up in the dark hours; say so and suggest star
     trails or the winter sky instead. For a planet in the frame use `zodiak` `sky_at` only for where the planets are
     (sign positions), or `kosmos` `planets_tonight` in Poland for their height and direction.
   - The moon itself: moonrise or moonset close to sunset or sunrise gives a moon over the landscape in soft light; a
     full moon rises near sunset.
4. **Clouds** (Poland only): `kosmos` `tonight_sky` for the nearest of the 18 cities covers tonight; `planets_tonight`
   has the clouds of the next nights where MET Norway's forecast reaches (about 2.5 days). Further ahead: say it is too
   early for clouds. Abroad: no cloud data here.

## Rules

- Every time comes from a tool, in the place's local time; never shift times yourself.
- The golden and blue hours follow the sun's height (golden: from 4° below the horizon to 6° above it; blue: 4-6°
  below); mountains and valleys hide the low sun earlier, so suggest arriving early.
- A day-by-day table is the clearest: date, blue hour morning, golden hour morning, golden hour evening, blue hour
  evening, and for nights moonrise/moonset and the dark window.
- Give the link to the place's calendar page (it prints on one A4 page) from the tool's answer.
- At the end you may offer one link with the plan and its pages, with a QR code (`urlhub` `make_set`, titled e.g.
  "Tatry - photo plan 12-14 June"). Offer it once; make it only if the person wants it.
