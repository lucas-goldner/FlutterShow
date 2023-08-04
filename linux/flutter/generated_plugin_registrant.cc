//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <custom_mouse_cursor/custom_mouse_cursor_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) custom_mouse_cursor_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "CustomMouseCursorPlugin");
  custom_mouse_cursor_plugin_register_with_registrar(custom_mouse_cursor_registrar);
}
