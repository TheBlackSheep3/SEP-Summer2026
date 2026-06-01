#import "@preview/timeliney:0.4.0"
#import "report-template.typ" : report, status, slide, timeline, timeline-theme, fontsize-small, fontsize-tiny, m-karneol, m-aquamarin, m-granat

#show: report.with(
  date: datetime(year: 2026, month: 6, day: 01),
  status: (group: status.neutral, project: status.neutral, progress: status.good),
  overview: (highlights: ("Customer happy with screen mockups", Getting into the code soon!), well: ("Communication with customer",), improvements: ("Team communication about tasks and availabilities",), help: (),)
)


#slide(heading: [Relevant Events])[
  #timeline(
    (
      (date: "May 28", desc: "Final review and approval of mock-ups with customer"),
      (date: "June 04", desc: "Drafting of initial user stories to work on"),
      (date: "June 08", desc: "Start implementation"),
      
    ),
    theme: (colors: timeline-theme.colors, sizes: (date: fontsize-small, body: fontsize-tiny))
  )
]


#slide(heading: [What did the customer expect from 'Design'?])[
  #align(center)[
    #figure(
      context image("images/mockup_example.png", height: 0.5*page.height),
      caption: ("Figma: Defining necessary data fields and functions on various screens"),
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
          at: 1+18/31,
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
