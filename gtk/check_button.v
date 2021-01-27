module gtk

import gdk

pub struct CheckButton {
	c &C.GtkWidget
}

pub fn new_check_button() CheckButton {
	return CheckButton{C.gtk_check_button_new()}
}

pub fn new_check_button_with_label(label string) CheckButton {
	return CheckButton{C.gtk_check_button_new_with_label(label.str)}
}

pub fn new_check_button_with_mnemonic(label string) CheckButton {
	return CheckButton{C.gtk_check_button_new_with_mnemonic(label.str)}
}

// Inherited from ToggleButton
pub fn (c CheckButton) set_mode(draw_indicator bool) {
	C.gtk_toggle_button_set_mode(c.c, draw_indicator)
}

pub fn (c CheckButton) get_mode() bool {
	return C.gtk_toggle_button_get_mode(c.c)
}

pub fn (c CheckButton) toggled() {
	C.gtk_toggle_button_toggled(c.c)
}

pub fn (c CheckButton) get_active() bool {
	return C.gtk_toggle_button_get_active(c.c)
}

pub fn (c CheckButton) set_active(is_active bool) {
	C.gtk_toggle_button_set_active(c.c, is_active)
}

pub fn (c CheckButton) get_inconsistent() bool {
	return C.gtk_toggle_button_get_inconsistent(c.c)
}

pub fn (c CheckButton) set_inconsistent(setting bool) {
	C.gtk_toggle_button_set_inconsistent(c.c, setting)
}

// Inherited from Button
pub fn (c CheckButton) clicked() {
	C.gtk_button_clicked(c.c)
}

pub fn (c CheckButton) set_relief(relief ReliefStyle) {
	C.gtk_button_set_relief(c.c, relief)
}

pub fn (c CheckButton) get_relief() ReliefStyle {
	return ReliefStyle(C.gtk_button_get_relief(c.c))
}

pub fn (c CheckButton) get_label() string {
	return tos3(C.gtk_button_get_label(c.c))
}

pub fn (c CheckButton) set_label(label string) {
	C.gtk_button_set_label(c.c, label.str)
}

pub fn (c CheckButton) set_size(width int, height int) {
	C.gtk_widget_set_size_request(c.c, width, height)
}

pub fn (c CheckButton) get_use_underline() bool {
	return C.gtk_button_get_use_underline(c.c)
}

pub fn (c CheckButton) set_use_underline(setting bool) {
	C.gtk_button_set_use_underline(c.c, setting)
}

pub fn (c CheckButton) set_focus_on_click(focus_on_click bool) {
	C.gtk_button_set_focus_on_click(c.c, focus_on_click)
}

pub fn (c CheckButton) get_focus_on_click() bool {
	return C.gtk_widget_get_focus_on_click(c.c)
}

pub fn (c CheckButton) set_image(img_widget IWidget) {
	C.gtk_button_set_image(c.c, img_widget.c)
}

pub fn (c CheckButton) get_image() &C.GtkWidget {
	return C.gtk_button_get_image(c.c)
}

pub fn (c CheckButton) set_image_position(pos Position) {
	C.gtk_button_set_image_position(c.c, pos)
}

pub fn (c CheckButton) get_image_position() Position {
	return Position(C.gtk_button_get_image_position(c.c))
}

pub fn (c CheckButton) set_always_show_image(always_show bool) {
	C.gtk_button_set_always_show_image(c.c, always_show)
}

pub fn (c CheckButton) get_always_show_image() bool {
	return C.gtk_button_get_always_show_image(c.c)
}

pub fn (c CheckButton) get_event_window() gdk.Window {
	return gdk.Window{C.gtk_button_get_event_window(c.c)}
}

pub fn (c &CheckButton) on(event_name string, handler fn (CheckButton, voidptr), data voidptr) int {
	return int(C.g_signal_connect(c.c, event_name.str, handler, data))
}

// Inherited from Bin
pub fn (c CheckButton) get_child() Widget {
	return Widget{C.gtk_bin_get_child(c.c)}
}
