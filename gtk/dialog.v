module gtk

pub enum DialogFlags {
	modal = C.GTK_DIALOG_MODAL
	destroy_with_parent = C.GTK_DIALOG_DESTROY_WITH_PARENT
	use_header_bar = C.GTK_DIALOG_USE_HEADER_BAR
}

pub enum ResponseType {
	none_ = C.GTK_RESPONSE_NONE
	reject = C.GTK_RESPONSE_REJECT
	accept = C.GTK_RESPONSE_ACCEPT
	delete_event = C.GTK_RESPONSE_DELETE_EVENT
	ok = C.GTK_RESPONSE_OK
	cancel = C.GTK_RESPONSE_CANCEL
	close = C.GTK_RESPONSE_CLOSE
	yes = C.GTK_RESPONSE_YES
	no = C.GTK_RESPONSE_NO
	apply = C.GTK_RESPONSE_APPLY
	help = C.GTK_RESPONSE_HELP
}

pub struct Dialog {
	c &C.GtkWidget
}

pub fn new_dialog() Dialog {
	return Dialog{C.gtk_dialog_new()}
}

pub fn new_dialog_from_parent(title string, parent Window, flags DialogFlags) Dialog {
	return Dialog{C.gtk_dialog_new_with_buttons(title.str, parent.c, flags, 0, 0)}
}

// TODO: GtkWidget * C.gtk_dialog_new_with_buttons (const gchar *title, GtkWindow *parent, GtkDialogFlags flags, const gchar *first_button_text, ...)
pub fn (d Dialog) run() ResponseType {
	return ResponseType(C.gtk_dialog_run(d.c))
}

pub fn (d Dialog) response(response_id ResponseType) {
	C.gtk_dialog_response(d.c, response_id)
}

pub fn (d Dialog) add_button(button_text string, response_id ResponseType) Button {
	return Button{C.gtk_dialog_add_button(d.c, button_text.str, response_id)}
}

// TODO: void C.gtk_dialog_add_buttons (GtkDialog *dialog, const gchar *first_button_text, ...)
pub fn (d Dialog) add_action_widget(child IWidget, response_id ResponseType) {
	C.gtk_dialog_add_action_widget(d.c, child.c, response_id)
}

pub fn (d Dialog) set_default_response(response_id ResponseType) {
	C.gtk_dialog_set_default_response(d.c, response_id)
}

pub fn (d Dialog) set_response_sensitive(response_id ResponseType, setting bool) {
	C.gtk_dialog_set_response_sensitive(d.c, response_id, setting)
}

pub fn (d Dialog) get_response_for_widget(widget IWidget) int {
	return C.gtk_dialog_get_response_for_widget(d.c, widget.c)
}

pub fn (d Dialog) get_widget_for_response(response_id ResponseType) &Widget {
	widget := C.gtk_dialog_get_widget_for_response(d.c, response_id)
	if widget == 0 {
		return 0
	}
	return &Widget{widget}
}

pub fn (d Dialog) get_content_area() Box {
	widget := C.gtk_dialog_get_content_area(d.c)
	return Box{widget}
}

pub fn (d Dialog) get_header_bar() &Widget {
	widget := C.gtk_dialog_get_header_bar(d.c)
	if widget == 0 {
		return 0
	}
	return &Widget{widget}
}

// INHERITED FROM WIDGET
pub fn (d Dialog) destroy() {
	C.gtk_widget_destroy(d.c)
}

pub fn (d Dialog) in_destruction() bool {
	return C.gtk_widget_in_destruction(d.c)
}

pub fn (d Dialog) destroyed(widget IWidget) {
	C.gtk_widget_destroyed(d.c, widget.c)
}

pub fn (d Dialog) unparent() {
	C.gtk_widget_unparent(d.c)
}

pub fn (d Dialog) show() {
	C.gtk_widget_show(d.c)
}

pub fn (d Dialog) show_now() {
	C.gtk_widget_show_now(d.c)
}

pub fn (d Dialog) hide() {
	C.gtk_widget_hide(d.c)
}

pub fn (d Dialog) show_all() {
	C.gtk_widget_show_all(d.c)
}

pub fn (d Dialog) map() {
	C.gtk_widget_map(d.c)
}

