/* cpp_and_qml_binding_property_module/the_moudle.cpp */

#include "the_moudle.hpp"
#include "Empty.hpp"
#include "AProperty.hpp"

void sstd::TheMoudle::registerTypes(const char * argURI) {
    qmlRegisterType<Empty>(argURI, 1, 0, "Empty");
    qmlRegisterType<AProperty>(argURI, 1, 0, "AProperty");
    qmlProtectModule(argURI, 1);
}

/*endl_input_of_latex_for_clanguage_lick*/
