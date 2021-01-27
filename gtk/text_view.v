module gtk

pub struct TextView {
	c &C.GtkWidget
}

pub fn new_text_view() TextView {
	return TextView{C.gtk_text_view_new()}
}

pub fn (b TextView) set_editable(e bool) {
	C.gtk_text_view_set_editable(b.c, e)
}

pub fn (tv TextView) set_text(text string) {
	// TODO. add the Gtk.TextBuffer API
	tt := C.gtk_text_tag_table_new()
	b := C.gtk_text_buffer_new(tt)
	C.gtk_text_buffer_set_text(b, text.str, -1)
	C.gtk_text_view_set_buffer(tv.c, b)
}

pub fn (tv TextView) get_text() string {
	b := C.gtk_text_view_get_buffer(tv.c)
	mut start := GtkTextIter{}
	mut end := GtkTextIter{}
	C.gtk_text_buffer_get_bounds(b, &start, &end)
	text := C.gtk_text_buffer_get_text(b, &start, &end, false)
	if text != 0 {
		return tos2(text)
	}
	return ''
}

// INHERITED FROM WIDGET
pub fn (b &TextView) show() {
	C.gtk_widget_show(b.c)
}

// CUSTOM API's
pub fn (b &TextView) on(event_name string, handler fn (TextView, voidptr), data voidptr) int {
	return int(C.g_signal_connect(b.c, event_name.str, handler, data))
}
