module gtk

pub enum EntryIconPosition {
	primary = C.GTK_ENTRY_ICON_PRIMARY
	secondary = C.GTK_ENTRY_ICON_SECONDARY
}

pub enum InputPurpose {
	free_form = C.GTK_INPUT_PURPOSE_FREE_FORM
	alpha = C.GTK_INPUT_PURPOSE_ALPHA
	digits = C.GTK_INPUT_PURPOSE_DIGITS
	number = C.GTK_INPUT_PURPOSE_NUMBER
	phone = C.GTK_INPUT_PURPOSE_PHONE
	url = C.GTK_INPUT_PURPOSE_URL
	email = C.GTK_INPUT_PURPOSE_EMAIL
	name = C.GTK_INPUT_PURPOSE_NAME
	password = C.GTK_INPUT_PURPOSE_PASSWORD
	pin = C.GTK_INPUT_PURPOSE_PIN
	terminal = C.GTK_INPUT_PURPOSE_TERMINAL
}

pub enum InputHints {
	none_ = C.GTK_INPUT_HINT_NONE
	spellcheck = C.GTK_INPUT_HINT_SPELLCHECK
	no_spellcheck = C.GTK_INPUT_HINT_NO_SPELLCHECK
	word_completion = C.GTK_INPUT_HINT_WORD_COMPLETION
	lowercase = C.GTK_INPUT_HINT_LOWERCASE
	uppercase_chars = C.GTK_INPUT_HINT_UPPERCASE_CHARS
	uppercase_words = C.GTK_INPUT_HINT_UPPERCASE_WORDS
	uppercase_sentences = C.GTK_INPUT_HINT_UPPERCASE_SENTENCES
	inhibit_osk = C.GTK_INPUT_HINT_INHIBIT_OSK
	vertical_writing = C.GTK_INPUT_HINT_VERTICAL_WRITING
	emoji = C.GTK_INPUT_HINT_EMOJI
	no_emoji = C.GTK_INPUT_HINT_NO_EMOJI
}

pub struct Entry {
	c &C.GtkWidget
}

pub fn new_entry() Entry {
	return Entry{C.gtk_entry_new()}
}

pub fn (e Entry) set_text(text string) {
	C.gtk_entry_set_text(e.c, text.str)
}

pub fn (e Entry) get_text() string {
	return tos3(C.gtk_entry_get_text(e.c))
}

pub fn (e Entry) get_text_length() u16 {
	return u16(C.gtk_entry_get_text_length(e.c))
}

// TODO: void C.gtk_entry_get_text_area (GtkEntry *entry, GdkRectangle *text_area)
pub fn (e Entry) set_visibility(visible bool) {
	C.gtk_entry_set_visibility(e.c, visible)
}

pub fn (e Entry) set_invisible_char(ch rune) {
	C.gtk_entry_set_invisible_char(e.c, ch)
}

pub fn (e Entry) unset_invisible_char() {
	C.gtk_entry_unset_invisible_char(e.c)
}

pub fn (e Entry) set_max_length(max int) {
	C.gtk_entry_set_max_length(e.c, max)
}

pub fn (e Entry) get_activates_default() bool {
	return C.gtk_entry_get_activates_default(e.c)
}

pub fn (e Entry) gtk_entry_get_has_frame() bool {
	return C.gtk_entry_get_has_frame(e.c)
}

// WARNING: Has been deprecated since version 3.4
// TODO: const GtkBorder * C.gtk_entry_get_inner_border (GtkEntry *entry) 
pub fn (e Entry) get_width_chars() int {
	return int(C.gtk_entry_get_width_chars(e.c))
}

pub fn (e Entry) get_max_width_chars() int {
	return int(C.gtk_entry_get_max_width_chars(e.c))
}

pub fn (e Entry) set_activates_default(setting bool) {
	C.gtk_entry_set_activates_default(e.c, setting)
}

pub fn (e Entry) set_has_frame(setting bool) {
	C.gtk_entry_set_has_frame(e.c, setting)
}

// TODO: void C.gtk_entry_set_inner_border (GtkEntry *entry, const GtkBorder *border)
pub fn (e Entry) set_width_chars(n_chars int) {
	C.gtk_entry_set_width_chars(e.c, n_chars)
}

pub fn (e Entry) set_max_width_chars(n_chars int) {
	C.gtk_entry_set_max_width_chars(e.c, n_chars)
}

