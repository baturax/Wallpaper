using GtkLayerShell;
using Gtk;
using Notify;

class Things {

   public static void shell(Gtk.ApplicationWindow window) {
      GtkLayerShell.init_for_window(window);
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.BACKGROUND);
   }

   public static void apply_css(string css_path, Gtk.Widget widget, string css_class) {
      Gdk.Display display = Gdk.Display.get_default();
      Gtk.CssProvider provider = new Gtk.CssProvider();
      uint priority = Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION;
      provider.load_from_path(css_path);
      widget.add_css_class(css_class);
      Gtk.StyleContext.add_provider_for_display(display, provider, priority);
   }

   public static Gtk.AlertDialog warning(string warn_message) {
      Gtk.AlertDialog dialog = new Gtk.AlertDialog(warn_message);
      dialog.show(null);

      return dialog;
   }

   public static Notify.Notification notification(string app_name, string summary, string body, string icon) {
      Notify.init("ba");
      Notify.Notification notification = new Notify.Notification(summary, body, icon);
      try {
         notification.show();
      } catch (Error e) {
         warning(e.message);
      }

      return notification;
   }

}
