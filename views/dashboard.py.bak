import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk

from widgets.header import Header
from widgets.tiles import Tile
from widgets.services import Services
from widgets.buttons import Buttons


class Dashboard(Gtk.Window):

    def __init__(self):

        super().__init__(title="Media Center OS")

        self.set_default_size(1200, 700)
        self.set_border_width(15)

        main = Gtk.Box(
            orientation=Gtk.Orientation.VERTICAL,
            spacing=20
        )

        self.add(main)

        self.header = Header()
        main.pack_start(self.header, False, False, 0)

        grid = Gtk.Grid(
            row_spacing=15,
            column_spacing=15
        )

        main.pack_start(grid, False, False, 0)

        self.cpu = Tile("CPU")
        self.ram = Tile("RAM")
        self.disk = Tile("DYSK")
        self.temp = Tile("TEMPERATURA")

        grid.attach(self.cpu, 0, 0, 1, 1)
        grid.attach(self.ram, 1, 0, 1, 1)
        grid.attach(self.disk, 2, 0, 1, 1)
        grid.attach(self.temp, 3, 0, 1, 1)

        self.services = Services()
        main.pack_start(self.services, False, False, 0)

        self.buttons = Buttons()
        main.pack_end(self.buttons, False, False, 0)
