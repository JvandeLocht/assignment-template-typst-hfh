#import "/layout/cover.typ": *
#import "/layout/titlepage.typ": *
#import "/layout/disclaimer.typ": *
#import "/layout/acknowledgement.typ": acknowledgement as acknowledgement_layout
#import "/layout/confidential_clause.typ": confidential_clause as confidential_clause_layout
#import "/layout/transparency_ai_tools.typ": transparency_ai_tools as transparency_ai_tools_layout
#import "/layout/abstract.typ": *
#import "/layout/acronyms.typ": *
#import "/utils/print_page_break.typ": *

#let thesis(
  title: "",
  titleGerman: "",
  degree: "",
  program: "",
  supervisor: "",
  advisors: (),
  author: "",
  matriculationNumber: "",
  startDate: datetime,
  submissionDate: datetime,
  abstract_en: "",
  abstract_de: "",
  acknowledgement: "",
  confidential_clause: "",
  transparency_ai_tools: "",
  is_print: false,
  body,
  init-acronyms: (()),
) = {
  cover(
    title: title,
    degree: degree,
    program: program,
    author: author,
  )

  pagebreak()

  titlepage(
    title: title,
    titleGerman: titleGerman,
    degree: degree,
    program: program,
    supervisor: supervisor,
    advisors: advisors,
    author: author,
    startDate: startDate,
    submissionDate: submissionDate
  )

  print_page_break(print: is_print, to: "even")

  // disclaimer(
  //   title: title,
  //   degree: degree,
  //   author: author,
  //   submissionDate: submissionDate
  // )
  confidential_clause_layout(confidential_clause)

  // print_page_break(print: is_print)
  
  // acknowledgement_layout(acknowledgement)

  print_page_break(print: is_print)

  // abstract(lang: "en")[#abstract_en]
  // abstract(lang: "de")[#abstract_de]


  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    number-align: right,
    header: author + [#h(1fr) Matrikelnummer: ] + matriculationNumber,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )
  
  show math.equation: set text(weight: 400)

  // --- Headings ---
  show heading: set block(below: 0.85em, above: 1.75em)
  show heading: set text(font: body-font)
  set heading(numbering: "1.1")
  // Reference first-level headings as "chapters"
  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading and el.level == 1 {
      [Chapter ]
      numbering(
        el.numbering,
        ..counter(heading).at(el.location())
      )
    } else {
      it
    }
  }

  // --- Paragraphs ---
  set par(leading: 1em)

  // --- Citations ---
  set cite(style: "alphanumeric")

  // --- Figures ---
  show figure: set text(size: 0.85em)

  // --- Table of Contents ---
  set page(numbering: "I")
  counter(page).update(1)
  outline(
    title: {
      text(font: body-font, 1.5em, weight: 700, "Inhaltsverzeichnis")
      v(15mm)
    },
    indent: 2em
  )
  
  
  v(2.4fr)

  // List of figures.
  pagebreak()
  heading(numbering: none)[Abbildungsverzeichnis]
  outline(
    title:"",
    target: figure.where(kind: image),
  )

  // List of tables.
  pagebreak()
  heading(numbering: none)[Tabellenverzeichnis]
  outline(
    title: "",
    target: figure.where(kind: table)
  )

  // --- list of acronyms ---
  pagebreak()
  heading(numbering: none)[Abkürzungsverzeichnis]
  print-index(title: "") 

  // Main body.
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    number-align: right,
    numbering: "1"
  )
  set par(justify: true, first-line-indent: 2em)

  body


  // Appendix.
  pagebreak()
  heading(numbering: none)[Appendix A: Supplementary Material]
  include("/layout/appendix.typ")

  pagebreak()
  bibliography("/thesis.bib")
  transparency_ai_tools_layout(transparency_ai_tools)

  set page(
    margin: (left: 5mm, right: 5mm, top: 5mm, bottom: 5mm),
    header: "",
    numbering: none
  )
  image("/figures/Eigenständigkeitserklärung.svg")
}
