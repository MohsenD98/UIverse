import QtQuick

GlassPanel {
    cornerRadius: variant === "accent" ? tokens.radiusSm : tokens.radiusLg
    tintColor: {
        switch (variant) {
        case "accent":
            return Qt.alpha(tokens.accent, 0.55)
        case "quiet":
            return Qt.alpha(tokens.text, 0.04)
        default:
            return tokens.surface
        }
    }
    rimColor: variant === "accent" ? Qt.alpha(tokens.accent, 0.8) : tokens.border
    raised: variant !== "quiet" && height > tokens.unit * 6
}
