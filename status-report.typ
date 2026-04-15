#import "@preview/polylux:0.4.0": *
#import emoji: face

#let authors = ("Niklas Dießner", "Lennart Dittmann", "Jiaxuan Li")
#let date = datetime(day: 20, month: 4, year: 2026)

#set page(
  paper: "presentation-16-9",
  numbering: (..nums) => context {
    let num = nums.at(0)
    if 1 < num {
      str(num)
    }
  },
  number-align: bottom+right
)
#set text(size: 18pt, font: "Helvetica", lang: "en")
#set document(title: "Software Engineering Project - Status Report", author: authors, description: "Status report for software engineering project in summer term 2026 working in cooperation with ccc software gmbh.", date: date)

#slide[
  #set align(horizon)

  #title()
  _New module imaso#sym.trademark.registered maintenance_

  #authors.join(", ")\
  #date.display("[month repr:long] [day], [year]")

  #align(center)[#table(
      stroke: none,
      columns: (1fr, auto, 1fr, auto, 1fr),
      [],
      image("images/logo_leipzig.svg", height: 5em),
      [],
      image("images/logo_ccc.png", height: 5em),
      [],
    )
  ]
]

#slide[
  = Summary
  #set align(horizon+center)
  #table(
    columns: 3,
    [Group Collab], [Project Collab], [Project Progress],
    [#face.smile.slight], [#face.frown.slight], [#face.neutral]
  )
]

#slide[
  = Last Period Overview
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
