module gtk

import glib
import gio

pub enum ApplicationInhibitFlags {
	logout = C.GTK_APPLICATION_INHIBIT_LOGOUT
	switch = C.GTK_APPLICATION_INHIBIT_SWITCH
	suspend = C.GTK_APPLICATION_INHIBIT_SUSPEND
	idle = C.GTK_APPLICATION_INHIBIT_IDLE
}

pub struct Application {
	c &C.GtkApplication
}

pub fn new_application(app_id string, flags gio.GApplicationFlags) Application {
	app := C.gtk_application_new(app_id.str, flags)
	return Application{app}
}

pub fn (app Application) new_window() Window {
	cptr := C.gtk_application_window_new(app.c)
	return Window{cptr}
}

pub fn (app Application) add_window(window Window) {
	C.gtk_application_add_window(app.c, window.c)
}

pub fn (app Application) remove_window(window Window) {
	C.gtk_application_remove_window(app.c, window.c)
}

pub fn (app Application) get_windows() glib.List {
	return glib.List{C.gtk_application_get_windows(app.c)}
}

pub fn (app Application) get_window_by_id(id u32) Window {
	window := C.gtk_application_get_window_by_id(app.c, id)
	return to_window(voidptr(window))
}

pub fn (app Application) get_active_window() Window {
	window := C.gtk_application_get_active_window(app.c)
	return to_window(window)
}

pub fn (app Application) inhibit(window Window, flags ApplicationInhibitFlags, reason string) u32 {
	return C.gtk_application_inhibit(app.c, window.c, flags, reason.str)
}

pub fn (app Application) uninhibit(cookie u32) {
	C.gtk_application_uninhibit(app.c, cookie)
}

pub fn (app Application) is_inhibited(flags ApplicationInhibitFlags) bool {
	return C.gtk_application_is_inhibited(app.c, flags)
}

pub fn (app Application) prefers_app_menu() bool {
	return C.gtk_application_prefers_app_menu(app.c)
}

pub fn (app Application) get_app_menu() &C.GMenuModel {
	return C.gtk_application_get_app_menu(app.c)
}

pub fn (app Application) set_app_menu(app_menu &C.GMenuModel) {
	C.gtk_application_set_app_menu(app.c, app_menu)
}

pub fn (app Application) get_menubar() &C.GMenuModel {
	return C.gtk_application_get_menubar(app.c)
}

pub fn (app Application) set_menubar(menubar &C.GMenuModel) {
	C.gtk_application_set_menubar(app.c, menubar)
}

pub fn (app Application) get_menu_by_id(id string) &C.GMenu {
	return C.gtk_application_get_menu_by_id(app.c, id.str)
}

pub fn (app Application) list_action_descriptions() []string {
	list_action := C.gtk_application_list_action_descriptions(app.c)
	return carray_string_to_array_string(list_action)
}

pub fn (app Application) get_accels_for_action(detailed_action_name string) []string {
	accels := C.gtk_application_get_accels_for_action(app.c, detailed_action_name.str)
	return carray_string_to_array_string(accels)
}

pub fn (app Application) set_accels_for_action(detailed_action_name string, accels []string) {
	C.gtk_application_set_accels_for_action(app.c, detailed_action_name.str, accels.data)
}

pub fn (app Application) get_actions_for_accel(accel string) []string {
	actions := C.gtk_application_get_actions_for_accel(app.c, accel.str)
	return carray_string_to_array_string(actions)
}

// INHERITED FROM GAPPLICATION
pub fn (app Application) run(argv []string) int {
	return C.g_application_run(app.c, argv.len, argv.data)
}

// INHERITED FROM GOBJECT
pub fn (app Application) unref() {
	C.g_object_unref(app.c)
}

pub fn (app Application) on(event_name string, handler fn (Application, voidptr), data voidptr) u32 {
	return C.g_signal_connect(app.c, event_name.str, handler, data)
}
