using GtkLayerShell;
using Gtk;
using Notify;

class Things {

   public static void shell(Gtk.ApplicationWindow window) {
      GtkLayerShell.init_for_window(window);
      GtkLayerShell.set_layer(window, GtkLayerShell.Layer.BACKGROUND);
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
