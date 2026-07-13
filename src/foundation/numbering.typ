// Native Typst numbering presets. No hand-maintained upper bound.

#let cjk-paper-numbering(..numbers) = {
  let values = numbers.pos()
  let parts = ()
  for (index, value) in values.enumerate() {
    if index == 0 {
      parts.push([#numbering("一", value)、])
    } else if index == 1 {
      parts.push([（#numbering("一", value)）])
    } else {
      parts.push([#numbering("1", value).])
    }
  }
  parts.join("")
}

#let chapter-numbering(..numbers) = {
  let values = numbers.pos()
  if values.len() == 1 {
    [第#numbering("一", values.first())章]
  } else {
    numbering("1.1", ..values)
  }
}

#let decimal-numbering(..numbers) = numbering("1.1", ..numbers.pos())
#let roman-outline-numbering(..numbers) = numbering("I.i.1", ..numbers.pos())

#let numbering-presets = (
  cjk-paper: cjk-paper-numbering,
  chapter: chapter-numbering,
  decimal: decimal-numbering,
  roman-outline: roman-outline-numbering,
)
