pragma Singleton
import QtQuick

QtObject {
    readonly property var engagement: [42, 55, 48, 61, 58, 70, 66, 74, 69, 82, 78, 91]

    readonly property var activity: [
        { "title": "Q3 retention report published", "meta": "Sara K. · 12 min ago", "status": "Live", "tone": "success" },
        { "title": "Checkout funnel dropped below target", "meta": "Monitor · 1 h ago", "status": "Alert", "tone": "danger" },
        { "title": "Cohort export scheduled", "meta": "Automation · 3 h ago", "status": "Queued", "tone": "warning" },
        { "title": "Dashboard shared with Growth", "meta": "Ali R. · Yesterday", "status": "Shared", "tone": "neutral" }
    ]
}
