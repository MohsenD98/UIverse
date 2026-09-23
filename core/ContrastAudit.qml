import QtQuick
import "contrast.mjs" as Contrast

QtObject {
    id: audit

    required property Tokens tokens

    readonly property real textMinimum: 4.5
    readonly property real graphicMinimum: 3
    readonly property var card: Contrast.composite(tokens.surface, tokens.background)
    readonly property bool outlined: tokens.borderWidth >= 2
    readonly property color controlEdge: outlined ? tokens.border : tokens.accent

    readonly property var checks: [check("Text on the page", tokens.text, tokens.background, textMinimum), check("Muted text on the page", tokens.textMuted, tokens.background, textMinimum), check("Text on a card", tokens.text, card, textMinimum), check("Muted text on a card", tokens.textMuted, card, textMinimum), check("Button label", tokens.textOnAccent, tokens.accent, textMinimum), check(outlined ? "Control outlines against the page" : "Accent against the page", controlEdge, tokens.background, graphicMinimum)]
    readonly property int failures: checks.filter(item => !item.passes).length

    function check(label: string, foreground: color, background: var, minimum: real): var {
        const value = Contrast.ratio(foreground, background)
        return {
            "label": label,
            "foreground": foreground,
            "background": Qt.rgba(background.r, background.g, background.b, 1),
            "ratio": value,
            "minimum": minimum,
            "passes": value >= minimum
        }
    }
}
