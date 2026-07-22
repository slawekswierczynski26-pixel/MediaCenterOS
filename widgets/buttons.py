import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk


class Buttons(Gtk.Box):

    def __init__(self):

        super().__init__(
            orientation=Gtk.Orientation.HORIZONTAL,
            spacing=15
        )

        self.set_homogeneous(True)

        buttons = [
            "🎬 Multimedia",
            "🐳 Docker",
            "📊 Monitor",
            "💾 Backup",
            "⚙ Ustawienia",
            "⏻ Wyjście"
        ]

        for text in buttons:

            btn = Gtk.Button(label=text)
            btn.set_size_request(170, 55)
            self.pack_start(btn, True, True, 0)
