#import "@preview/timeliney:0.4.0"
#import "report-template.typ" : report, status, slide, timeline, timeline-theme, fontsize-small, fontsize-tiny, m-karneol, m-aquamarin, m-granat

#show: report.with(
  date: datetime(year: 2026, month: 5, day: 04),
  status: (group: status.good, project: status.good, progress: status.good),
  overview: (highlights: ("Requirements Workshop today","MVP Scope taking shape",), well: ("Expectations regarding Feasibility on Customer Side",), improvements: ("",), help: ("",))
)

#slide(heading: [Relevant Events])[
  #timeline(
    (
      (date: "May 04", desc: "On-site workshop for extensive requirements engineering"),
      (date: "May 07", desc: "Review of initial design concepts w/ ccc"),
      (date: "May 14", desc: "Submit concepts + Training in imaso")
    ),
    theme: (colors: timeline-theme.colors, sizes: (date: fontsize-small, body: fontsize-tiny))
  )
]

#let milestone-style = (stroke: (dash: "dashed", paint: m-karneol))

#slide(heading: [Project Plan])[

  #let task-style = (stroke: 2pt+m-aquamarin)
  #let taskgroup-style = (stroke: 4pt+m-granat)
  #block(height: 80%)[#scale(60%)[
    #timeliney.timeline(
      show-grid: true,
      {
        import timeliney: *

        headerline(group(([*Summer term 2026*], 6)))
        headerline(group("Apr"), group("May"), group("Jun"), group("Jul"), group("Aug"), group("Sep"))

        taskgroup(
          title: [*Project Setup*],
          style: taskgroup-style,
          {
            task("Contact with partner", (0, 0.5), style: task-style)
            task("Organization", (0, 0.5), style: task-style)
          }
        )
        taskgroup(
          title: [*Planning*],
          style: taskgroup-style,
          {
            task("Gathering requirements", (0.5, 1), style: task-style)
            task("Defining scope", (1, 1.25), style: task-style)
          }
        )
        taskgroup(
          title: [*Design*],
          style: taskgroup-style,
          {
            task("Reviewing existing designs", (1, 1.5), style: task-style)
            task("Redesign based on feature plans", (1.25, 2), style: task-style)
          }
        )
        taskgroup(
          title: [*Development*],
          style: taskgroup-style,
          {
            task("Implementing required features", (1.5, 4), style: task-style)
            task("Implementing additional features", (4, 5), style: task-style)
          }
        )
        taskgroup(
          title: [*Project Wrap-up*],
          style: taskgroup-style,
          {
            task("Ongoing documentation", (0, 5), style: task-style)
            task("Creating final report", (5, 5+25/30), style: task-style)
          }
        )

        milestone(
          at: 27/30,
          style: milestone-style,
          align(center, [
            #text(m-karneol)[*Today*]
          ])
        )

        milestone(
          at: 5+25/30,
          style: milestone-style,
          align(center, [
            #text(m-karneol)[*24th/25th Sep*]\
            Final Presentation
          ])
        )
      }
    )
  ]
]]
