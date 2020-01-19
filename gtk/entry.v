module gtk

pub struct Entry {
	widget &Widget
}

pub fn new_entry() Entry {
	return Entry{gtk_entry_new()}
}

pub fn (e &Entry) get_gtk_widget() &Widget {
	return e.widget
}

pub fn (e Entry) get_text() string {
	return tos3(gtk_entry_get_text(e.widget))
}

pub fn (e Entry) set_text(text string) {
	gtk_entry_set_text(e.widget, text.str)
}

pub fn (e Entry) set_visibility(visible bool) {
	gtk_entry_set_visibility(e.widget, visible)
}

pub fn (e Entry) set_invisible_char(ch rune) {
	gtk_entry_set_invisible_char(e.widget, ch)
}

pub fn (e Entry) set_editable(setting bool) {
	gtk_editable_set_editable(e.widget, setting)
}

pub fn (e Entry) set_direction(direction TextDirection) {
	gtk_widget_set_direction(e.widget, direction)
}

/* INHERITED FROM WIDGET */
pub fn (e Entry) show() {
	gtk_widget_show(e.widget)
}
