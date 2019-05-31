
import QtQuick 2.12
import QtQuick.Controls 2.12
import sstd.styled.app 1.0

Item {

    id : idRoot

    property var model : ListModel {
        ListElement {
            key: "这"
        }
        ListElement {
            key: "是"
        }
        ListElement {
            key: "圆"
        }
        ListElement {
            key: "环"
        }
        ListElement {
            key: "形"
        }
        ListElement {
            key: "的"
        }
        ListElement {
            key: "！"
        }
    }/*ListModel*/

    Component {
        id: idDelegate
        Text{
            text: key
            verticalAlignment :Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            transformOrigin : Item.Center
            rotation: PathView.itemRotation
            color: GlobalAppData.foreground
        }
    }/*Component*/

    PathView{
        anchors.fill: parent
        model: idRoot.model
        delegate: idDelegate
        path: Path {
            startX: 100; startY: 0
            PathAttribute { name: "itemRotation"; value: 0 }
            PathAngleArc {
                radiusX: 100;
                radiusY: 100;
                startAngle: -90;
                sweepAngle: 90;
                centerX: 100;
                centerY :100;
            }
            PathAttribute { name: "itemRotation"; value: 90 }
        }

    }/*PathView*/

}/*Item*/
