module gtk

import gdk

pub enum WindowType {
	toplevel = C.GTK_WINDOW_TOPLEVEL
	popup = C.GTK_WINDOW_POPUP
}

pub enum WindowPosition {
	none_ = C.GTK_WIN_POS_NONE
	center = C.GTK_WIN_POS_CENTER
	mouse = C.GTK_WIN_POS_MOUSE
	center_always = C.GTK_WIN_POS_CENTER_ALWAYS
	center_on_parent = C.GTK_WIN_POS_CENTER_ON_PARENT
}

pub struct Window {
	c &C.GtkWidget
}

pub fn new_window() Window {
	return Window{C.gtk_window_new(C.GTK_WINDOW_TOPLEVEL)}
}

pub fn new_window_type(type_ WindowType) Window {
	return Window{C.gtk_window_new(type_)}
}

pub fn (w Window) set_title(title string) {
	C.gtk_window_set_title(w.c, title.str)
}

pub fn (w Window) set_wmclass(name string, class string) {
	C.gtk_window_set_wmclass(w.c, name.str, class.str)
}

pub fn (w Window) set_resizable(setting bool) {
	C.gtk_window_set_resizable(w.c, setting)
}

pub fn (w Window) get_resizable() bool {
	return C.gtk_window_get_resizable(w.c)
}

pub fn (w Window) activate_focus() bool {
	return C.gtk_window_activate_focus(w.c)
}

pub fn (w Window) activate_default() bool {
	return C.gtk_window_activate_default(w.c)
}

pub fn (w Window) set_modal(modal bool) {
	C.gtk_window_set_modal(w.c, modal)
}

pub fn (w Window) set_default_size(width int, height int) {
	C.gtk_window_set_default_size(w.c, width, height)
}

pub fn (w Window) set_default_geometry(width int, height int) {
	C.gtk_window_set_default_geometry(w.c, width, height)
}

pub fn (w Window) set_gravity(gravity gdk.Gravity) {
	C.gtk_window_set_gravity(w.c, gravity)
}

pub fn (w Window) get_gravity() gdk.Gravity {
	return C.gtk_window_get_gravity(w.c)
}

pub fn (w Window) set_position(position WindowPosition) {
	C.gtk_window_set_position(w.c, position)
}

pub fn (w Window) set_transient_for(parrent Window) {
	C.gtk_window_set_transient_for(w.c, parrent.c)
}

pub fn (w Window) set_attached_to(widget IWidget) {
	C.gtk_window_set_attached_to(w.c, widget.c)
}

pub fn (w Window) set_destroy_with_parent(setting bool) {
	C.gtk_window_set_destroy_with_parent(w.c, setting)
}

pub fn (w Window) set_hide_titlebar_when_maximized(setting bool) {
	C.gtk_window_set_hide_titlebar_when_maximized(w.c, setting)
}

pub fn (w Window) get_default_size() (int, int) {
	width := 0
	height := 0
	C.gtk_window_get_default_size(w.c, &width, &height)
	return width, height
}

pub fn (w Window) center() {
	C.gtk_window_set_position(w.c, WindowPosition.center)
}

pub fn (w Window) get_title() string {
	return tos3(C.gtk_window_get_title(w.c))
}

// GdkWindowTypeHint C.gtk_window_get_type_hint (GtkWindow *window)
pub fn (w Window) get_skip_taskbar_hint() bool {
	return C.gtk_window_get_skip_taskbar_hint(w.c)
}

pub fn (w Window) get_skip_pager_hint() bool {
	return C.gtk_window_get_skip_pager_hint(w.c)
}

pub fn (w Window) get_urgency_hint() bool {
	return C.gtk_window_get_urgency_hint(w.c)
}

pub fn (w Window) get_accept_focus() bool {
	return C.gtk_window_get_accept_focus(w.c)
}

pub fn (w Window) get_focus_on_map() bool {
	return C.gtk_window_get_focus_on_map(w.c)
}

// GtkWindowGroup * C.gtk_window_get_group (GtkWindow *window)
pub fn (w Window) has_group() bool {
	return C.gtk_window_has_group(w.c)
}

pub fn (w Window) get_window_type() WindowType {
	return WindowType(C.gtk_window_get_window_type(w.c))
}

pub fn (w Window) move(x int, y int) {
	C.gtk_window_move(w.c, x, y)
}