pub fn (e Entry) get_invisible_char() rune {
	return C.gtk_entry_get_invisible_char(e.c)
}

pub fn (e Entry) set_alignment(xalign f32) {
	C.gtk_entry_set_alignment(e.c, xalign)
}

pub fn (e Entry) get_alignment() f32 {
	return C.gtk_entry_get_alignment(e.c)
}

pub fn (e Entry) set_placeholder_text(text string) {
	C.gtk_entry_set_placeholder_text(e.c, text.str)
}

pub fn (e Entry) get_placeholder_text() string {
	return tos3(C.gtk_entry_get_placeholder_text(e.c))
}

pub fn (e Entry) set_overwrite_mode(setting bool) {
	C.gtk_entry_set_overwrite_mode(e.c, setting)
}

pub fn (e Entry) get_overwrite_mode() bool {
	return C.gtk_entry_get_overwrite_mode(e.c)
}

// TODO: PangoLayout * C.gtk_entry_get_layout (GtkEntry *entry)
pub fn (e Entry) get_layout_offsets() (int, int) {
	x := 0
	y := 0
	C.gtk_entry_get_layout_offsets(e.c, &x, &y)
	return x, y
}

pub fn (e Entry) layout_index_to_text_index(layout_index int) int {
	return int(C.gtk_entry_layout_index_to_text_index(e.c, layout_index))
}

pub fn (e Entry) index_to_layout_index(layout_index int) int {
	return int(C.gtk_entry_text_index_to_layout_index(e.c, layout_index))
}

// TODO: void C.gtk_entry_set_attributes (GtkEntry *entry, PangoAttrList *attrs)
// TODO: PangoAttrList * C.gtk_entry_get_attributes (GtkEntry *entry)
pub fn (e Entry) get_max_length() int {
	return int(C.gtk_entry_get_max_length(e.c))
}

pub fn (e Entry) get_visibility() bool {
	return C.gtk_entry_get_visibility(e.c)
}

// TODO: void C.gtk_entry_set_completion (GtkEntry *entry, GtkEntryCompletion *completion)
// TODO: GtkEntryCompletion * C.gtk_entry_get_completion (GtkEntry *entry)
// TODO: void C.gtk_entry_set_cursor_hadjustment (GtkEntry *entry, GtkAdjustment *adjustment)
// TODO: GtkAdjustment * C.gtk_entry_get_cursor_hadjustment (GtkEntry *entry)
pub fn (e Entry) set_progress_fraction(fraction f32) {
	C.gtk_entry_set_progress_fraction(e.c, fraction)
}

pub fn (e Entry) get_progress_fraction() f32 {
	return f32(C.gtk_entry_get_progress_fraction(e.c))
}

pub fn (e Entry) set_progress_pulse_step(fraction f32) {
	C.gtk_entry_set_progress_pulse_step(e.c, fraction)
}

pub fn (e Entry) get_progress_pulse_step() f32 {
	return f32(C.gtk_entry_get_progress_pulse_step(e.c))
}

pub fn (e Entry) progress_pulse() {
	C.gtk_entry_progress_pulse(e.c)
}

// TODO: gboolean C.gtk_entry_im_context_filter_keypress (GtkEntry *entry, GdkEventKey *event)
pub fn (e Entry) reset_im_context() {
	C.gtk_entry_reset_im_context(e.c)
}

// TODO: PangoTabArray * C.gtk_entry_get_tabs (GtkEntry *entry)
// TODO: void C.gtk_entry_set_tabs (GtkEntry *entry, PangoTabArray *tabs)
pub fn (e Entry) set_icon_from_icon_name(icon_pos EntryIconPosition, icon_name string) {
	if icon_name == '' {
		C.gtk_entry_set_icon_from_icon_name(e.c, icon_pos, 0)
		return
	}
	C.gtk_entry_set_icon_from_icon_name(e.c, icon_pos, icon_name.str)
}

// TODO: void C.gtk_entry_set_icon_from_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos, GIcon *icon)
pub fn (e Entry) get_icon_storage_type(icon_pos EntryIconPosition) ImageType {
	return ImageType(C.gtk_entry_get_icon_storage_type(e.c, icon_pos))
}

