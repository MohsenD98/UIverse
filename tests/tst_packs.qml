import QtQuick
import QtTest
import UIverse.Core
import UIverse.Kit
import UIverse.Styles

Item {
    width: 400
    height: 300

    UvButton {
        id: button

        text: "Button"
    }

    UvSlider {
        id: slider
    }

    UvSwitch {
        id: toggle
    }

    UvTextField {
        id: field
    }

    UvProgressBar {
        id: bar
    }

    UvSurface {
        id: surface
    }

    UvTag {
        id: tag

        text: "Tag"
    }

    UvDivider {
        id: divider
    }

    TestCase {
        name: "Packs"
        when: windowShown

        function slotsOf() {
            return [button.background, button.contentItem, slider.background, slider.handle, toggle.indicator, field.background, bar.contentItem, surface.children[0], tag.children[0], divider.children[0]]
        }

        function test_everyPackFillsEverySlot_data() {
            return StyleRegistry.packs.map(pack => ({
                        "tag": pack.key,
                        "key": pack.key
                    }))
        }

        function test_everyPackFillsEverySlot(data) {
            StyleRegistry.select(data.key)
            compare(Style.pack.key, data.key)
            for (const slot of slotsOf()) {
                verify(slot.item !== null, `${data.key}: ${slot.part} is empty`)
            }
        }

        function test_everyPackDescribesItself_data() {
            return test_everyPackFillsEverySlot_data()
        }

        function test_everyPackDescribesItself(data) {
            StyleRegistry.select(data.key)
            verify(Style.pack.tagline.length > 0, "tagline")
            verify(Style.pack.summary.length > 0, "summary")
            verify(Style.pack.dos.length > 0, "dos")
            verify(Style.pack.donts.length > 0, "donts")
        }
    }
}
