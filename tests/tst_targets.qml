import QtQuick
import QtTest
import UIverse.Core
import UIverse.Kit

Item {
    width: 400
    height: 400

    Column {
        UvButton {
            id: button

            text: "Go"
        }

        UvTextField {
            id: field
        }

        UvSwitch {
            id: toggle
        }

        UvSlider {
            id: slider
        }
    }

    SignalSpy {
        id: clicks

        target: button
        signalName: "clicked"
    }

    TestCase {
        name: "Targets"
        when: windowShown

        function test_interactiveControlsMeetMinimumSize_data() {
            return [
                {
                    "tag": "button",
                    "control": button
                },
                {
                    "tag": "field",
                    "control": field
                },
                {
                    "tag": "switch",
                    "control": toggle
                },
                {
                    "tag": "slider",
                    "control": slider
                }
            ]
        }

        function test_interactiveControlsMeetMinimumSize(data) {
            verify(data.control.height >= Style.minimumTargetSize)
        }

        function test_buttonKeepsItsVisualHeight() {
            compare(button.background.height, button.visualHeight)
        }

        function test_clickAboveTheVisibleButtonCounts() {
            clicks.clear()
            mouseClick(button, button.width / 2, 1)
            compare(clicks.count, 1)
        }
    }
}
