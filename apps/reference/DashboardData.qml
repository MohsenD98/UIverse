pragma Singleton
import QtQuick

QtObject {
    readonly property var stats: [
        {
            "area": "revenue",
            "label": "Revenue",
            "value": "$48.2k",
            "delta": "+12.4%",
            "positive": true,
            "progress": 0.72
        },
        {
            "area": "users",
            "label": "Active users",
            "value": "1,980",
            "delta": "+4.1%",
            "positive": true,
            "progress": 0.54
        },
        {
            "area": "sessions",
            "label": "Avg. session",
            "value": "2m 47s",
            "delta": "−0.8%",
            "positive": false,
            "progress": 0.38
        },
        {
            "area": "churn",
            "label": "Churn",
            "value": "3.2%",
            "delta": "−1.1%",
            "positive": true,
            "progress": 0.18
        }
    ]

    readonly property var engagement: [42, 55, 48, 61, 58, 70, 66, 74, 69, 82, 78, 91]

    readonly property var activity: [
        {
            "title": "Q3 retention report published",
            "meta": "Sara K. · 12 min ago",
            "status": "Live",
            "tone": "success"
        },
        {
            "title": "Checkout funnel dropped below target",
            "meta": "Monitor · 1 h ago",
            "status": "Alert",
            "tone": "danger"
        },
        {
            "title": "Cohort export scheduled",
            "meta": "Automation · 3 h ago",
            "status": "Queued",
            "tone": "warning"
        },
        {
            "title": "Dashboard shared with Growth",
            "meta": "Ali R. · Yesterday",
            "status": "Shared",
            "tone": "neutral"
        }
    ]
}
