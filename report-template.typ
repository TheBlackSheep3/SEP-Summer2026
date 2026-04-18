#import "leipzig-polylux-template.typ": *

#let status = (
  good: "good",
  neutral: "neutral",
  bad: "bad",
)

#let smiley(status) = {
  let cases = (
    good: text(font: "Wingdings")[J],
    neutral: text(font: "Wingdings")[K],
    bad: text(font: "Wingdings")[L],
  )
  cases.at(status)
}

#let report(
  date: datetime.today(),
  status: (:),
  overview: (highlights: (), well: (), improvements: (), help: ()),
) = {
  if overview.highlights.len() > 3 or overview.well.len() > 3 or overview.improvements.len() > 3 or overview.help.len() > 3 {
    panic("highlights, well, improvements and help are expected to contain three elements at most")
  }
  if overview.well.len() < 1 {
    panic("well is expected to contain at least one element")
  }
  if overview.improvements.len() < 1 {
    panic("improvements is expected to contain at least one element")
  }
  show: leipzig-theme.with(
    title: [New module imaso#sym.trademark.registered maintenance -- Report],
    author: ("Niklas Dießner", "Lennart Dittmann", "Jixuan Li",),
    subtitle: "Software Engineering Project",
    short-title: "imaso Module Report",
    date: date
  )

  title-slide(
    extra: grid(
      columns: 2,
      align: horizon,
      column-gutter: 0.5em,
      [in cooperation with],
      context image("images/logo_ccc.png", height: 0.1 * page.height),
    )
  )

  slide(heading: [Summary])[
    #set align(horizon+center)
    #table(
      columns: 3,
      [Group Collab], [Project Collab], [Project Progress],
      [#smiley(status.group)], [#smiley(status.project)], [#smiley(status.progress)]
    )
  ]
  slide(heading: [Last Period Overview])[
    #set table(stroke: none, align: left)
    #set heading(level: 2)
    #let itemize = el => list(el)
    #grid(
      columns: (1fr, 1fr),
      rows: (1fr, 1fr),
      gutter: 4em,
      align: top+center,
      ..if overview.highlights.len() == 0 {
        (
          grid.cell(colspan: 2, [#heading[What went well] #table(..overview.well.map(itemize))],),
        )
      } else {
        (
          [#heading[Highlights] #table(..overview.highlights.map(itemize))],
          [#heading[What went well] #table(..overview.well.map(itemize))],
        )
      },
      ..if overview.help.len() == 0 {
        (
          grid.cell(colspan: 2, [#heading[What can be improved] #table(..overview.improvements.map(itemize))]),
        )
      } else {
        (
          [#heading[What can be improved] #table(..overview.improvements.map(itemize))],
          [#heading[Where we need help] #table(..overview.help.map(itemize))],
        )
      }
    )
  ]
}
