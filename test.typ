#import "leipzig-polylux-template.typ": *

#show: leipzig-theme.with(
  title: "Title of the presentation",
  subtitle: "Seminar title (e.g. Group seminar)",
  short-title: "Short title",
)

#title-slide(
  logo: image("images/ChemistryLogo.png"),
  extra: [
    Wilhelm-Ostwald-Institut für Physikalische und Theoretische Chemie\
    Fakultät für Chemie und Mineralogie\
    Universität Leipzig
  ]
)
