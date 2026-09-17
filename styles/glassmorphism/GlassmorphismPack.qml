import QtQuick
import UIverse.Core

StylePack {
    key: "glassmorphism"
    name: "Glassmorphism"
    tagline: "Depth from what is behind, not from what is drawn."
    era: "Vista Aero → iOS 7 → Big Sur & Fluent Acrylic 2020+"
    swatch: "#8b9dff"

    summary: "Glassmorphism builds hierarchy out of translucency: panels are frosted " + "sheets floating over a colourful backdrop, and the blur is what separates " + "them from it. It only works when there is something worth blurring and the " + "text on top stays readable. It is the most fragile style in the lab, and the " + "most expensive to render: every pane samples and blurs the page behind it " + "on every frame."

    rules: ["Blur the real backdrop. A flat translucent fill is not glass.", "Give the backdrop colour and movement; glass over a flat colour is just grey.", "A thin light rim defines each pane, where light would catch the edge.", "Keep panes few and large. Many small panes turn to mud.", "Check text contrast against the brightest part of the backdrop, not the average."]

    antiRules: ["No glass on glass on glass. Two layers at most.", "No small text or thin weights on translucent surfaces.", "Do not rely on blur alone for grouping; reduced-transparency users lose it.", "Do not animate the backdrop so much that it pulls focus from content."]

    reading: [
        {
            "label": "Michal Malewicz — Glassmorphism in user interfaces",
            "url": "https://uxdesign.cc/glassmorphism-in-user-interfaces-1f39bb1308c9"
        },
        {
            "label": "Microsoft Fluent — Acrylic material",
            "url": "https://learn.microsoft.com/en-us/windows/apps/design/style/acrylic"
        }
    ]

    tokens: Tokens {
        bg: "#0d0f2b"
        bgAlt: "#1a0f33"
        surface: "#1affffff"
        surfaceAlt: "#29ffffff"
        text: "#f5f7ff"
        textMuted: "#b4bade"
        accent: "#8b9dff"
        textOnAccent: "#0b0d24"
        border: "#38ffffff"
        success: "#6ee7b7"
        warning: "#fcd34d"
        danger: "#fca5a5"
        palette: ["#7c3aed", "#2563eb", "#db2777", "#0891b2"]

        radiusSm: 10
        radiusMd: 14
        radiusLg: 22
        borderWidth: 1
        unit: 8
        controlHeight: 40
        pagePadding: 40
        gridGap: 20

        fontSizeXs: 11
        fontSizeSm: 13
        fontSizeMd: 15
        fontSizeLg: 18
        fontSizeXl: 28
        displaySize: 44
        weightBody: Font.Normal
        weightMedium: Font.DemiBold
        weightDisplay: Font.DemiBold
        letterSpacingDisplay: -0.6
        letterSpacingLabel: 0.3
        lineHeight: 1.45

        surfaceMode: "glass"
        blurAmount: 48
        shadowColor: "#05061a"
        shadowOpacity: 0.45
        shadowBlur: 36
        shadowOffsetY: 14
        durationFast: 160
        durationBase: 280
        easingType: Easing.OutCubic
        layoutMode: "stack"
        decorative: true
    }

    pageBackground: Component {
        Aurora {}
    }
    surface: Component {
        Surface {}
    }
    buttonBackground: Component {
        ButtonBackground {}
    }
    buttonContent: Component {
        ButtonContent {}
    }
    fieldBackground: Component {
        Field {}
    }
    switchIndicator: Component {
        SwitchIndicator {}
    }
    sliderGroove: Component {
        SliderGroove {}
    }
    sliderHandle: Component {
        SliderHandle {}
    }
    progressTrack: Component {
        ProgressTrack {}
    }
    tagBackground: Component {
        TagBackground {}
    }
    divider: Component {
        SlotRect {
            color: t.border
        }
    }
}
