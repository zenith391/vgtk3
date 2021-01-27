module gtk

pub struct Label {
	c &C.GtkWidget
}

pub fn new_label(label string) Label {
	return Label{C.gtk_label_new(label.str)}
}

pub fn new_empty_label() Label {
	return Label{C.gtk_label_new(0)}
}

pub fn (l Label) set_text(label string) {
	C.gtk_label_set_text(l.c, label.str)
}

// TODO: C.gtk_label_set_attributes()
pub fn (l Label) set_markup(str string) {
	C.gtk_label_set_markup(l.c, str.str)
}

pub fn (l Label) set_markup_with_mnemonic(str string) {
	C.gtk_label_set_markup_with_mnemonic(l.c, str.str)
}

pub fn (l Label) set_pattern(pattern string) {
	C.gtk_label_set_pattern(l.c, pattern.str)
}

pub fn (l Label) set_justify(jtype Justification) {
	C.gtk_label_set_justify(l.c, jtype)
}

pub fn (l Label) set_xalign(xalign f32) {
	if xalign > 1 || xalign < 0 {
		panic('vgtk3.gtk.label.set_xalign: val must between 0 and 1')
	}
	C.gtk_label_set_xalign(l.c, xalign)
}

pub fn (l Label) set_yalign(yalign f32) {
	if yalign > 1 || yalign < 0 {
		panic('vgtk3.gtk.label.set_yalign: val must between 0 and 1')
	}
	C.gtk_label_set_yalign(l.c, yalign)
}

// TODO: C.gtk_label_set_ellipsize()
pub fn (l Label) set_width_chars(n_chars int) {
	C.gtk_label_set_width_chars(l.c, n_chars)
}

pub fn (l Label) set_max_width_chars(n_chars int) {
	C.gtk_label_set_max_width_chars(l.c, n_chars)
}

pub fn (l Label) set_line_wrap(setting bool) {
	C.gtk_label_set_line_wrap(l.c, setting)
}

// TODO: C.gtk_label_set_line_wrap_mode()
pub fn (l Label) set_lines(lines int) {
	C.gtk_label_set_lines(l.c, lines)
}

pub fn (l Label) get_layout_offsets() (int, int) {
	x := 0
	y := 0
	C.gtk_label_get_layout_offsets(l.c, &x, &y)
	return x, y
}

pub fn (l Label) get_mnemonic_keyval() u32 {
	return C.gtk_label_get_mnemonic_keyval(l.c)
}

pub fn (l Label) get_selectable() bool {
	return C.gtk_label_get_selectable(l.c)
}

pub fn (l Label) get_text() string {
	return tos3(C.gtk_label_get_text(l.c))
}

pub fn new_label_with_mnemonic(label string) Label {
	return Label{C.gtk_label_new_with_mnemonic(label.str)}
}

pub fn (l Label) select_region(start_offset int, end_offset int) {
	C.gtk_label_select_region(l.c, start_offset, end_offset)
}

pub fn (l Label) set_mnemonic_widget(widget IWidget) {
	C.gtk_label_set_mnemonic_widget(l.c, widget.c)
}

pub fn (l Label) set_selectable(setting bool) {
	C.gtk_label_set_selectable(l.c, setting)
}

pub fn (l Label) set_text_with_mnemonic(str string) {
	C.gtk_label_set_text_with_mnemonic(l.c, str.str)
}

pub fn (l Label) get_justify() Justification {
	return Justification(C.gtk_label_get_justify(l.c))
}

pub fn (l Label) get_xalign() f32 {
	return C.gtk_label_get_xalign(l.c)
}

pub fn (l Label) get_yalign() f32 {
	return C.gtk_label_get_yalign(l.c)
}

// TODO: PangoEllipsizeMode C.gtk_label_get_ellipsize (GtkLabel *label)
pub fn (l Label) get_width_chars() int {
	return C.gtk_label_get_width_chars(l.c)
}

pub fn (l Label) get_max_width_chars() int {
	return C.gtk_label_get_max_width_chars(l.c)
}

pub fn (l Label) get_label() string {
	return tos3(C.gtk_label_get_label(l.c))
}

// TODO: PangoLayout * C.gtk_label_get_layout (GtkLabel *label)
pub fn (l Label) get_line_wrap() bool {
	return C.gtk_label_get_line_wrap(l.c)
}

// TODO: PangoWrapMode C.gtk_label_get_line_wrap_mode (GtkLabel *label)
pub fn (l Label) get_lines() int {
	return C.gtk_label_get_lines(l.c)
}

pub fn (l Label) get_mnemonic_widget() &C.GtkWidget {
	return C.gtk_label_get_mnemonic_widget(l.c)
}

pub fn (l Label) get_selection_bounds() (int, int) {
	start := 0
	end := 0
	C.gtk_label_get_selection_bounds(l.c, &start, &end)
	return start, end
}

pub fn (l Label) get_use_markup() bool {
	return C.gtk_label_get_use_markup(l.c)
}

pub fn (l Label) get_use_underline() bool {
	return C.gtk_label_get_use_underline(l.c)
}

pub fn (l Label) get_single_line_mode() bool {
	return C.gtk_label_get_single_line_mode(l.c)
}

pub fn (l Label) get_angle() f64 {
	return C.gtk_label_get_angle(l.c)
}

pub fn (l Label) set_label(str string) {
	C.gtk_label_set_label(l.c, str.str)
}

pub fn (l Label) set_use_markup(setting bool) {
	C.gtk_label_set_use_markup(l.c, setting)
}

pub fn (l Label) set_use_underline(setting bool) {
	C.gtk_label_set_use_underline(l.c, setting)
}

pub fn (l Label) set_single_line_mode(setting bool) {
	C.gtk_label_set_single_line_mode(l.c, setting)
}

pub fn (l Label) set_angle(angle f64) {
	C.gtk_label_set_angle(l.c, angle)
}

pub fn (l Label) get_current_uri() string {
	return tos3(C.gtk_label_get_current_uri(l.c))
}

pub fn (l Label) set_track_visited_links(setting bool) {
	C.gtk_label_set_track_visited_links(l.c, setting)
}

pub fn (l Label) get_track_visited_links() bool {
	return C.gtk_label_get_track_visited_links(l.c)
}

// Implemented Widget
pub fn (l Label) show() {
	C.gtk_widget_show(l.c)
}
