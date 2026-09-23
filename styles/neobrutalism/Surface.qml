import QtQuick

HardBox {
    cornerRadius: tokens.radiusMd
    shadowOffset: variant === "quiet" ? 0 : tokens.shadowOffsetX
    faceColor: {
        switch (variant) {
        case "accent":
            return tokens.accent
        case "quiet":
            return tokens.surfaceAlt
        default:
            return tokens.surface
        }
    }
}
