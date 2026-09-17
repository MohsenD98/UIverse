import QtQuick

GlassPanel {
    corner: variant === "accent" ? t.radiusSm : t.radiusLg
    tint: variant === "accent" ? Qt.alpha(t.accent, 0.55) : variant === "quiet" ? Qt.alpha(t.text, 0.04) : t.surface
    rim: variant === "accent" ? Qt.alpha(t.accent, 0.8) : t.border
    raised: variant !== "quiet" && height > t.unit * 6
}
