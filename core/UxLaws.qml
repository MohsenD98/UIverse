pragma Singleton
import QtQuick
import "uxLaws.mjs" as Data

QtObject {
    readonly property var all: Data.laws

    function find(key: string): var {
        return all.find(law => law.key === key) ?? null
    }
}
