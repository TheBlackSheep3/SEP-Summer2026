#import "test.typ" : report, status

#let sample = ("Item 1", "Item 2", "Item 3",)
#report(
  date: datetime(year: 2026, month: 4, day: 20),
  status: (group: status.good, project: status.neutral, progress: status.bad),
  overview: (highlights: (), well: sample, improvements: sample, help: ())
)
