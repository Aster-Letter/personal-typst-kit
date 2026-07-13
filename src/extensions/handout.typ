#import "../components/callouts.typ": callout

#let learning-objectives(..items) = {
  let values = items.pos()
  assert(values.len() > 0, message: "learning-objectives requires at least one item")
  callout(kind: "tip", title: [学习目标])[
    #list(..values)
  ]
}

#let definition-box(term, body) = callout(kind: "note", title: [定义：#term])[#body]

#let worked-example(body, title: [例题]) = callout(kind: "tip", title: title)[#body]

#let exercise(body, title: [练习], points: none) = callout(kind: "warning", title: [
  #title#if points != none [（#points 分）]
])[#body]

#let lesson-summary(..items) = {
  let values = items.pos()
  assert(values.len() > 0, message: "lesson-summary requires at least one item")
  callout(kind: "note", title: [本节小结])[
    #list(..values)
  ]
}
