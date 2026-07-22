import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk

from lib.system_info import get_hostname, get_ip


class Header(Gtk.Frame):

    def __init__(self):
        super().__init__()

        box = Gtk.Box(
            orientation=Gtk.Orientation.HORIZONTAL,
            spacing=20,
            margin_top=10,
            margin_bottom=10,
            margin_start=15,
            margin_end=15
        )

        self.add(box)

        self.title = Gtk.Label()
        self.title.set_markup(
            "<span size='22000'><b>MEDIA CENTER OS</b></span>"
        )
        self.title.set_xalign(0)

        self.info = Gtk.Label()
        self.info.set_xalign(1)

        box.pack_start(self.title, True, True, 0)
        box.pack_end(self.info, False, False, 0)

        self.refresh()

    def refresh(self):
        self.info.set_markup(
            f"<b>{get_hostname()}</b>    {get_ip()}"
        )
