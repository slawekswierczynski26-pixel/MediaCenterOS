import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk


class Services(Gtk.Frame):

    def __init__(self):

        super().__init__()

        grid = Gtk.Grid(
            row_spacing=10,
            column_spacing=20,
            margin_top=10,
            margin_bottom=10,
            margin_start=15,
            margin_end=15
        )

        self.add(grid)

        self.items = {}

        names = [
            "Kodi",
            "SSH",
            "XRDP",
            "Docker",
            "Internet"
        ]

        for i, name in enumerate(names):

            title = Gtk.Label(label=name)
            title.set_xalign(0)

            value = Gtk.Label()
            value.set_xalign(0)

            grid.attach(title, 0, i, 1, 1)
            grid.attach(value, 1, i, 1, 1)

            self.items[name] = value

    def set_status(self, name, state):

        if state:
            txt = "<span foreground='lime'><b>● ONLINE</b></span>"
        else:
            txt = "<span foreground='red'><b>● OFFLINE</b></span>"

        self.items[name].set_markup(txt)
