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

   public static Notify.Notification notification(string summary, string body, string icon) {
      
      Notify.init("System");
      Notify.Notification notification = new Notify.Notification(summary, body, icon);
      notification.set_urgency(Notify.Urgency.LOW);
      
      try {
         notification.show();
      } catch (GLib.Error e) {
         warning(e.message);
      }
      
      return notification;
   }

   public static Gtk.MessageDialog dialog(string message, string command, string cancel_summary, string cancel_body, string cancel_icon, string done_summary, string done_body, string done_icon) {
      Gtk.MessageDialog dialog = new Gtk.MessageDialog(null, Gtk.DialogFlags.MODAL, Gtk.MessageType.QUESTION, Gtk.ButtonsType.OK_CANCEL, message);

      dialog.show();

      dialog.response.connect((response) => {
         
         if (response == ResponseType.CANCEL) {
            notification(cancel_summary, cancel_body, cancel_icon);
            dialog.close();
         } else if (response == ResponseType.OK) {
            notification(done_summary, done_body, done_icon);
            dialog.close();
            
            GLib.Timeout.add_seconds(3, () => {
               try {
                  GLib.Process.spawn_command_line_async(command);
                  return false;
               } catch (GLib.SpawnError e) {
                  warning(e.message);
               }
               return false;
            });
               
         }
      });

      return dialog;

   }

}
