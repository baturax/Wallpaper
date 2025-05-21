using Gtk;
using Soup;
using Json;

class Lyric {

   public static Gtk.Box lyric_box() {
      Gtk.Box box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
      box.set_valign(Gtk.Align.CENTER);
      box.set_halign(Gtk.Align.END);

      box.append(lyrics());

      return box;
   }

   private static Gtk.Label lyrics() {
      Gtk.Label label = new Gtk.Label("");
      label.set_opacity(1.0f);

      Things.apply_css(Values.Css.CSS_FILE, label, "lyrics-label");


      getLyric(label);

      Timeout.add_seconds(5, () => {
         getLyric(label);
         return true;
      });

      return label;
   }

   private static Gtk.Label getLyric(Gtk.Label label) {
      string artist = getArtist();
      string title = getTitle();
      string url = "https://lrclib.net/api/get?artist_name=%s&track_name=%s".printf(artist, title);

      Soup.Session session = new Soup.Session();
      Soup.Message message = new Soup.Message("GET", url);
      Json.Parser parser = new Json.Parser();

      session.send_message(message);
      string res = (string) message.response_body.data;
      try {
         parser.load_from_data(res, -1);
         Json.Node root = parser.get_root();
         Json.Object obj = root.get_object();
            
         string plainlyrics = obj.get_string_member("plainLyrics");
         label.set_label(plainlyrics);
      } catch (GLib.Error e) {
            //  Do Nothing
      }

      return label;
   }

   private static string getArtist() {
      string _output;

      try {
         GLib.Process.spawn_command_line_sync(Values.Lyrics.ARTIST_COMMAND, out _output);
         _output = _output.replace(" ", "+");
      } catch (GLib.SpawnError e) {
            //  Do Nothing
      }

      return _output;
   }

   private static string getTitle() {
      string _output;

      try {
         GLib.Process.spawn_command_line_sync(Values.Lyrics.TITLE_COMMAND, out _output);
         _output = _output.replace(" ", "+");
      } catch (GLib.SpawnError e) {
            //  Do Nothing
      }

      return _output;
   }

}
