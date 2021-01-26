module gtk

pub struct MenuBar {
	c &C.GtkWidget
}

pub struct Menu {
	c &C.GtkWidget
}

pub struct MenuItem {
	c &C.GtkWidget
}

/// CONSTRUCTORS
pub fn new_menu_bar() MenuBar {
	return MenuBar{C.gtk_menu_bar_new()}
}

pub fn new_menu() Menu {
	return Menu{C.gtk_menu_new()}
}

pub fn new_separator_menu_item() MenuItem {
	return MenuItem{C.gtk_separator_menu_item_new()}
}

pub fn new_menu_item_with_label(label string) MenuItem {
	return MenuItem{C.gtk_menu_item_new_with_label(label.str)}
}

pub fn new_menu_item() MenuItem {
	return MenuItem{C.gtk_menu_item_new()}
}

// MENUBAR
pub fn (mb MenuBar) append(item MenuItem) {
	C.gtk_menu_shell_append(mb.c, item.c)
}

// MENU
pub fn (m Menu) append(item MenuItem) {
	C.gtk_menu_shell_append(m.c, item.c)
}

// MENUITEM
pub fn (mi MenuItem) set_submenu(menu Menu) {
	C.gtk_menu_item_set_submenu(mi.c, menu.c)
}

pub fn (mi &MenuItem) on(event_name string, handler fn (MenuItem, voidptr), data voidptr) int {
	return int(C.g_signal_connect(mi.c, event_name.str, handler, data))
}

pub fn (mi MenuItem) set_label(label string) {
	C.gtk_menu_item_set_label(mi.c, label.str)
}

pub fn (mi MenuItem) get_label() string {
	return tos3(C.gtk_menu_item_get_label(mi.c))
}

pub fn (mi MenuItem) get_use_underline() bool {
	return C.gtk_menu_item_get_use_underline(mi.c)
}

pub fn (mi MenuItem) set_use_underline(under bool) {
	C.gtk_menu_item_set_use_underline(mi.c, under)
}

pub fn (mi MenuItem) set_accel_path(label string) {
	C.gtk_menu_item_set_accel_path(mi.c, label.str)
}

pub fn (mi MenuItem) get_accel_path() string {
	return tos3(C.gtk_menu_item_get_accel_path(mi.c))
}
