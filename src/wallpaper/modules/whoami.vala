using Gtk;

class User {
   public const string css = "/home/bai/Projects/baturax/background/src/wallpaper/Wallpaper.css";

   public static Gtk.Box everything() {
      
      Gtk.Box all_boxes = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      all_boxes.set_valign(Gtk.Align.CENTER);
      all_boxes.set_halign(Gtk.Align.CENTER);
      all_boxes.set_size_request(900, 380);

      Things.apply_css(css, all_boxes, "all_boxes");

      all_boxes.append(leftTop());
      all_boxes.append(centerTwoBox());

      return all_boxes;
   }

   private static Gtk.Box centerTwoBox() {
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 10);

      box.append(Weather.weather_box());

      return box;

   }

   private static Gtk.Box leftTop() {
      
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.VERTICAL, 10);
      box.set_margin_top(10);
      box.set_margin_start(10);
      box.set_halign(Gtk.Align.START);
      box.set_valign(Gtk.Align.CENTER);

      Gtk.Image img = new Gtk.Image.from_file("/home/bai/Pictures/assets/zazu.jpg");
      img.set_size_request(250, 250);

      Gtk.Label zazu_label = new Gtk.Label("Zazu");
      Things.apply_css(css, zazu_label, "zazu-label");

      Gtk.Label cat_label = new Gtk.Label("The cat");

      box.append(img);
      box.append(zazu_label);
      box.append(cat_label);

      return box;
   }

}

