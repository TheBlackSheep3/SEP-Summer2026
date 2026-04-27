#import "@preview/timeliney:0.4.0"
#import "report-template.typ" : report, status, slide, timeline, timeline-theme, fontsize-small, fontsize-tiny, m-karneol, m-aquamarin, m-granat

#show: report.with(
  date: datetime(year: 2026, month: 4, day: 27),
  status: (group: status.good, project: status.good, progress: status.neutral),
  overview: (highlights: ("Gathered ideas for functionalities and constraints","Decided on relevant user group",), well: ("Customer goes with the idea of requirements board","On-Site workshop is set up",), improvements: ("Scope of the project",), help: ("Ideas for methodology for on-site workshop",))
)

#slide(heading: [Relevant Events])[
  #timeline(
    (
      (date: "Apr 20", desc: "Takeaways from weekly sync with other project groups"),
      (date: "Apr 22", desc: "Aggregation of requirement ideas on Figma board"),
      (date: "Apr 23", desc: "Weekly sync with customer, Pitched requirements board, Locally running build environment"),
      (date: "Apr 26", desc: "Inital draft of project timeline and plan"),
      (date: "Apr 29", desc: "On-site workshop for extensive requirements engineering")
    ),
    theme: (colors: timeline-theme.colors, sizes: (date: fontsize-small, body: fontsize-tiny))
  )
]

#slide(heading: [Collaboration Board])[
  #align(center)[
    #figure(
      context image("images/Figma.png", height: 0.5*page.height),
      caption: link("https://www.figma.com/board/5GD8NxHWQ6iELbMD7NKgdb/-SEP--Shift-Planner?node-id=0-1&t=aDsOBbqztxLaokjB-0", "Use case-based approach via 'Task Trees' in Figma"),
    )
  ]
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
