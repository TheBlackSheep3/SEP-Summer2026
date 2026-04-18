#import "report-template.typ" : report, status

#report(
  date: datetime(year: 2026, month: 4, day: 20),
  status: (group: status.good, project: status.good, progress: status.neutral),
  overview: (highlights: ("Template for reports",), well: ("Communication", "Scheduling",), improvements: ("Scope of the project",), help: ())
)
