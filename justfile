all: report-2026-04-20

report-2026-04-20:
	typst compile report-2026-04-20.typ

present: report-2026-04-20
	pympress --talk-time=10 report-2026-04-20.pdf
