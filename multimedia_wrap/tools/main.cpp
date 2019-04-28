#include <set>
#include <list>
#include <array>
#include <regex>
#include <string>
#include <fstream>
#include <cassert>
#include <iostream>
#include <string_view>

using namespace std::string_literals;
using namespace std::string_view_literals;

std::array QtMultimedia{
"Audio"s,
"Camera"s,
"CameraCapture"s,
"CameraExposure"s,
"CameraFlash"s,
"CameraFocus"s,
"CameraImageProcessing"s,
"CameraRecorder"s,
"MediaPlayer"s,
"Playlist"s,
"PlaylistItem"s,
"QtMultimedia"s,
"Radio"s,
"RadioData"s,
"SoundEffect"s,
"Torch"s,
"Video"s,
"VideoOutput"s,
};



int main(int, char **) {

    /*创建QML文件*/
    for (const auto & varI : QtMultimedia) {
        std::ofstream varOut{ varI + ".qml"s , std::ios::binary };
        varOut << "\xEF\xBB\xBF";
        varOut << u8R"(import QtMultimedia 5.8 as QtType)"sv << '\n';
        varOut << '\n';
        varOut << u8R"(QtType.)"sv << varI << u8R"({)"sv << '\n';
        varOut << u8R"(})" << '\n';
        varOut << '\n';
    }

    /*创建qmldir文件内容*/
    {
        std::ofstream varLog{ "theLog.txt",std::ios::binary };
        for (const auto & varI : QtMultimedia) {
            varLog << varI;
            varLog << " 1.0 ";
            varLog << varI;
            varLog << ".qml" << '\n';
        }

        for (const auto & varI : QtMultimedia) {
            varLog << u8R"(QMLSOURCES += $$PWD/theqml_the_debug/multimedia_wrap_module/)";
            varLog << varI;
            varLog << ".qml";
            varLog << '\n';
        }

    }

}
