all: report-2026-04-20 report-2026-04-27 report-2026-05-04 report-2026-05-11

report-2026-04-20:
	typst compile report-2026-04-20.typ

report-2026-04-27:
	typst compile report-2026-04-27.typ

report-2026-05-04:
  typst compile report-2026-05-04.typ

report-2026-05-11:
  typst compile report-2026-05-11.typ

present: report-2026-05-11
  pympress --talk-time=10 report-2026-05-11.pdf

topic:
  typst compile task-prioritisation.typ

present-topic: topic
  pympress --talk-time=30 task-prioritisation.pdf
