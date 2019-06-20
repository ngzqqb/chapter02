/* appqml/cpp_and_qml_binding_property/main.qml */
import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12

/*begin:import*/
import theqml_the_debug.sstd.styled.app 1.0
import theqml_the_debug.cpp_and_qml_binding_property_module 1.0
/*end:import*/

StyledApplicationWindow {

    width: 512 ;
    height: 360 ;
    id : idRoot ;

    header: ToolBar{
        RowLayout{
            anchors.fill: parent
            ToolButton{
                Layout.fillWidth: true
                text: qsTr("cpp更新数据")
                onClicked: {
                    idAProperty.cppUpdateAProperty();
                }
            }
            ToolButton{
                Layout.fillWidth: true
                text: qsTr("qml设置数据")
                onClicked: {
                    idAProperty.aProperty = qsTr("qml设置数据")
                }
            }
            ToolButton{
                Layout.fillWidth: true
                text: qsTr("qml重新关联")
                onClicked: {
                    idAProperty.aProperty = Qt.binding(function(){
                        return idReadWrite.text;
                    })
                }
            }
        }
    }

    AProperty {
        id : idAProperty
        aProperty : idReadWrite.text
        /*begin:debug*/
        onAPropertyChanged: {
            console.log(aProperty)
        }
        /*end:debug*/
    }

    ColumnLayout{

        anchors.fill: parent

        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        TextField{
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:parent.width *0.8
            id : idReadWrite
            readOnly: false
        }

        TextField{
            Layout.alignment:Qt.AlignHCenter
            Layout.preferredWidth:parent.width *0.8
            id : idReadOnly
            text: idAProperty.aProperty;
            readOnly: true
        }

        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

    }

}
/*endl_input_of_latex_for_clanguage_lick*/
/*begin:debug*/
/*end:debug*/
