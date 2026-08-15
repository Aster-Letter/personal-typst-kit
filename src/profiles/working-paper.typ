#import "../themes/themes.typ": themes
#import "../foundation/numbering.typ": numbering-presets
#import "../foundation/config.typ": ensure-dictionary, merge-known, normalize-meta, reject-unknown, require-key, validate-choice
#import "../foundation/base.typ": base-style, draft-background, page-footer, page-header, render-bibliography, render-keywords, render-outline

#let author-defaults = (
  name: none,
  affiliation: none,
  email: none,
  corresponding: false,
  note: none,
)

#let normalize-author(entry, index) = {
  ensure-dictionary("working-paper meta.authors.at(" + str(index) + ")", entry)
  let name = "working-paper meta.authors.at(" + str(index) + ")"
  let result = merge-known(name, author-defaults, entry)
  require-key(name, result, "name")
  assert(type(result.corresponding) == bool, message: name + ".corresponding must be bool")
  assert(result.email == none or type(result.email) == str, message: name + ".email must be a string")
  result
}

#let normalize-authors(meta) = {
  assert(not (meta.author != none and meta.authors != none), message: "working-paper meta.author and meta.authors cannot both be provided")
  let values = if meta.authors != none {
    assert(type(meta.authors) == array, message: "working-paper meta.authors must be an array")
    meta.authors
  } else if meta.author != none {
    ((name: meta.author),)
  } else {
    ()
  }
  values.enumerate().map(pair => normalize-author(pair.at(1), pair.at(0)))
}

#let normalize-english(value) = {
  if value == none {
    none
  } else {
    ensure-dictionary("working-paper meta.english", value)
    let result = merge-known("working-paper meta.english", (
      title: none,
      abstract: none,
      keywords: none,
    ), value)
    require-key("working-paper meta.english", result, "title")
    require-key("working-paper meta.english", result, "abstract")
    result
  }
}

#let option-defaults = (
  paper: "a4",
  margin: 2.54cm,
  front-matter: "cover-toc",
  toc-depth: 3,
  numbering: none,
  page-numbering-start: "body",
  header: false,
  draft-mode: "hide",
  bibliography: none,
)

#let normalize-working-options(options) = {
  let result = merge-known("working-paper options", option-defaults, options)
  validate-choice("working-paper options.front-matter", result.front-matter, ("cover-toc", "title-page", "inline"))
  validate-choice("working-paper options.page-numbering-start", result.page-numbering-start, ("document", "body"))
  validate-choice("working-paper options.draft-mode", result.draft-mode, ("show", "hide", "error"))
  assert(type(result.toc-depth) == int and result.toc-depth >= 1, message: "working-paper options.toc-depth must be a positive integer")
  assert(type(result.header) == bool, message: "working-paper options.header must be bool")
  result
}

#let render-author(author, theme) = align(center)[
  #set par(first-line-indent: 0em)
  #text(font: theme.fonts.heading, weight: "semibold")[
    #author.name#if author.corresponding [#super[\*]]
  ]
  #if author.affiliation != none [
    #v(0.4em)
    #text(size: theme.type-scale.small, fill: theme.colors.muted)[#author.affiliation]
  ]
]

