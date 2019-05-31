/* appqml/simple_styled_control/SimpleStyledItem.qml */

import QtQuick 2.12
import QtQuick.Controls 2.12
import "Count.js" as GlobalCount

Rectangle{

    id : thisItem
    property var appStyle : ApplicationWindow.window.appStyle
    property alias text: idText.text
    property int count: GlobalCount.count()

    border.width: 1
    border.color: appStyle.accent

    color: appStyle.background

    Text {
        id: idText
        text: qsTr("测试文字")
        color: appStyle.foreground
        anchors.centerIn: parent
    }

}
