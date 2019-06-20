#pragma once

#include <sstd_qt_qml_quick_library.hpp>

namespace sstd {

    class AProperty : public QObject {
        Q_OBJECT
    private:
        Q_PROPERTY(QString aProperty READ getAProperty WRITE setAProperty NOTIFY aPropertyChanged)
    public:
        Q_INVOKABLE void cppUpdateAProperty();
    public:
        inline QString getAProperty() const {
            return thisAProperty;
        }
        void setAProperty(const QString &);
        Q_SIGNAL void aPropertyChanged();
    private:
        QString thisAProperty;
    private:
        sstd_class(AProperty);
    };

}/*namespace sstd*/

















