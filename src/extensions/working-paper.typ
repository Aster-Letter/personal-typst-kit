#import "../foundation/context.typ": active-theme

#let statement-kind = "personal-typst-kit-working-paper-statement"
#let statement-counter = counter(figure.where(kind: statement-kind))
#let statement-state = state("personal-typst-kit-working-paper-statement-state", (
  section: none,
  local: 0,
  labels: (:),
))

#let statement-numbering(..numbers) = context {
  let values = numbers.pos()
  let global = values.last()
  statement-state.get().labels.at(str(global), default: numbering("1", global))
}

#let statement(body, label, title: none) = figure(
  kind: statement-kind,
  supplement: label,
  numbering: statement-numbering,
  context {
    let theme = active-theme.get()
    assert(theme != none, message: "working-paper statements must be used inside a personal-typst-kit profile")
    let heading-color = theme.colors.at("heading", default: theme.colors.accent)
    let global = statement-counter.get().first()
    let section-values = counter(heading).get()
    let section = if section-values.len() > 0 { section-values.first() } else { 0 }
    let snapshot = statement-state.get()
    let local = if snapshot.section == section { snapshot.local + 1 } else { 1 }
    let rendered-number = if section > 0 { str(section) + "." + str(local) } else { str(local) }
    let labels = snapshot.labels
    labels.insert(str(global), rendered-number)
    statement-state.update((section: section, local: local, labels: labels))
    align(left)[
      #block(
        width: 100%,
        inset: (left: 0.8em),
        stroke: (left: theme.spacing.line-width + theme.colors.line),
      )[
        #set par(first-line-indent: 0em)
        #text(font: theme.fonts.heading, weight: "semibold", fill: heading-color)[
          #label #rendered-number
          #if title != none [（#title）]
        ]
        #h(0.65em)
        #body
      ]
    ]
  },
)

#let theorem(body, title: none) = statement(body, [定理], title: title)
#let lemma(body, title: none) = statement(body, [引理], title: title)
#let proposition(body, title: none) = statement(body, [命题], title: title)
#let definition(body, title: none) = statement(body, [定义], title: title)

#let proof(body, title: [证明]) = context {
  let theme = active-theme.get()
  assert(theme != none, message: "proof must be used inside a personal-typst-kit profile")
  block(width: 100%)[
    #set par(first-line-indent: 0em)
    #text(font: theme.fonts.heading, weight: "semibold")[#title：]
    #body
    #align(right)[□]
  ]
}

#let remark(body, title: [注]) = context {
  let theme = active-theme.get()
  assert(theme != none, message: "remark must be used inside a personal-typst-kit profile")
  block(
    width: 100%,
    inset: (left: 0.8em),
    stroke: (left: theme.spacing.line-width + theme.colors.line),
  )[
    #set par(first-line-indent: 0em)
    #text(font: theme.fonts.heading, weight: "semibold")[#title：]
    #body
  ]
}

#let acknowledgements(body, title: [致谢], outlined: true) = {
  assert(type(outlined) == bool, message: "acknowledgements outlined must be bool")
  heading(numbering: none, outlined: outlined)[#title]
  body
}

#let appendix-numbering(..numbers) = {
  let values = numbers.pos()
  if values.len() == 1 {
    [附录 #numbering("A", values.first())]
  } else {
    [#numbering("A", values.first()).#numbering("1.1", ..values.slice(1))]
  }
}

#let appendices(body) = {
  counter(heading).update(0)
  set heading(numbering: appendix-numbering)
  body
}
