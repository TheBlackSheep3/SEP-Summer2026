#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/cetz:0.4.2"

#let m-dark-orange = rgb(255, 152, 0)
#let m-granat = rgb(176, 47, 44)
#let m-karneol = rgb(214, 66, 66)
#let m-aquamarin = rgb(138, 194, 209)
#let m-light-gray = rgb(201, 201, 201)
#let m-basalt = rgb(38, 42, 49)

/* General theming and show rules */
#let leipzig-theme(aspect-ratio: "16-9", body) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: (x: 54.7pt, y: 26.5pt)
  )

  set text(font: "Arial", fill: black, 20.2pt)

   body
}


// Declare the title slide.
//
// - title: Presentation title.
// - author: Consists of author.name and author.mail.
// - subtitle: (Optional) subtitle for more info.
// - short-title: (Optional) short title for the header.
// - logo: (Optional) institution / faculty logo.
// - date: (Optional) date of the presentation.
// - date-format: (Optional) date format to display the presentation date.
// - extra: (Optional) info below the date and author, like the faculty.
#let title-slide(
  title: [],
  author: (name: "Your Name", mail: "example@uni-leipzig.de"),
  subtitle: none,
  short-title: none,
  logo: none,
  date: datetime.today(),
  date-format: "[month repr:long] [day], [year]",
  extra: none,
) = {
  let content = {
    
    context {
      image("images/logo_leipzig.svg", height: 0.23175225 * page.height)
    }
    if short-title != none {
      set text(26pt)
      align(center)[#subtitle]
    }
    [
      #text(32pt)[*#title*]

      #date.display(date-format)\
      #author.name
      #v(1em)
      #text(18.6pt)[#extra]
    ]

    cetz.canvas(
      import cetz.draw: *
    )

  }

  polylux-slide(content)
}
