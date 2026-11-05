---
name: karta-z-nieba
description: Make a printable keepsake or gift of the night sky on a day that matters - a birthday, the birth of a child, a wedding or anniversary, any special day - as a sky map card of that place and hour with the Moon's phase, sunrise and sunset, the planets and a QR code, ready to print on A4, A3 or as an A6 greeting card. Use when someone wants a star map, sky map or "the sky on the day we met / married / were born" as a present or keepsake.
---

# A card of the sky on a day

`zodiak` `sky_card` makes the card: give it the date, the clock time if known (without it the card shows the sky at
22:00 that evening), the place (a town name, or `lat`, `lon` and `tz`), the occasion (`birthday`, `birth`, `wedding`
or `day`), and if the person wants them a heading (`title`, up to 60 characters) and a line under it (`subtitle`, up to
80, e.g. the names). Pass `lang` (`pl` or `en`) in the person's language.

## Steps

1. Ask only for what is missing: the date and the place are needed; the time and the names are optional. For a birth,
   the time is on the hospital's birth card or in the child's health book; for a wedding, the ceremony's time.
2. Call `sky_card` once. Give the person the **link** first: it opens the card ready to print (PDF A4, A3, an A6 card,
   or a PNG). Then two or three lines of what the card shows: the Moon's phase, sunrise and sunset, the planets, an
   eclipse or a meteor shower near the date if there was one, and the NASA picture of the day of that date if the
   answer has its link.
3. If the person wants it darker or lighter, or without the QR code, call `sky_card` again with `style` (`granat` dark
   blue, `jasny` light, `cb` black and white to save ink) or `qr: false`.

## Rules

- Everything on the card and in your answer comes from the tool; do not add predictions or astrological readings.
- The card's data is in its link (after "#"): anyone who gets the link or scans the QR code sees the date, the place and
  the names. Say so if the person seems to want it private.
- The print and the PNG are made in the person's browser; there is no paid print shop yet. Do not promise delivery.
