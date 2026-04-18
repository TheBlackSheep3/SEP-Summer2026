#import "@preview/polylux:0.4.0": slide as polylux-slide
#import "@preview/cetz:0.4.2"

#let m-dark-orange = rgb(255, 152, 0)
#let m-granat = rgb(176, 47, 44)
#let m-karneol = rgb(214, 66, 66)
#let m-aquamarin = rgb(138, 194, 209)
#let m-light-gray = rgb(201, 201, 201)
#let m-gray = rgb(128, 128, 128)
#let m-basalt = rgb(38, 42, 49)

#let m-subtitle = state("m-subtitle", none)
#let m-shorttitle = state("m-shorttitle", none)

#let m-pages = counter("m-page")

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
    paper: "presentation-16-9",
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
    m-pages.update(1)
    context {
      image("images/logo_leipzig.svg", height: 0.23175225 * page.height)
    }
    let subtitle = context m-subtitle.get()
    if subtitle != none {
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
      #text(32pt)[*#context document.title*]

      #context document.date.display(date-format)\
      #context document.author.join(", ")
      #v(1em)
      #text(18.6pt)[#extra]
    ]
    m-pages.step()
  }

  polylux-slide(content)
}

#let typst-heading = heading

// Basic slide function.
//
// - heading: (Optional) heading of the slide.
#let slide(
  heading: none,
  body
) = {
  set page(
    margin: (left: 6.8%, right: 7%, bottom: 13%),
    background: context {
      let w = page.width
      let h = page.height
      set par(leading: 1.4pt)
      cetz.canvas(length: w, {
        import cetz.draw: *
        let r = 1   // right edge
        let b = h/w // bottom edge
        set-transform(cetz.matrix.transform-scale((1, 1)))
        rect((0,0), (1, b), stroke: none, fill: none)
        line((0.068, 0.88 * b), (0.93, 0.88 * b), stroke: m-karneol+0.4pt)
        line((0.068, 0.885 * b), (0.93, 0.885 * b), stroke: m-gray+0.4pt)
        line((0.07, 0.89 * b), (0.07, 0.98 * b), stroke: m-gray+0.8pt)
        content((0.078, 0.935 * b), text(size: 12.6pt, black)[UNIVERSITÄT\ LEIPZIG], anchor: "west")
        content((0.93, 0.935 * b), text(size: 12.6pt, m-karneol)[#context m-pages.get().first()], anchor: "east")
      })
    },
  )
  let content = {
    show: align.with(horizon)
    m-pages.step()
    if heading != none {
      align(top+left, typst-heading(level: 1, heading))
    }
    body
  }

  polylux-slide(content)
}
