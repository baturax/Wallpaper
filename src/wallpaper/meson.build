dependencies = [
  dependency('gtk4'),
  dependency('gtk4-layer-shell-0'),
  dependency('libnotify'),
  dependency('json-glib-1.0'),
]

source = files(
  './Wallpaper.vala',
  './things/Things.vala',
  './things/Values.vala',
  './modules/image.vala'
)

executable(
  'baiwallpaper',
  source,
  dependencies: dependencies,
)
