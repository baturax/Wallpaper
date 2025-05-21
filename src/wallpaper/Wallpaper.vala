using Gtk;
using GtkLayerShell;

public class Wallpaper: Gtk.Application {

   public Wallpaper() {
      Object(application_id: "bai.wall.paper");
   }

   public override void activate() {
      Gtk.ApplicationWindow window = new Gtk.ApplicationWindow (this) {
         default_height = Values.Main.DEFAULT_HEIGHT,
         default_width = Values.Main.DEFAULT_WIDTH
      };
      Things.shell(window);

      Gtk.Overlay overlay = new Gtk.Overlay();

      overlay.set_child(Image.image());
      overlay.add_overlay(User.everything());
      overlay.add_overlay(Weather.weather_box());
      overlay.add_overlay(Lyric.lyric_box());

      window.set_child(overlay);
      window.present();
   }

   public static int main(string[] args) {
      return(new Wallpaper().run(args));
   }

}
