export const about = {
    tagline: "A grid of tiles, sized by importance.",
    era: "Windows Phone tiles, then Apple's product pages",
    summary: "Bento splits the screen into rounded tiles of different sizes, like a lunch box. Each tile holds one thing, and bigger tiles matter more. Most of the style is layout: the widgets are the same ones every other style uses, only arranged differently.",
    dos: [
        "Put one idea in each tile.",
        "Make the most important tile clearly bigger.",
        "Keep gaps small and the same everywhere.",
        "Use the same corner radius on every tile.",
        "Lead with a big number or picture, then a small label."
    ],
    donts: [
        "Tiles that are all the same size",
        "Borders around tiles",
        "Tiles that need to scroll",
        "An order that fights normal reading order"
    ],
    reading: [
        {
            label: "Bento Grids, a curated gallery",
            url: "https://bentogrids.com/"
        },
        {
            label: "Metro design language",
            url: "https://en.wikipedia.org/wiki/Metro_(design_language)"
        }
    ],
    worksWith: [
        {
            law: "commonRegion",
            note: "Each tile is one group, no question about it."
        },
        {
            law: "miller",
            note: "A screen of a few tiles is easy to take in."
        },
        {
            law: "vonRestorff",
            note: "The big tile is the one people notice first."
        }
    ],
    worksAgainst: [
        {
            law: "serialPosition",
            note: "Tiles have no fixed order, so nothing is reliably first or last."
        },
        {
            law: "hick",
            note: "Many tiles of similar weight give the eye more to choose from."
        }
    ]
};
