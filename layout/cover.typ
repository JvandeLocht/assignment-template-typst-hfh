#let cover(
  title: "",
  degree: "",
  program: "",
  author: "",
) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 40mm, bottom: 40mm),
    numbering: none,
    number-align: center,
  )

  let body-font = "New Computer Modern"
  let sans-font = "New Computer Modern Sans"

  set text(
    font: body-font, 
    size: 12pt, 
    lang: "en"
  )
  
  set par(leading: 1em)

  
  // --- Cover ---
  v(8mm)
  align(right, image("../figures/hfh_logo.png", width: 18%))

  v(1mm)
  align(center, text(font: sans-font, 2.5em, weight: 700, "Hamburger Fern-Hochschule"))

  v(8mm)
  align(center, text(font: sans-font, 2em, weight: 700, "Studiengang: Maschinenbau"))
  align(center, text(font: sans-font, 1.5em, weight: 100, "Studienzentrum: Essen"))

  v(8mm)

  align(center, text(font: sans-font, 2em, weight: 700, "Komplexe Übung zum Thema:"))
  align(center, text(font: sans-font, 1.5em, weight: 100, "Thema"))

  v(8mm)
  align(center, text(font: sans-font, 1.5em, weight: 100, "Modul: Projektmanagement (PRM)"))
  align(center, text(font: sans-font, 1.5em, weight: 100, "Prüfungskennzeichen: XX00-PRM-PU1"))
  v(8mm)
  align(center, text(font: sans-font, 1.5em, weight: 100, "Semester: Herbst 2024"))
  v(8mm)
  align(center, text(font: sans-font, 1.5em, weight: 100, "von"))
  align(center, text(font: sans-font, 1.5em, weight: 100, "Name | xxxxxx"))
}
