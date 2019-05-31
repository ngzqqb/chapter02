/* appqml/simple_styled_control/main.qml */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import "Count.js" as GlobalCount

ApplicationWindow {

    width: 256 ;
    height: 32 ;

    property bool isDark: true
    property var appStyle : Material

    SimpleStyledItem{
        anchors.centerIn: parent
        width: parent.width*0.8
        height: parent.height*0.8
        id : idText
    }

    property int count: GlobalCount.count()
    onIsDarkChanged: checkAndUpdateStyle();

    function checkAndUpdateStyle(){
        if( isDark ){
            appStyle.theme = appStyle.Dark;
        }else{
            appStyle.theme = appStyle.Light;
        }
    }

    Component.onCompleted: {
        checkAndUpdateStyle();
        idText.text = "text : " + idText.count + " this : " + this.count ;
        visible = true
    }

    Timer{
        interval: 1500;
        running: true;
        repeat: true
        onTriggered : { isDark=!isDark ; }
    }

}
