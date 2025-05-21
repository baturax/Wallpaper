namespace Values {

   class Main {
      public const int DEFAULT_HEIGHT = 1080;
      public const int DEFAULT_WIDTH = 1920;
   }

   class Image {
      public const string BG_IMAGE = "/home/bai/Pictures/Wallpaper/image.jpg";
   }

   class Weather {
      public const string LAT    = "41.0082";
      public const string LONG   = "28.9784";
   }

   class Lyrics {
      public const string ARTIST_COMMAND = "playerctl metadata --format '{{ artist }}'";
      public const string TITLE_COMMAND = "playerctl metadata --format '{{ title }}'";
      
   }

   class Css {
      public const string CSS_FILE = "/home/bai/.config/BaiBar/Wallpaper.css";
   }

   class WhoAmI {
      public const string POWEROFF_COMMAND = "poweroff";
      public const string REBOOT_COMMAND = "reboot";
      public const string LOCK_COMMAND = "";
      public const string SUSPEND_COMMAND = "systemctl suspend";
      public const string LOGOUT_COMMAND = "niri msg action quit";
   }


}
