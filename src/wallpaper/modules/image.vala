class Image {

   public static Gtk.Picture image() {
      
      Gtk.Picture image = new Gtk.Picture.for_filename(Values.Image.BG_IMAGE);

      return image;
   }

}
