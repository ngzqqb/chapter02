import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

import "RandomText.js" as RandomText

PrivateBasic{

    Item{
        x : 5
        y : 5
        width: parent.width -10
        height: parent.height - 10
        TextArea{
            anchors.fill: parent;
            selectByMouse: true
            text: RandomText.getSome();
            wrapMode: TextEdit.Wrap
            layer{
                enabled: true;
                effect:ShaderEffect{
                    fragmentShader: "
#version 460

uniform sampler2D source;
uniform float qt_Opacity;
in vec2 qt_TexCoord0    ;
out vec4 ansColor       ;
void main() {
    if( qt_TexCoord0.x <=0.5 ){
        ansColor = texture2D(source, vec2(qt_TexCoord0.x,1-qt_TexCoord0.y));
    }else{
        ansColor = texture2D(source, qt_TexCoord0);
    }
}"
                }
            }
        }
    }

}

/*endl_input_of_latex_for_clanguage_lick*/
//Importing JavaScript Resources in QML