// TODO: GdkPixbuf * C.gtk_entry_get_icon_pixbuf (GtkEntry *entry, GtkEntryIconPosition icon_pos)
pub fn (e Entry) get_icon_name(icon_pos EntryIconPosition) string {
	return tos3(C.gtk_entry_get_icon_name(e.c, icon_pos))
}

// TODO: GIcon * C.gtk_entry_get_icon_gicon (GtkEntry *entry, GtkEntryIconPosition icon_pos)
pub fn (e Entry) set_icon_activatable(icon_pos EntryIconPosition, activatable bool) {
	C.gtk_entry_set_icon_activatable(e.c, icon_pos, activatable)
}

pub fn (e Entry) get_icon_activatable(icon_pos EntryIconPosition) bool {
	return C.gtk_entry_get_icon_activatable(e.c, icon_pos)
}

pub fn (e Entry) set_icon_sensitive(icon_pos EntryIconPosition, sensitive bool) {
	C.gtk_entry_set_icon_sensitive(e.c, icon_pos, sensitive)
}

pub fn (e Entry) get_icon_sensitive(icon_pos EntryIconPosition) bool {
	return C.gtk_entry_get_icon_sensitive(e.c, icon_pos)
}

pub fn (e Entry) get_icon_at_pos(x int, y int) int {
	return int(C.gtk_entry_get_icon_at_pos(e.c, x, y))
}

pub fn (e Entry) set_icon_tooltip_text(icon_pos EntryIconPosition, tooltip string) {
	if tooltip == '' {
		C.gtk_entry_set_icon_tooltip_text(e.c, icon_pos, 0)
	}
	C.gtk_entry_set_icon_tooltip_text(e.c, icon_pos, tooltip.str)
}

pub fn (e Entry) get_icon_tooltip_text(icon_pos EntryIconPosition) string {
	res := C.gtk_entry_get_icon_tooltip_text(e.c, icon_pos)
	return tos3(res)
}

pub fn (e Entry) set_icon_tooltip_markup(icon_pos EntryIconPosition, tooltip string) {
	if tooltip == '' {
		C.gtk_entry_set_icon_tooltip_markup(e.c, icon_pos, 0)
	}
	C.gtk_entry_set_icon_tooltip_markup(e.c, icon_pos, tooltip.str)
}

pub fn (e Entry) get_icon_tooltip_markup(icon_pos EntryIconPosition) string {
	res := C.gtk_entry_get_icon_tooltip_markup(e.c, icon_pos)
	return tos3(res)
}

// TODO: void C.gtk_entry_set_icon_drag_source (GtkEntry *entry, GtkEntryIconPosition icon_pos, GtkTargetList *target_list, GdkDragAction actions)
pub fn (e Entry) get_current_icon_drag_source() int {
	return int(C.gtk_entry_get_current_icon_drag_source(e.c))
}

// TODO void C.gtk_entry_get_icon_area (GtkEntry *entry, GtkEntryIconPosition icon_pos, GdkRectangle *icon_area)
pub fn (e Entry) set_input_purpose(purpose InputPurpose) {
	C.gtk_entry_set_input_purpose(e.c, purpose)
}

pub fn (e Entry) get_input_purpose() InputPurpose {
	return InputPurpose(C.gtk_entry_get_input_purpose(e.c))
}

pub fn (e Entry) set_input_hints(hints InputHints) {
	C.gtk_entry_set_input_hints(e.c, hints)
}

pub fn (e Entry) get_input_hints() InputHints {
	return InputHints(C.gtk_entry_get_input_hints(e.c))
}

pub fn (e Entry) grab_focus_without_selecting() {
	C.gtk_entry_grab_focus_without_selecting(e.c)
}

// IMPLEMENTING EDITABLE
pub fn (e Entry) set_editable(setting bool) {
	C.gtk_editable_set_editable(e.c, setting)
}

pub fn (e Entry) set_direction(direction TextDirection) {
	C.gtk_widget_set_direction(e.c, direction)
}

// INHERITED FROM WIDGET
pub fn (e Entry) show() {
	C.gtk_widget_show(e.c)
}

pub fn (e Entry) show_all() {
	C.gtk_widget_show_all(e.c)
}

// CUSTOM API's
pub fn (e &Entry) on(event_name string, handler fn (Entry, voidptr), data voidptr) int {
	return int(C.g_signal_connect(e.c, event_name.str, handler, data))
}
