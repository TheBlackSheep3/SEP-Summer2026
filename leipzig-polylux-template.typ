#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/cetz:0.4.2": canvas, draw, matrix

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
  set page(background: context {
      let w = page.width
      let h = page.height
      canvas(length: w, {
        import draw: *
        let right-edge = 1
        let bottom-edge = h/w
        set-transform(matrix.transform-scale((1, 1)))
        stroke(none)
        line((0, 0), (0, bottom-edge), (right-edge, bottom-edge), (right-edge, 0), close: true, fill: none, stroke: none)
        line((0.65 * right-edge, 1 * bottom-edge), (1 * right-edge, 1 * bottom-edge), (1 * right-edge, 0.65 * bottom-edge), close: true, fill: m-aquamarin)
        line((0.895 * right-edge, 1 * bottom-edge), (1 * right-edge, 1 * bottom-edge), (1 * right-edge, 0.65 * bottom-edge), (0.925 * right-edge, 0.725 * bottom-edge), close: true, fill: m-karneol)
        line((1 * right-edge, 0.65 * bottom-edge), (0.925 * right-edge, 0.725 * bottom-edge), (1 * right-edge , 0 * bottom-edge), close: true, fill: m-granat)
      })
    }
  )
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
  }

  polylux-slide(content)
}
