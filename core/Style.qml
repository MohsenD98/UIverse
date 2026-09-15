pragma Singleton
import QtQuick

QtObject {
    property StylePack pack
    property Item backdrop

    readonly property Tokens fallback: Tokens {}
    readonly property Tokens t: pack ? pack.tokens : fallback
}
