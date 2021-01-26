module gtk

#include <gtk/gtk.h>
// Actual code
fn init() {
	C.gtk_init(0, [''].data) // TODO: use os library for arguments
}

// This function is blocking!
pub fn main() {
	C.gtk_main()
}

pub fn main_quit() {
	C.gtk_main_quit()
}

pub fn add_custom_signal(widget IWidget, name string, handler fn (&C.GtkWidget, IWidget)) int {
	return int(C.g_signal_connect(voidptr(widget.c), name.str, handler, voidptr(&widget)))
}

// Castings
pub fn to_widget(widget voidptr) &Widget {
	return &Widget(widget)
}

pub fn to_window(widget voidptr) Window {
	return Window{widget}
}