#let author-notes(authors, theme) = {
  let rows = ()
  let corresponding = authors.filter(author => author.corresponding)
  if corresponding.len() > 0 {
    let contacts = corresponding.map(author => if author.email == none {
      author.name
    } else {
      [#author.name（#link("mailto:" + author.email)[#author.email]）]
    })
    rows.push([\* 通讯作者：#contacts.join([；])])
  }
  for author in authors {
    if author.email != none and not author.corresponding {
      rows.push([#author.name：#link("mailto:" + author.email)[#author.email]])
    }
    if author.note != none { rows.push([#author.name：#author.note]) }
  }
  if rows.len() > 0 {
    v(1.05em)
    block(width: 88%)[
      #set par(first-line-indent: 0em, spacing: 0.42em)
      #set text(size: theme.type-scale.small, fill: theme.colors.muted)
      #rows.join(linebreak())
    ]
  }
}

#let abstract-section(title, abstract, keywords, theme, english: false, above: 2em) = {
  if abstract != none {
    block(width: 100%, above: above, below: 0.85em)[
      #set par(first-line-indent: 0em)
      #align(center)[
        #text(font: theme.fonts.heading, size: 10.5pt, weight: "semibold")[#title]
      ]
      #v(1em)
      #set text(size: 9.5pt, lang: if english { "en" } else { "zh" })
      #abstract
      #if keywords != none [
        #v(0.9em)
        #strong[#if english { [Keywords: ] } else { [关键词：] }]#render-keywords(keywords, separator: if english { [, ] } else { [、] })
      ]
    ]
  }
}

#let working-title(meta, authors, english, theme) = align(center)[
  #v(2.65em)
  #block(width: 92%)[
    #set par(first-line-indent: 0em)
    #text(font: theme.fonts.heading, size: theme.type-scale.title, weight: "bold", fill: theme.colors.at("heading", default: theme.colors.accent))[#meta.title]
    #if meta.subtitle != none [
      #v(0.85em)
      #text(size: theme.type-scale.subtitle, fill: theme.colors.muted)[#meta.subtitle]
    ]
    #if authors.len() > 0 [
      #let author-columns = if authors.len() == 4 { 2 } else { calc.min(3, authors.len()) }
      #v(2em)
      #grid(
        columns: author-columns,
        column-gutter: 1.2em,
        row-gutter: 1.35em,
        ..authors.map(author => render-author(author, theme)),
      )
      #author-notes(authors, theme)
    ]
    #if meta.organization != none [
      #v(1.05em)
      #text(size: 10pt, fill: theme.colors.accent)[#meta.organization]
    ]
    #if meta.version != none [
      #v(0.9em)
      #text(size: 9.5pt)[版本：#meta.version]
    ]
    #if meta.date != none [
      #v(0.7em)
      #text(size: 9.5pt)[日期：#meta.date]
    ]
  ]
  #align(left)[
    #abstract-section([摘 要], meta.abstract, meta.keywords, theme)
    #if english != none [
      #v(1.25em)
      #align(center)[
        #text(font: theme.fonts.heading, size: theme.type-scale.subtitle, weight: "semibold", fill: theme.colors.at("heading", default: theme.colors.accent))[#english.title]
      ]
      #abstract-section([Abstract], english.abstract, english.keywords, theme, english: true, above: 1.15em)
    ]
  ]
]

#let working-paper(meta: (:), theme: themes.academic, options: (:), body) = context {
  let meta = normalize-meta(meta)
  let authors = normalize-authors(meta)
  let english = normalize-english(meta.english)
  let opts = normalize-working-options(options)
  let heading-numbering = if opts.numbering == none { numbering-presets.decimal } else { opts.numbering }
  let inline = opts.front-matter == "inline"
  let initial-footer = opts.page-numbering-start == "document" or inline
  let running-title = if meta.short-title == none { meta.title } else { meta.short-title }

  set document(title: meta.title)
  base-style(
    theme: theme,
    numbering: heading-numbering,
    draft-mode: opts.draft-mode,
    heading-mode: "paper",
  )[
    #if target() == "html" [
      #working-title(meta, authors, english, theme)
      #if opts.front-matter == "cover-toc" [#render-outline(theme, depth: opts.toc-depth)]
      #body
      #render-bibliography(opts.bibliography)
    ] else [
      #set page(
        paper: opts.paper,
        margin: opts.margin,
        header: if inline and opts.header { page-header(theme, left: running-title) } else { none },
        footer: if initial-footer { page-footer(theme) } else { none },
        background: draft-background(theme, opts.draft-mode),
      )
      #working-title(meta, authors, english, theme)
      #if opts.front-matter != "inline" [#pagebreak()]
      #if opts.front-matter == "cover-toc" [
        #render-outline(theme, depth: opts.toc-depth)
        #pagebreak()
      ]
      #if not inline [
        #if opts.page-numbering-start == "body" [#counter(page).update(1)]
        #set page(
          header: if opts.header { page-header(theme, left: running-title) } else { none },
          footer: page-footer(theme),
        )
      ]
      #body
      #render-bibliography(opts.bibliography)
    ]
  ]
}
