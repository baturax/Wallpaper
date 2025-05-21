using Gtk;
using Soup;
using Json;

class Weather {

   public static Gtk.Box weather_box() {
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      box.set_halign(Gtk.Align.START);
      box.set_halign(Gtk.Align.START);

      box.append(weather());

      return box;
   }

   private static Gtk.Label weather() {
      Gtk.Label label = new Gtk.Label("whatsapp");
      label.set_halign(Gtk.Align.START);
      label.set_valign(Gtk.Align.START);
      label.set_margin_top(30);
      label.set_margin_start(30);
      label.set_opacity(1.0f);

      Things.apply_css(Values.Css.CSS_FILE, label, "weather-label");

      getWeather(label);

      GLib.Timeout.add_seconds(21600, () => {
         getWeather(label);
         return true;
      });

      return label;
   }

   private static Gtk.Label getWeather(Gtk.Label label) {
      string uri = "https://api.open-meteo.com/v1/forecast?latitude=%s&longitude=%s&current=apparent_temperature,rain,is_day,relative_humidity_2m&timezone=auto&forecast_days=3".printf(Values.Weather.LAT, Values.Weather.LONG);

      Soup.Session session = new Soup.Session();
      Soup.Message message = new Soup.Message("GET", uri);
      Json.Parser parser = new Json.Parser();

      session.send_message(message);

      try {
         parser.load_from_data((string) message.response_body.flatten().data, -1);
            
         var root_obj = parser.get_root().get_object();
         var current = root_obj.get_object_member("current");

         double rain_api = current.get_double_member("rain");
         double is_day_api = current.get_double_member("is_day");
         double apparent_temperature_api = current.get_double_member("apparent_temperature");

         string rain = " ";
         if (rain_api == 0) {
            rain = " ";
         } else if (rain_api != 0.0) {
            rain = " ";
         }

         string is_day = "";
         if (is_day_api == 1.0) {
            is_day = "☀️";}
         else if (is_day_api != 1) {
            is_day = "🌙";
         }

         string apparent_temperature = "%.1f 󰔄 ".printf(apparent_temperature_api);

         label.set_label(
            rain
            + "\n" +
            is_day
            + "\n" + 
            apparent_temperature);

      } catch (GLib.Error e) {
         Things.warning(e.message);
      }


      return label;
   }
}
