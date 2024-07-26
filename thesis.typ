#import "/layout/thesis_template.typ": *
#import "/metadata.typ": *
#set document(title: titleEnglish, author: author)

#init-acronyms

#show: thesis.with(
  title: titleEnglish,
  titleGerman: titleGerman,
  degree: degree,
  program: program,
  supervisor: supervisor,
  advisors: advisors,
  author: author,
  matriculationNumber: matriculationNumber,
  startDate: startDate,
  submissionDate: submissionDate,
  init-acronyms: init-acronyms,
  abstract_en: include "/content/abstract_en.typ",
  abstract_de: include "/content/abstract_de.typ",
  acknowledgement: include "/content/acknowledgement.typ",
  confidential_clause: include "/content/confidential_clause.typ",
  transparency_ai_tools: include "/content/transparency_ai_tools.typ",
)

#include "/content/introduction.typ"
#include "/content/background.typ"
#include "/content/related_work.typ"
#include "/content/requirements_analysis.typ"
#include "/content/system_design.typ"
#include "/content/evaluation.typ"
#include "/content/summary.typ"
