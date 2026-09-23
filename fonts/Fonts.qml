pragma Singleton
import QtQuick

QtObject {
    readonly property FontLoader interFont: FontLoader {
        source: "Inter.ttf"
    }
    readonly property FontLoader archivoBlackFont: FontLoader {
        source: "ArchivoBlack.ttf"
    }
    readonly property FontLoader spaceGroteskFont: FontLoader {
        source: "SpaceGrotesk.ttf"
    }
    readonly property FontLoader jetBrainsMonoFont: FontLoader {
        source: "JetBrainsMono.ttf"
    }

    readonly property string inter: interFont.name
    readonly property string archivoBlack: archivoBlackFont.name
    readonly property string spaceGrotesk: spaceGroteskFont.name
    readonly property string jetBrainsMono: jetBrainsMonoFont.name
}
