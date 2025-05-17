using GtkLayerShell;
using Gtk;

class Things {

   public static void shell(Gtk.ApplicationWindow window) {
      GtkLayerShell.init_for_window(window);
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.BACKGROUND);
   }

}
