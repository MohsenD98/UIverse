import QtQuick
import QtTest
import UIverse.Styles
import "../core/contrast.mjs" as Contrast

TestCase {
    name: "Contrast"

    function test_blackOnWhiteIsTheMaximum() {
        fuzzyCompare(Contrast.ratio(Qt.color("black"), Qt.color("white")), 21, 0.001)
    }

    function test_aColorAgainstItselfIsTheMinimum() {
        fuzzyCompare(Contrast.ratio(Qt.color("#8b9dff"), Qt.color("#8b9dff")), 1, 0.001)
    }

    function test_knownBorderlinePair() {
        fuzzyCompare(Contrast.ratio(Qt.color("#767676"), Qt.color("white")), 4.54, 0.01)
    }

    function test_transparentForegroundDisappearsIntoTheBackground() {
        fuzzyCompare(Contrast.ratio(Qt.rgba(0, 0, 0, 0), Qt.color("white")), 1, 0.001)
    }

    function test_everyPackMeetsWcagAA_data() {
        return StyleRegistry.packs.map(pack => ({
                    "tag": pack.key,
                    "pack": pack
                }))
    }

    function test_everyPackMeetsWcagAA(data) {
        const checks = data.pack.contrast.checks
        verify(checks.length > 0)
        for (const check of checks)
            verify(check.passes, `${check.label}: ${check.ratio.toFixed(2)}:1, needs ${check.minimum}:1`)
    }
}
