# multimedia_wrap_module/multimedia_wrap_module.pro

TEMPLATE = lib
CONFIG += plugin
TARGET = $$qtLibraryTarget(multimedia_wrap_module)

QT += multimedia
QT += multimediawidgets

SOURCES += $$PWD/the_moudle.cpp
HEADERS += $$PWD/the_moudle.hpp

SOURCES += $$PWD/Empty.cpp
HEADERS += $$PWD/Empty.hpp

include($$PWD/../../sstd_library/sstd_library.pri)
include($$PWD/../../sstd_qt_qml_quick_library/sstd_qt_qml_quick_library.pri)

mkpath($${SSTD_LIBRARY_OUTPUT_PATH}/theqml_the_debug/multimedia_wrap_module)
CONFIG(debug,debug|release) {
    DESTDIR = $${SSTD_LIBRARY_OUTPUT_PATH}/theqml_the_debug/multimedia_wrap_module
    QMAKE_POST_LINK += $$escape_expand(\\n\\t)$${SSTD_LIBRARY_OUTPUT_PATH}/sstd_copy_qml $${PWD}/theqml_the_debug $${SSTD_LIBRARY_OUTPUT_PATH}/theqml_the_debug debug
}else{
    DESTDIR = $${SSTD_LIBRARY_OUTPUT_PATH}/theqml/multimedia_wrap_module
    QMAKE_POST_LINK += $$escape_expand(\\n\\t)$${SSTD_LIBRARY_OUTPUT_PATH}/sstd_copy_qml $${PWD}/theqml_the_debug $${SSTD_LIBRARY_OUTPUT_PATH}/theqml release
    QMAKE_POST_LINK += $$escape_expand(\\n\\t)$$[QT_INSTALL_BINS]/qmlplugindump -notrelocatable theqml.multimedia_wrap_module 1.0 $${SSTD_LIBRARY_OUTPUT_PATH} > $${SSTD_LIBRARY_OUTPUT_PATH}/theqml_the_debug/multimedia_wrap_module/plugins.qmltypes
}
export(QMAKE_POST_LINK)

DISTFILES += $$PWD/theqml_the_debug/multimedia_wrap_module/qmldir

QMLSOURCES += $$PWD/theqml_the_debug/multimedia_wrap_module/Auido.qml
QMLSOURCES += $$PWD/theqml_the_debug/multimedia_wrap_module/Camera.qml

lupdate_only{
    SOURCES += $$QMLSOURCES
}

DISTFILES += $$QMLSOURCES

#/*endl_input_of_latex_for_clanguage_lick*/
