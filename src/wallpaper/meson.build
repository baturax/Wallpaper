dependencies = [
  dependency('gtk4'),
  dependency('gtk4-layer-shell-0'),
  dependency('libnotify'),
  dependency('json-glib-1.0'),
  dependency('libsoup-2.4')
]

source = files(
  './Wallpaper.vala',
  './things/Things.vala',
  './things/Values.vala',
  './modules/image.vala',
  './modules/weather.vala',
  './modules/lyrics.vala',
  './modules/whoami.vala',
  './modules/controls.vala'
)

executable(
  'baiwallpaper',
  source,
  dependencies: dependencies,
  install: true
)
