pragma Singleton
import QtQuick

QtObject {
    property StylePack pack
    property Item backdrop

    readonly property real minimumTargetSize: 44

    readonly property Tokens fallback: Tokens {}
    readonly property Tokens tokens: pack ? pack.tokens : fallback
}
