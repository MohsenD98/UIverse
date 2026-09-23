pragma Singleton
import QtQuick

QtObject {
    property StylePack pack
    property Item backdrop

    readonly property Tokens fallback: Tokens {}
    readonly property Tokens tokens: pack ? pack.tokens : fallback
}
