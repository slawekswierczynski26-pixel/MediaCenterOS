#!/usr/bin/env python3

import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk
from views.dashboard import Dashboard

win = Dashboard()
win.connect("destroy", Gtk.main_quit)
win.show_all()

Gtk.main()
