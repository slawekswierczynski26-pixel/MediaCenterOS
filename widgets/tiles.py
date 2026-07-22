import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk


class Tile(Gtk.Frame):

    def __init__(self, title):

        super().__init__()

        box = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=10,
            margin_top=10,
            margin_bottom=10,
            margin_start=10,
            margin_end=10
        )

        self.add(box)

        lbl = Gtk.Label()
        lbl.set_markup(f"<span size='14000'><b>{title}</b></span>")

        self.value = Gtk.Label()
        self.value.set_markup("<span size='22000'>--</span>")

        box.pack_start(lbl, False, False, 0)
        box.pack_start(self.value, True, True, 0)

    def set_value(self, text):
        self.value.set_markup(
            f"<span size='22000'><b>{text}</b></span>"
        )

