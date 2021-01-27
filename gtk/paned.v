module gtk

pub struct Paned {
	c &C.GtkWidget
}

pub fn new_paned(orientation Orientation) Paned {
	return Paned{C.gtk_paned_new(orientation)}
}

pub fn (b Paned) add1(widget IWidget) {
	C.gtk_paned_add1(b.c, widget.c)
}

pub fn (b Paned) add2(widget IWidget) {
	C.gtk_paned_add2(b.c, widget.c)
}

pub fn (b Paned) set_wide_handle(wide bool) {
	C.gtk_paned_set_wide_handle(b.c, wide)
}

pub fn (b Paned) set_position(pos int) {
	C.gtk_paned_set_position(b.c, pos)
}

// INHERITED FROM WIDGET
pub fn (b &Paned) show() {
	C.gtk_widget_show(b.c)
}

// CUSTOM API's
pub fn (b &Paned) on(event_name string, handler fn (Paned, voidptr), data voidptr) int {
	return int(C.g_signal_connect(b.c, event_name.str, handler, data))
}
