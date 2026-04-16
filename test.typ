#import "leipzig-polylux-template.typ": *

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
