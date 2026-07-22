#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

class MediaCenter(Gtk.Window):
    def __init__(self):
        super().__init__(title="Media Center OS")
        self.set_default_size(500, 400)

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        box.set_border_width(15)
        self.add(box)

        title = Gtk.Label()
        title.set_markup("<span size='18000'><b>Media Center OS 1.0</b></span>")
        box.pack_start(title, False, False, 10)

        buttons = [
            "▶ Uruchom Kodi",
            "🔄 Restart Kodi",
            "📺 Status Kodi",
            "💾 Aktualizacja systemu",
            "📊 Monitor systemu",
            "📁 Menedżer plików",
            "📝 Logi",
            "⚙ Ustawienia"
        ]

        for text in buttons:
            b = Gtk.Button(label=text)
            box.pack_start(b, False, False, 2)

win = MediaCenter()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
