#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/cetz:0.4.2"

#let m-dark-orange = rgb(255, 152, 0)
#let m-granat = rgb(176, 47, 44)
#let m-karneol = rgb(214, 66, 66)
#let m-aquamarin = rgb(138, 194, 209)
#let m-light-gray = rgb(201, 201, 201)
#let m-basalt = rgb(38, 42, 49)

#let m-subtitle = state("m-subtitle", none)
#let m-shorttitle = state("m-shorttitle", none)

// Theming, show rules and meta data
//
// - title: Presentation title.
// - author: List of authors.
// - subtitle: (Optional) subtitle for more info.
// - short-title: (Optional) short title for the header.
// - date: (Optional) date of the presentation.
#let leipzig-theme(
  title: [],
  author: ("Your Name",),
  subtitle: none,
  short-title: none,
  date: datetime.today(),
  body
) = {
  set document(
    title: title,
    author: author,
    date: date,
  )
  m-subtitle.update(subtitle)
  m-shorttitle.update(short-title)

  set page(
    paper: "presentation-169",
    margin: (x: 54.7pt, y: 26.5pt)
  )
  set text(font: "Arial", fill: black, 20.2pt)

   body
}


// Declare the title slide.
//
// - logo: (Optional) institution / faculty logo.
// - date-format: (Optional) date format to display the presentation date.
// - extra: (Optional) info below the date and author, like the faculty.
#let title-slide(
  logo: none,
  date-format: "[month repr:long] [day], [year]",
  extra: none,
) = {
  set page(background: context {
      let w = page.width
      let h = page.height
      set align(right)
      cetz.canvas(length: w, {
        import cetz.draw: *
        let r = 1   // right edge
        let b = h/w // bottom edge
        set-transform(cetz.matrix.transform-scale((1, 1)))
        stroke(none)
        line((0.65 * r, b), (r, b), (r, 0.65 * b), close: true, fill: m-aquamarin)
        line((0.895 * r, b), (r, b), (r, 0.65 * b), (0.925 * r, 0.725 * b), close: true, fill: m-karneol)
        line((r, 0.65 * b), (0.925 * r, 0.725 * b), (r , 0), close: true, fill: m-granat)
      })
    }
  )
  let content = {
    context {
      image("images/logo_leipzig.svg", height: 0.23175225 * page.height)
    }
    if short-title != none {
      place(center)[
        #set text(26pt)
        #align(center)[#subtitle]
      ]
    }
    if logo != none {
      context {
        set image(height: 0.186 * page.height)
        place(logo, dx: 58%, dy: 80pt)
      }
    }
    v(50pt)
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
