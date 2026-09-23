export const about = {
    tagline: "Frosted panels floating over color.",
    era: "Windows Vista, iOS 7, then macOS Big Sur and Fluent",
    summary: "Glassmorphism uses see-through, blurred panels over a colorful background. The blur is what separates a panel from what's behind it, so the background needs color and some movement. It is the easiest style here to make unreadable, and the heaviest to draw: every panel blurs the area behind it on each frame.",
    dos: [
        "Blur what is actually behind the panel.",
        "Put something colorful behind the glass.",
        "Give each panel a thin, light border.",
        "Use a few large panels rather than many small ones.",
        "Check text contrast over the brightest part of the background."
    ],
    donts: [
        "More than two layers of glass",
        "Small or thin text on glass",
        "Relying on blur alone to group things",
        "A background busy enough to distract"
    ],
    reading: [
        {
            label: "Michal Malewicz: Glassmorphism in user interfaces",
            url: "https://uxdesign.cc/glassmorphism-in-user-interfaces-1f39bb1308c9"
        },
        {
            label: "Microsoft Fluent: Acrylic material",
            url: "https://learn.microsoft.com/en-us/windows/apps/design/style/acrylic"
        }
    ],
    worksWith: [
        {
            law: "aestheticUsability",
            note: "It looks polished, and people forgive polished things."
        },
        {
            law: "commonRegion",
            note: "Each frosted panel is a clear region."
        }
    ],
    worksAgainst: [
        {
            law: "pragnanz",
            note: "Blurred edges and moving color make shapes harder to read."
        },
        {
            law: "doherty",
            note: "Blurring every panel on every frame can make weak hardware lag."
        }
    ]
};
