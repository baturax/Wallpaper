
class Controls {

   public static void click(Gtk.Button button, string command) {
      
      button.clicked.connect(() => {
         try {
            GLib.Process.spawn_command_line_sync(command);
         } catch (GLib.SpawnError e) {
            Things.warning(e.message);
         }
      });

   }

}
