#include "AProperty.hpp"

namespace sstd {

    void AProperty::setAProperty(const QString & arg) {
        auto & the = thisAProperty;
        if (arg == the) {
            return;
        }
        the = arg;
        aPropertyChanged();
    }

    void AProperty::cppUpdateAProperty() {
        setAProperty(QStringLiteral("cppUpdateAProperty"));
    }

}/*namespace sstd*/
