module gtk

pub struct ScrolledWindow {
	c &C.GtkWidget
}

pub fn new_scrolled_window() ScrolledWindow {
	return ScrolledWindow{C.gtk_scrolled_window_new(0, 0)}
}

pub fn (b ScrolledWindow) add(widget IWidget) {
	C.gtk_container_add(b.c, widget.c)
}

// INHERITED FROM WIDGET
pub fn (b &ScrolledWindow) show() {
	C.gtk_widget_show(b.c)
}

// CUSTOM API's
pub fn (b &ScrolledWindow) on(event_name string, handler fn (ScrolledWindow, voidptr), data voidptr) int {
	return int(C.g_signal_connect(b.c, event_name.str, handler, data))
}
