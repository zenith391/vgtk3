module gtk

import gdk

pub struct Button {
	c &C.GtkWidget
}

pub fn new_button() Button {
	return Button{C.gtk_button_new()}
}

pub fn new_button_with_label(label string) Button {
	return Button{C.gtk_button_new_with_label(label.str)}
}

pub fn new_button_with_mnemonic(label string) Button {
	return Button{C.gtk_button_new_with_mnemonic(label.str)}
}

pub fn new_button_from_icon_name(icon_name string, icon_size IconSize) Button {
	return Button{C.gtk_button_new_from_icon_name(icon_name.str, icon_size)}
}

pub fn (b Button) clicked() {
	C.gtk_button_clicked(b.c)
}

pub fn (b Button) set_relief(relief ReliefStyle) {
	C.gtk_button_set_relief(b.c, relief)
}

pub fn (b Button) get_relief() ReliefStyle {
	return ReliefStyle(C.gtk_button_get_relief(b.c))
}

pub fn (b Button) get_label() string {
	return tos3(C.gtk_button_get_label(b.c))
}

pub fn (b Button) set_label(label string) {
	C.gtk_button_set_label(b.c, label.str)
}

pub fn (b Button) set_size(width int, height int) {
	C.gtk_widget_set_size_request(b.c, width, height)
}

pub fn (b Button) get_use_underline() bool {
	return C.gtk_button_get_use_underline(b.c)
}

pub fn (b Button) set_use_underline(setting bool) {
	C.gtk_button_set_use_underline(b.c, setting)
}

pub fn (b Button) set_focus_on_click(focus_on_click bool) {
	C.gtk_button_set_focus_on_click(b.c, focus_on_click)
}

pub fn (b Button) get_focus_on_click() bool {
	return C.gtk_widget_get_focus_on_click(b.c)
}

pub fn (b Button) set_image(img_widget IWidget) {
	C.gtk_button_set_image(b.c, img_widget.c)
}

pub fn (b Button) get_image() &C.GtkWidget {
	return C.gtk_button_get_image(b.c)
}

pub fn (b Button) set_image_position(pos Position) {
	C.gtk_button_set_image_position(b.c, pos)
}

pub fn (b Button) get_image_position() Position {
	return Position(C.gtk_button_get_image_position(b.c))
}

pub fn (b Button) set_always_show_image(always_show bool) {
	C.gtk_button_set_always_show_image(b.c, always_show)
}

pub fn (b Button) get_always_show_image() bool {
	return C.gtk_button_get_always_show_image(b.c)
}

pub fn (b Button) get_event_window() gdk.Window {
	cptr := C.gtk_button_get_event_window(b.c)
	return gdk.Window{cptr}
}

// INHERITED FROM WIDGET
pub fn (b &Button) show() {
	C.gtk_widget_show(b.c)
}

// CUSTOM API's
pub fn (b &Button) on(event_name string, handler fn (Button, voidptr), data voidptr) int {
	return int(C.g_signal_connect(b.c, event_name.str, handler, data))
}
