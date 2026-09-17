pragma Singleton
import QtQuick
import UIverse.Core
import UIverse.Styles.Minimalism as Minimalism
import UIverse.Styles.NeoBrutalism as NeoBrutalism
import UIverse.Styles.Glassmorphism as Glassmorphism
import UIverse.Styles.Bento as Bento

QtObject {
    id: registry

    readonly property list<StylePack> packs: [
        Minimalism.MinimalismPack {},
        NeoBrutalism.NeoBrutalismPack {},
        Glassmorphism.GlassmorphismPack {},
        Bento.BentoPack {}
    ]

    property int currentIndex: 0

    readonly property StylePack current: packs[currentIndex]

    function indexOfKey(key: string): int {
        for (let i = 0; i < packs.length; ++i) {
            if (packs[i].key === key)
                return i
        }
        return -1
    }

    function select(key: string): void {
        const i = indexOfKey(key)
        if (i >= 0)
            currentIndex = i
    }

    function step(delta: int): void {
        currentIndex = (currentIndex + delta + packs.length) % packs.length
    }

    onCurrentChanged: Style.pack = current
    Component.onCompleted: Style.pack = current
}
