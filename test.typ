#import "leipzig-polylux-template.typ": *

#let good = text(font: "Wingdings")[J]
#let bad = text(font: "Wingdings")[L]
#let neutral = text(font: "Wingdings")[K]

#show: leipzig-theme.with(
  title: [New module imaso#sym.trademark.registered maintenance -- Report],
  author: ("Niklas Dießner", "Lennart Dittmann", "Jixuan Li",),
  subtitle: "Software Engineering Project",
  short-title: "imaso Module Report",
  date: datetime(year: 2026, month: 4, day: 20,)
)

#title-slide(
  extra: grid(
    columns: 2,
    align: horizon,
    column-gutter: 0.5em,
    [in Kooperation mit],
    context image("images/logo_ccc.png", height: 0.1 * page.height),
  )
)

#slide(heading: [Summary])[
  #set align(horizon+center)
  #table(
    columns: 3,
    [Group Collab], [Project Collab], [Project Progress],
    [#good], [#neutral], [#bad]
  )
]

#slide(heading: [Last Period Overview])[
  #grid(
    columns: (1fr, 1fr),
    rows: (1fr, 1fr),
    gutter: 4em,
    [
      #align(center)[== Highlights]
      - Highlight 1
      - Highlight 2
      - Highlight 3
    ],
    [
      #align(center)[== What went well]
      - Item 1
      - Item 2
      - Item 3
    ],
    [
      #align(center)[== What can be improved]
      - Item 1
      - Item 2
      - Item 3
    ],
    [
      #align(center)[== Where we need help]
      - Item 1
      - Item 2
      - Item 3
    ]
  )
]
