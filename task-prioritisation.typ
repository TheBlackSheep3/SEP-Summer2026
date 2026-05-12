#import "leipzig-polylux-template.typ": *

#show: leipzig-theme.with(
  title: [Task Prioritisation],
  author: ("Niklas Dießner",),
  subtitle: "Software Engineering Project",
  date: datetime(day: 11, month: 5, year: 2026)
)

#title-slide()

#slide()[
  #align(center)[#text(size: fontsize-LARGE)[*Motivation*]]
]

#slide(heading: [MoSCoW])[
  - Categorisation into four buckets (*must have, should have, could have, won't have*)
  - Communicating scope to stakeholders
  - Early project planning
]

#slide(heading: [Impact / Effort Matrix])[
  - Place tasks in *Impact* / *Effort* Grid
  #align(center)[
    #set table(
      fill: (x,y) =>
        if (x <= 1 or y <= 1) and not (x == 0 and y == 0) {
          m-granat
        },
      stroke: (x,y) => if x == 0 and y == 0 { none } else { black }
    )
    #table(
      align: center,
      columns: (auto, auto, 3em, 3em),
      rows: (auto, auto, 3em, 3em),
      table.cell(colspan: 2, rowspan: 2, []), table.cell(colspan: 2, [Impact]),
      [High], [Low],
      table.cell(rowspan: 2, rotate(-90deg, reflow: true)[Effort]), rotate(-90deg, reflow: true)[High], [], [],
      rotate(-90deg, reflow: true)[Low], [], [],
    )
  ]
  - Spotting obvious priorities and waste
  - Comparing tasks at a glance
]

#slide(heading: [Weighted Shortest Job First (WSJF)])[
  - Determine priority based on score
  #align(center)[
    $
    "Score" = overbrace("Business value" + " Time criticality" + "Risk redcuction", "Risk of delay")/"Job size"
    $
  ]
  - Higher score #sym.arrow higher priority
]

#slide(heading: [Effort estimation])[
  - Sub-problem within prioritisation
  - Notoriously hard in software development
  - Common approaches: *story points, t-shirt sizes, planning poker*
]

#slide(heading: [Sample Scenario])[
  - Small student project: *study group finder*
  - Users can find and join groups for courses
  - Launch in 3 weeks with more tasks than time
]

#slide()[
  #show table.cell.where(y: 0): cell => align(center)[#strong(cell)]
  #set text(size: fontsize-small)
  #figure(
    table(
      columns: (auto, auto, auto),
      table.header([ \# ], [ Task ], [ Some Context ],),
      [ 1 ], [ User login and registration ], [ Students need accounts to join groups ],
      [ 2 ], [ Search and filter study groups by course ], [ Core way to find groups ],
      [ 3 ], [ Push notifications for group updates ], [ Keeps members informed ],
      [ 4 ], [ Admin dashboard to manage reported users ], [ Handles misuse of the platform ],
      [ 5 ], [ Mobile-friendly design ], [ Many students use their phones ],
    ),
    caption: [Sample Backlog]
  )
]

#slide(heading: [Conclusion])[
  #set align(center)
  What are your takeaways?
]
