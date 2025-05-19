using Gtk;
using Soup;
using Json;

class Weather {

    public static Gtk.Label weather() {
        Gtk.Label label = new Gtk.Label("whatsapp");
        label.set_halign(Gtk.Align.START);
        label.set_valign(Gtk.Align.START);
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

            string time_api = current.get_string_member("time");
            double rain_api = current.get_double_member("rain");
            double is_day_api = current.get_double_member("is_day");
            double apparent_temperature_api = current.get_double_member("apparent_temperature");

            string time = time_api.replace("T", " ");

            string rain = " ";
            if (rain_api == 0) {
                rain = " ";
            } else if (rain_api != 0.0) {
                rain = " ";
            }

            string is_day = "";
            if (is_day_api == 1.0) {
                is_day = "☀️";
            } else if (is_day_api != 1) {
                is_day = "🌙";
            }

            string apparent_temperature = "%.1f".printf(apparent_temperature_api);

            label.set_label(time+rain+is_day+apparent_temperature);

        } catch (GLib.Error e) {
            Things.warning(e.message);
        }


        return label;
    }
}
