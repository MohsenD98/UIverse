import QtQuick

GlassPanel {
    corner: variant === "accent" ? tokens.radiusSm : tokens.radiusLg
    tint: variant === "accent" ? Qt.alpha(tokens.accent, 0.55) : variant === "quiet" ? Qt.alpha(tokens.text, 0.04) : tokens.surface
    rim: variant === "accent" ? Qt.alpha(tokens.accent, 0.8) : tokens.border
    raised: variant !== "quiet" && height > tokens.unit * 6
}