pub fn (w Window) parse_geometry(geometry string) bool {
	return C.gtk_window_parse_geometry(w.c, geometry.str)
}

pub fn (w Window) reshow_with_initial_size() {
	C.gtk_window_reshow_with_initial_size(w.c)
}

pub fn (w Window) resize(width int, height int) {
	C.gtk_window_resize(w.c, width, height)
}

pub fn (w Window) resize_to_geometry(width int, height int) {
	C.gtk_window_resize_to_geometry(w.c, width, height)
}

// TODO: void C.gtk_window_set_default_icon_list (GList *list)
// TODO: void C.gtk_window_set_default_icon (GdkPixbuf *icon)
pub fn (w Window) set_default_icon_from_file(filename string) bool {
	return C.gtk_window_set_default_icon_from_file(filename.str, 0)
}

pub fn (w Window) set_default_icon_name(name string) {
	C.gtk_window_set_default_icon_name(name.str)
}

// TODO: void C.gtk_window_set_icon (GtkWindow *window, GdkPixbuf *icon)
// TODO: void C.gtk_window_set_icon_list (GtkWindow *window, GList *list)
pub fn (w Window) set_icon_from_file(filename string) bool {
	return C.gtk_window_set_icon_from_file(w.c, filename.str, 0)
}

pub fn (w Window) set_icon_name(name string) {
	C.gtk_window_set_icon_name(w.c, name.str)
}

pub fn (w Window) set_auto_startup_notification(setting bool) {
	C.gtk_window_set_auto_startup_notification(setting)
}

pub fn (w Window) get_opacity() f32 {
	return f32(C.gtk_window_get_opacity(w.c))
}

pub fn (w Window) set_opacity(opacity f32) {
	C.gtk_window_set_opacity(w.c, opacity)
}

pub fn (w Window) get_mnemonics_visible() bool {
	return C.gtk_window_get_mnemonics_visible(w.c)
}

pub fn (w Window) set_mnemonics_visible(setting bool) {
	C.gtk_window_set_mnemonics_visible(w.c, setting)
}

pub fn (w Window) get_focus_visible() bool {
	return C.gtk_window_get_focus_visible(w.c)
}

pub fn (w Window) set_focus_visible(setting bool) {
	C.gtk_window_set_focus_visible(w.c, setting)
}

pub fn (w Window) set_has_resize_grip(value bool) {
	C.gtk_window_set_has_resize_grip(w.c, value)
}

pub fn (w Window) get_has_resize_grip() bool {
	return C.gtk_window_get_has_resize_grip(w.c)
}

pub fn (w Window) resize_grip_is_visible() bool {
	return C.gtk_window_resize_grip_is_visible(w.c)
}

// gboolean C.gtk_window_get_resize_grip_area (GtkWindow *window, GdkRectangle *rect)
pub fn (w Window) get_application() &Application {
	cptr := C.gtk_window_get_application(w.c)
	if cptr == 0 {
		return 0
	}
	return &Application{cptr}
}

pub fn (w Window) set_application(application Application) {
	C.gtk_window_set_application(w.c, application.c)
}

pub fn (w Window) set_has_user_ref_count(setting bool) {
	C.gtk_window_set_has_user_ref_count(w.c, setting)
}

pub fn (w Window) set_titlebar(widget IWidget) {
	C.gtk_window_set_titlebar(w.c, widget.c)
}

pub fn (w Window) get_titlebar() &C.GtkWidget {
	return C.gtk_window_get_titlebar(w.c)
}

pub fn (w Window) set_interactive_debugging(enable bool) {
	C.gtk_window_set_interactive_debugging(enable)
}

// INHERITED FROM CONTAINER
pub fn (w Window) add(widget IWidget) {
	C.gtk_container_add(w.c, widget.c)
}

pub fn (w Window) set_border_width(border_width int) {
	w.to_container().set_border_width(border_width)
}

// INHERITED FROM WIDGET
pub fn (w Window) show() {
	C.gtk_widget_show(w.c)
}

pub fn (w Window) show_all() {
	C.gtk_widget_show_all(w.c)
}

// CUSTOM API's
pub fn (w &Window) on(event_name string, handler fn (Window, voidptr), data voidptr) int {
	return int(C.g_signal_connect(w.c, event_name.str, handler, 0))
}

pub fn (w &Window) to_container() &Container {
	unsafe {
		cptr := &C.GtkContainer(w.c)
		return &Container{cptr}
	}
}