pub fn (d Dialog) unmap() {
	C.gtk_widget_unmap(d.c)
}

pub fn (d Dialog) realize() {
	C.gtk_widget_realize(d.c)
}

pub fn (d Dialog) unrealize() {
	C.gtk_widget_unrealize(d.c)
}

pub fn (d Dialog) queue_draw() {
	C.gtk_widget_queue_draw(d.c)
}

pub fn (d Dialog) queue_resize() {
	C.gtk_widget_queue_resize(d.c)
}

pub fn (d Dialog) queue_resize_no_redraw() {
	C.gtk_widget_queue_resize_no_redraw(d.c)
}

pub fn (d Dialog) queue_allocate() {
	C.gtk_widget_queue_allocate(d.c)
}

pub fn (d Dialog) get_scale_factor() int {
	return C.gtk_widget_get_scale_factor(d.c)
}

pub fn (d Dialog) remove_tick_callback(id u32) {
	C.gtk_widget_remove_tick_callback(d.c, id)
}

pub fn (d Dialog) can_activate_accel(signal_id int) bool {
	return C.gtk_widget_can_activate_accel(d.c, signal_id)
}

pub fn (d Dialog) activate() bool {
	return C.gtk_widget_activate(d.c)
}

pub fn (d Dialog) is_focus() bool {
	return C.gtk_widget_is_focus(d.c)
}

pub fn (d Dialog) grab_focus() {
	C.gtk_widget_grab_focus(d.c)
}

pub fn (d Dialog) grab_default() {
	C.gtk_widget_grab_default(d.c)
}

pub fn (d Dialog) set_name(name string) {
	C.gtk_widget_set_name(d.c, name.str)
}

pub fn (d Dialog) set_sensitive(sensitive bool) {
	C.gtk_widget_set_sensitive(d.c, sensitive)
}

pub fn (d Dialog) set_parent(parent IWidget) {
	C.gtk_widget_set_parent(d.c, parent.c)
}

pub fn (d Dialog) set_events(events int) {
	C.gtk_widget_set_events(d.c, events)
}

pub fn (d Dialog) get_events() int {
	return C.gtk_widget_get_events(d.c)
}

pub fn (d Dialog) add_events(events int) {
	C.gtk_widget_add_events(d.c, events)
}

pub fn (d Dialog) get_toplevel() &C.GtkWidget {
	return C.gtk_widget_get_toplevel(d.c)
}

/*
pub fn (d Dialog) get_ancestor(widget_type C._GType) &C.GtkWidget {
	return C.gtk_widget_get_ancestor(d.c, widget_type)
}
*/
pub fn (d Dialog) is_ancestor(ancestor IWidget) bool {
	return C.gtk_widget_is_ancestor(d.c, ancestor.c)
}

pub fn (d Dialog) translate_coordinates(dest_widget IWidget, x int, y int) (int, int) {
	out_x := 0
	out_y := 0
	C.gtk_widget_translate_coordinates(d.c, dest_widget.c, x, y, &out_x, &out_y)
	return out_x, out_y
}

pub fn (d Dialog) hide_on_delete() bool {
	return C.gtk_widget_hide_on_delete(d.c)
}

pub fn (d Dialog) set_direction(direction TextDirection) {
	C.gtk_widget_set_direction(d.c, direction)
}

pub fn (d Dialog) get_direction() TextDirection {
	return TextDirection(C.gtk_widget_get_direction(d.c))
}

pub fn (d Dialog) set_default_direction(direction TextDirection) {
	C.gtk_widget_set_default_direction(direction)
}

pub fn (d Dialog) get_default_direction() TextDirection {
	return TextDirection(C.gtk_widget_get_default_direction())
}

// INHERITED FROM WINDOW
pub fn (d Dialog) set_default_size(width int, height int) {
	C.gtk_window_set_default_size(d.c, width, height)
}

pub fn (d Dialog) get_title() string {
	return tos3(C.gtk_window_get_title(d.c))
}

// CUSTOM API's
pub fn (d &Dialog) on(event_name string, handler fn (Dialog, voidptr), data voidptr) int {
	return int(C.g_signal_connect(d.c, event_name.str, handler, 0))
}
