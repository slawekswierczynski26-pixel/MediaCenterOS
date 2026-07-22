#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk


class MediaCenter(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="Media Center OS")

        self.set_default_size(1000, 650)
        self.set_border_width(10)

        root = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        self.add(root)

        # ===== LEWE MENU =====

        menu = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=6)
        menu.set_size_request(220, -1)

        title = Gtk.Label()
        title.set_markup("<span size='18000'><b>Media Center OS</b></span>")
        menu.pack_start(title, False, False, 10)

        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.SLIDE_LEFT_RIGHT)

        buttons = [
            "Dashboard",
            "Kodi",
            "Multimedia",
            "System",
            "Monitor",
            "Sieć",
            "Backup",
            "Logi",
            "Ustawienia"
        ]

        for name in buttons:

            btn = Gtk.Button(label=name)

            btn.connect(
                "clicked",
                self.show_page,
                name
            )

            menu.pack_start(btn, False, False, 0)

            page = Gtk.Box(
                orientation=Gtk.Orientation.VERTICAL,
                spacing=12
            )

            lbl = Gtk.Label()
            lbl.set_markup(
                f"<span size='17000'><b>{name}</b></span>"
            )

            info = Gtk.Label(
                label=f"Moduł {name} będzie rozwijany w kolejnych etapach."
            )

            page.pack_start(lbl, False, False, 20)
            page.pack_start(info, False, False, 5)

            self.stack.add_named(page, name)

        root.pack_start(menu, False, False, 0)
        root.pack_start(self.stack, True, True, 0)

        self.stack.set_visible_child_name("Dashboard")

    def show_page(self, button, page):

        self.stack.set_visible_child_name(page)


win = MediaCenter()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
