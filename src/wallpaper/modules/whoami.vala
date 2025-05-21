using Gtk;

class User {
   public const string css = "/home/bai/Projects/baturax/background/src/wallpaper/Wallpaper.css";

   public static Gtk.Box everything() {
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 2);
      box.set_valign(Gtk.Align.CENTER);
      box.set_halign(Gtk.Align.CENTER);


      box.append(not_everything());
      box.append(powers());
      return box;
   }

   private static Gtk.Box not_everything() {
      
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);

      box.set_size_request(700, 380);

      Things.apply_css(css, box, "not-everything");

      box.append(leftTop());
      box.append(centerTwoBox());
      return box;
   }

   private static Gtk.Box powers() {
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.VERTICAL, 10);
      box.set_size_request(-1, 380);

      Things.apply_css(css, box, "powers");

      Gtk.Button power_button = new Gtk.Button.from_icon_name("system-shutdown");
      Gtk.Button reboot_button = new Gtk.Button.from_icon_name("system-reboot");
      Gtk.Button lock_button = new Gtk.Button.from_icon_name("lock");
      Gtk.Button suspend_button = new Gtk.Button.from_icon_name("system-suspend");
      Gtk.Button logout_button = new Gtk.Button.from_icon_name("system-log-out");

      power_button.clicked.connect(() => {
         Things.dialog("SYSTEM WILL SHUTDOWN, ARE YOU SURE?", "poweroff", "Shutdown Cancelled", "", "cancel", "Shutdown Succesfull", "Will shutdown in 3 seconds", "ok");
      });

      reboot_button.clicked.connect(() => {
         Things.dialog("SYSTEM WILL REBOOT, ARE YOU SURE?", "reboot", "Reboot Cancelled", "", "cancel", "Reboot Succesfull", "Will reboot in 3 seconds", "ok");
      });

      lock_button.clicked.connect(() => {
         Things.dialog("SYSTEM WILL LOCK, ARE YOU SURE?", "//NOT IMplemented", "Lock Cancelled", "", "cancel", "Lock Succesfull", "Will lock in 3 seconds", "ok");
      });

      suspend_button.clicked.connect(() => {
         Things.dialog("SYSTEM WILL SUSPEND, ARE YOU SURE?", "systemctl suspend", "Suspend Cancelled", "", "cancel", "Suspend Succesfull", "Will suspend in 3 seconds", "ok");
      });

      logout_button.clicked.connect(() => {
         Things.dialog("SYSTEM WILL LOGOUT, ARE YOU SURE?", "niri msg action quit", "Logout Cancelled", "", "cancel", "Logout Succesfull", "Will logout in 3 seconds", "ok");
      });

      Controls.click(reboot_button, "");
      Controls.click(lock_button, "");
      Controls.click(suspend_button, "");
      Controls.click(logout_button, "");

      power_button.set_size_request(50, 75);
      reboot_button.set_size_request(50, 75);
      lock_button.set_size_request(50, 75);
      suspend_button.set_size_request(50, 75);
      logout_button.set_size_request(50, 75);

      box.append(power_button);
      box.append(reboot_button);
      box.append(lock_button);
      box.append(suspend_button);
      box.append(logout_button);

      return box;
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

