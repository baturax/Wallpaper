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

   public static GLib.Notification notification(string app_name, string summary, string body, string icon) {
   
      GLib.Notification notification = new GLib.Notification("test");

      return notification;
   }

   public static Gtk.MessageDialog dialog(string message, string command) {
      Gtk.MessageDialog dialog = new Gtk.MessageDialog(null, Gtk.DialogFlags.MODAL, Gtk.MessageType.QUESTION, Gtk.ButtonsType.OK_CANCEL, message);

      dialog.show();

      dialog.response.connect((response) => {
         
         if (response == ResponseType.CANCEL) {
            dialog.close();
         } else if (response == ResponseType.OK) {
            dialog.close();
            try {
               GLib.Process.spawn_command_line_sync(command);
            } catch (GLib.SpawnError e) {
               Things.warning(e.message);
            }
         }
      });

      return dialog;

   }

}
