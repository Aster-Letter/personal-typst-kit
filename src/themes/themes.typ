#import "../foundation/config.typ": ensure-dictionary, reject-unknown

#let font-defaults = (
  body: (
    "Noto Serif SC",
  ),
  heading: (
    "Noto Sans SC",
  ),
  mono: (
    "DejaVu Sans Mono",
  ),
)

#let type-scale-defaults = (
  body: 11pt,
  small: 9pt,
  code: 9pt,
  title: 22pt,
  subtitle: 13pt,
  h1: 17pt,
  h2: 14pt,
  h3: 12pt,
)

#let spacing-defaults = (
  leading: 0.72em,
  paragraph-gap: 0.55em,
  block-gap: 0.8em,
  radius: 3pt,
  line-width: 0.7pt,
)

#let semantic-colors = (
  text: rgb("#20242b"),
  muted: rgb("#667085"),
  line: rgb("#d0d5dd"),
  surface: rgb("#f6f7f9"),
  success: rgb("#2f855a"),
  success-soft: rgb("#edf8f1"),
  warning: rgb("#b7791f"),
  warning-soft: rgb("#fff8e8"),
  danger: rgb("#c2413c"),
  danger-soft: rgb("#fff1f0"),
)

#let make-theme(name, accent, accent-soft) = (
  name: name,
  colors: semantic-colors + (
    accent: accent,
    accent-soft: accent-soft,
    heading: accent,
    link: accent,
  ),
  fonts: font-defaults,
  type-scale: type-scale-defaults,
  spacing: spacing-defaults,
)

#let themes = (
  teal: make-theme("teal", rgb("#307e86"), rgb("#edf7f7")),
  ink: make-theme("ink", rgb("#3f4858"), rgb("#f0f2f5")),
  warm: make-theme("warm", rgb("#a56532"), rgb("#fcf3e9")),
  blue: make-theme("blue", rgb("#2f6fa8"), rgb("#edf4fb")),
  academic: make-theme("academic", rgb("#7a1f2b"), rgb("#f8f3f4")) + (
    colors: semantic-colors + (
      accent: rgb("#7a1f2b"),
      accent-soft: rgb("#f8f3f4"),
      heading: rgb("#171717"),
      link: rgb("#7a1f2b"),
    ),
    fonts: (
      body: ("Noto Serif SC",),
      heading: ("Noto Serif SC",),
      mono: ("DejaVu Sans Mono",),
    ),
    type-scale: type-scale-defaults + (
      body: 11pt,
      title: 20pt,
      subtitle: 12pt,
      h1: 14pt,
      h2: 12pt,
      h3: 11pt,
    ),
    spacing: spacing-defaults + (
      leading: 0.68em,
      paragraph-gap: 0.3em,
      block-gap: 0.85em,
      radius: 1.5pt,
      line-width: 0.55pt,
    ),
  ),
)

#let theme-with(
  base,
  colors: (:),
  fonts: (:),
  type-scale: (:),
  spacing: (:),
) = {
  ensure-dictionary("theme", base)
  reject-unknown("theme colors", colors, base.colors.keys())
  reject-unknown("theme fonts", fonts, base.fonts.keys())
  reject-unknown("theme type-scale", type-scale, base.type-scale.keys())
  reject-unknown("theme spacing", spacing, base.spacing.keys())
  base + (
    colors: base.colors + colors,
    fonts: base.fonts + fonts,
    type-scale: base.type-scale + type-scale,
    spacing: base.spacing + spacing,
  )
}
