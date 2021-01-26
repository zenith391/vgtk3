module gtk

import gdk
import gio

pub struct Widget {
	c &C.GtkWidget
}

pub fn (w Widget) destroy() {
	C.gtk_widget_destroy(w.c)
}

pub fn (w Widget) in_destruction() bool {
	return C.gtk_widget_in_destruction(w.c)
}

pub fn (w Widget) destroyed(widget IWidget) {
	C.gtk_widget_destroyed(w.c, widget.c)
}

pub fn (w Widget) unparent() {
	C.gtk_widget_unparent(w.c)
}

pub fn (w Widget) show() {
	C.gtk_widget_show(w.c)
}

pub fn (w Widget) show_now() {
	C.gtk_widget_show_now(w.c)
}

pub fn (w Widget) hide() {
	C.gtk_widget_hide(w.c)
}

pub fn (w Widget) show_all() {
	C.gtk_widget_show_all(w.c)
}

pub fn (w Widget) map() {
	C.gtk_widget_map(w.c)
}

pub fn (w Widget) unmap() {
	C.gtk_widget_unmap(w.c)
}

pub fn (w Widget) realize() {
	C.gtk_widget_realize(w.c)
}

pub fn (w Widget) unrealize() {
	C.gtk_widget_unrealize(w.c)
}

// TODO: void C.gtk_widget_draw (GtkWidget *widget, cairo_t *cr)
pub fn (w Widget) queue_draw() {
	C.gtk_widget_queue_draw(w.c)
}

pub fn (w Widget) queue_resize() {
	C.gtk_widget_queue_resize(w.c)
}

pub fn (w Widget) queue_resize_no_redraw() {
	C.gtk_widget_queue_resize_no_redraw(w.c)
}

pub fn (w Widget) queue_allocate() {
	C.gtk_widget_queue_allocate(w.c)
}

// TODO: GdkFrameClock * C.gtk_widget_get_frame_clock (GtkWidget *widget)
pub fn (w Widget) get_scale_factor() int {
	return C.gtk_widget_get_scale_factor(w.c)
}

pub fn (w Widget) remove_tick_callback(id u32) {
	C.gtk_widget_remove_tick_callback(w.c, id)
}

// TODO: void C.gtk_widget_size_allocate (GtkWidget *widget, GtkAllocation *allocation)
// TODO: void C.gtk_widget_size_allocate_with_baseline (GtkWidget *widget, GtkAllocation *allocation, gint baseline)
// TODO: void C.gtk_widget_add_accelerator (GtkWidget *widget, const gchar *accel_signal, GtkAccelGroup *accel_group, guint accel_key, GdkModifierType accel_mods, GtkAccelFlags accel_flags)
// TODO: gboolean C.gtk_widget_remove_accelerator (GtkWidget *widget, GtkAccelGroup *accel_group, guint accel_key, GdkModifierType accel_mods)
// TODO: void C.gtk_widget_set_accel_path (GtkWidget *widget, const gchar *accel_path, GtkAccelGroup *accel_group)
// TODO: GList * C.gtk_widget_list_accel_closures (GtkWidget *widget)
pub fn (w Widget) can_activate_accel(signal_id int) bool {
	return C.gtk_widget_can_activate_accel(w.c, signal_id)
}

// TODO: gboolean C.gtk_widget_event (GtkWidget *widget, GdkEvent *event)
pub fn (w Widget) activate() bool {
	return C.gtk_widget_activate(w.c)
}

// TODO: gboolean C.gtk_widget_intersect (GtkWidget *widget, const GdkRectangle *area, GdkRectangle *intersection)
pub fn (w Widget) is_focus() bool {
	return C.gtk_widget_is_focus(w.c)
}

pub fn (w Widget) grab_focus() {
	C.gtk_widget_grab_focus(w.c)
}

pub fn (w Widget) grab_default() {
	C.gtk_widget_grab_default(w.c)
}

pub fn (w Widget) set_name(name string) {
	C.gtk_widget_set_name(w.c, name.str)
}

pub fn (w Widget) set_sensitive(sensitive bool) {
	C.gtk_widget_set_sensitive(w.c, sensitive)
}

pub fn (w Widget) set_parent(parent IWidget) {
	C.gtk_widget_set_parent(w.c, parent.c)
}

// TODO: void C.gtk_widget_set_parent_window (GtkWidget *widget, GdkWindow *parent_window)
// TODO: GdkWindow * C.gtk_widget_get_parent_window (GtkWidget *widget)
pub fn (w Widget) set_events(events int) {
	C.gtk_widget_set_events(w.c, events)
}

pub fn (w Widget) get_events() int {
	return C.gtk_widget_get_events(w.c)
}

pub fn (w Widget) add_events(events int) {
	C.gtk_widget_add_events(w.c, events)
}

// TODO: void C.gtk_widget_set_device_events (GtkWidget *widget, GdkDevice *device, GdkEventMask events)
// TODO: GdkEventMask C.gtk_widget_get_device_events (GtkWidget *widget, GdkDevice *device)
// TODO: void C.gtk_widget_add_device_events (GtkWidget *widget, GdkDevice *device, GdkEventMask events)
// TODO: void C.gtk_widget_set_device_enabled (GtkWidget *widget, GdkDevice *device, gboolean enabled)
// TODO: gboolean C.gtk_widget_get_device_enabled (GtkWidget *widget, GdkDevice *device)
pub fn (w Widget) get_toplevel() &C.GtkWidget {
	return C.gtk_widget_get_toplevel(w.c)
}

/*
pub fn (w Widget) get_ancestor(widget_type C._GType) &C.GtkWidget {
	return C.gtk_widget_get_ancestor(w.c, widget_type)
}
*/
// TODO: GdkVisual * C.gtk_widget_get_visual (GtkWidget *widget)
// TODO: void C.gtk_widget_set_visual (GtkWidget *widget, GdkVisual *visual)
pub fn (w Widget) is_ancestor(ancestor IWidget) bool {
	return C.gtk_widget_is_ancestor(w.c, ancestor.c)
}

pub fn (w Widget) translate_coordinates(dest_widget IWidget, x int, y int) (int, int) {
	out_x := 0
	out_y := 0
	C.gtk_widget_translate_coordinates(w.c, dest_widget.c, x, y, &out_x, &out_y)
	return out_x, out_y
}

pub fn (w Widget) hide_on_delete() bool {
	return C.gtk_widget_hide_on_delete(w.c)
}

pub fn (w Widget) set_direction(direction TextDirection) {
	C.gtk_widget_set_direction(w.c, direction)
}

pub fn (w Widget) get_direction() TextDirection {
	return TextDirection(C.gtk_widget_get_direction(w.c))
}

pub fn (w Widget) set_default_direction(direction TextDirection) {
	C.gtk_widget_set_default_direction(direction)
}

pub fn (w Widget) get_default_direction() TextDirection {
	return TextDirection(C.gtk_widget_get_default_direction())
}

// TODO: void C.gtk_widget_shape_combine_region (GtkWidget *widget, cairo_region_t *region)
// TODO: void C.gtk_widget_input_shape_combine_region (GtkWidget *widget, cairo_region_t *region)
// TODO: PangoContext * C.gtk_widget_create_pango_context (GtkWidget *widget)
// TODO: PangoContext * C.gtk_widget_get_pango_context (GtkWidget *widget)
// TODO: void C.gtk_widget_set_font_options (GtkWidget *widget, const cairo_font_options_t *options)
// TODO: const cairo_font_options_t * C.gtk_widget_get_font_options (GtkWidget *widget)
// TODO: void C.gtk_widget_set_font_map (GtkWidget *widget, PangoFontMap *font_map)
// TODO: PangoFontMap * C.gtk_widget_get_font_map (GtkWidget *widget)
// PangoLayout * C.gtk_widget_create_pango_layout (GtkWidget *widget, const gchar *text)
pub fn (w Widget) queue_draw_area(x int, y int, width int, height int) {
	C.gtk_widget_queue_draw_area(w.c, x, y, width, height)
}

// TODO: void C.gtk_widget_queue_draw_region (GtkWidget *widget, const cairo_region_t *region)
pub fn (w Widget) set_app_paintable(paintable bool) {
	C.gtk_widget_set_app_paintable(w.c, paintable)
}

pub fn (w Widget) set_redraw_on_allocate(redraw_on_allocate bool) {
	C.gtk_widget_set_redraw_on_allocate(w.c, redraw_on_allocate)
}

pub fn (w Widget) mnemonic_activate(group_cycling bool) bool {
	return C.gtk_widget_mnemonic_activate(w.c, group_cycling)
}

// TODO: void C.gtk_widget_class_install_style_property (GtkWidgetClass *klass, GParamSpec *pspec)
// TODO: void C.gtk_widget_class_install_style_property_parser (GtkWidgetClass *klass, GParamSpec *pspec, GtkRcPropertyParser parser)
// TODO: GParamSpec * C.gtk_widget_class_find_style_property (GtkWidgetClass *klass, const gchar *property_name)
// TODO: GParamSpec ** C.gtk_widget_class_list_style_properties (GtkWidgetClass *klass, guint *n_properties)
// TODO: gboolean C.gtk_widget_send_focus_change (GtkWidget *widget, GdkEvent *event)
// TODO: void C.gtk_widget_style_get (GtkWidget *widget, const gchar *first_property_name, ...)
pub fn (w Widget) style_get_property(property_name string) voidptr {
	// TODO: ret is GValue, fix this after Gobject is implemented
	ret := voidptr(0)
	C.gtk_widget_style_get_property(w.c, property_name.str, &ret)
	return ret
}

// TODO: void C.gtk_widget_style_get_valist (GtkWidget *widget, const gchar *first_property_name, va_list var_args)
// TODO: void C.gtk_widget_class_set_accessible_type (GtkWidgetClass *widget_class, GType type)
// TODO: void C.gtk_widget_class_set_accessible_role (GtkWidgetClass *widget_class, AtkRole role)
// TODO: AtkObject * C.gtk_widget_get_accessible (GtkWidget *widget)
pub fn (w Widget) child_focus(direction DirectionType) bool {
	return C.gtk_widget_child_focus(w.c, direction)
}

pub fn (w Widget) child_notify(child_property string) {
	C.gtk_widget_child_notify(w.c, child_property.str)
}

pub fn (w Widget) freeze_child_notify() {
	C.gtk_widget_freeze_child_notify(w.c)
}

pub fn (w Widget) get_child_visible() bool {
	return C.gtk_widget_get_child_visible(w.c)
}

pub fn (w Widget) get_parent() Widget {
	parent := C.gtk_widget_get_parent(w.c)
	return Widget{parent}
}

// TODO: GtkSettings * C.gtk_widget_get_settings (GtkWidget *widget)
// TODO: GtkClipboard * C.gtk_widget_get_clipboard (GtkWidget *widget, GdkAtom selection)
// TODO: GdkDisplay * C.gtk_widget_get_display (GtkWidget *widget)
// TODO: GdkScreen * C.gtk_widget_get_screen (GtkWidget *widget)
pub fn (w Widget) has_screen() bool {
	return C.gtk_widget_has_screen(w.c)
}

pub fn (w Widget) get_size_request() (int, int) {
	width := 0
	height := 0
	C.gtk_widget_get_size_request(w.c, &width, &height)
	return width, height
}

pub fn (w Widget) set_child_visible(visible bool) {
	C.gtk_widget_set_child_visible(w.c, visible)
}

pub fn (w Widget) set_size_request(width int, height int) {
	C.gtk_widget_set_size_request(w.c, width, height)
}

pub fn (w Widget) thaw_child_notify() {
	C.gtk_widget_thaw_child_notify(w.c)
}

pub fn (w Widget) set_no_show_all(no_show_all bool) {
	C.gtk_widget_set_no_show_all(w.c, no_show_all)
}

pub fn (w Widget) get_no_show_all() bool {
	return C.gtk_widget_get_no_show_all(w.c)
}

// TODO: GList * C.gtk_widget_list_mnemonic_labels (GtkWidget *widget)
pub fn (w Widget) add_mnemonic_label(label IWidget) {
	C.gtk_widget_add_mnemonic_label(w.c, label.c)
}

pub fn (w Widget) remove_mnemonic_label(label IWidget) {
	C.gtk_widget_remove_mnemonic_label(w.c, label.c)
}

pub fn (w Widget) error_bell() {
	C.gtk_widget_error_bell(w.c)
}

pub fn (w Widget) keynav_failed(direction DirectionType) bool {
	return C.gtk_widget_keynav_failed(w.c, direction)
}

pub fn (w Widget) get_tooltip_markup() string {
	return tos3(C.gtk_widget_get_tooltip_markup(w.c))
}

pub fn (w Widget) set_tooltip_markup(markup string) {
	C.gtk_widget_set_tooltip_markup(w.c, markup.str)
}

pub fn (w Widget) get_tooltip_text() string {
	return tos3(C.gtk_widget_get_tooltip_text(w.c))
}

pub fn (w Widget) set_tooltip_text(tooltip string) {
	C.gtk_widget_set_tooltip_text(w.c, tooltip.str)
}

pub fn (w Widget) get_tooltip_window() Window {
	window := C.gtk_widget_get_tooltip_window(w.c)
	return Window{window}
}

pub fn (w Widget) set_tooltip_window(window Window) {
	C.gtk_widget_set_tooltip_window(w.c, window.c)
}

pub fn (w Widget) get_has_tooltip() bool {
	return C.gtk_widget_get_has_tooltip(w.c)
}

pub fn (w Widget) set_has_tooltip(has_tooltip bool) {
	C.gtk_widget_set_has_tooltip(w.c, has_tooltip)
}

pub fn (w Widget) trigger_tooltip_query() {
	C.gtk_widget_trigger_tooltip_query(w.c)
}

pub fn (w Widget) get_window() gdk.Window {
	window := C.gtk_widget_get_window(w.c)
	return gdk.Window{window}
}

pub fn (w Widget) register_window(window gdk.Window) {
	window_ := window.get_cptr()
	C.gtk_widget_register_window(w.c, window_)
}

pub fn (w Widget) unregister_window(window gdk.Window) {
	window_ := window.get_cptr()
	C.gtk_widget_unregister_window(w.c, window_)
}

// TODO: gboolean C.gtk_cairo_should_draw_window (cairo_t *cr, GdkWindow *window)
// TODO: void C.gtk_cairo_transform_to_window (cairo_t *cr, GtkWidget *widget, GdkWindow *window)
pub fn (w Widget) get_allocated_width() int {
	return C.gtk_widget_get_allocated_width(w.c)
}

pub fn (w Widget) get_allocated_height() int {
	return C.gtk_widget_get_allocated_height(w.c)
}

pub fn (w Widget) get_allocation() Allocation {
	allocation := &C.GtkAllocation(0)
	C.gtk_widget_get_allocation(w.c, &allocation)
	return Allocation{allocation}
}

pub fn (w Widget) set_allocation(allocation Allocation) {
	allocation_ := allocation.get_cptr()
	C.gtk_widget_set_allocation(w.c, allocation_)
}

pub fn (w Widget) get_allocated_baseline() int {
	return C.gtk_widget_get_allocated_baseline(w.c)
}

pub fn (w Widget) get_allocated_size() (Allocation, int) {
	allocation := &C.GtkAllocation(0)
	baseline := 0
	C.gtk_widget_get_allocated_size(w.c, &allocation, &baseline)
	return Allocation{allocation}, baseline
}

pub fn (w Widget) get_clip() Allocation {
	allocation := &C.GtkAllocation(0)
	C.gtk_widget_get_clip(w.c, &allocation)
	return Allocation{allocation}
}

pub fn (w Widget) set_clip(allocation Allocation) {
	allocation_ := allocation.get_cptr()
	C.gtk_widget_set_clip(w.c, allocation_)
}

pub fn (w Widget) get_app_paintable() bool {
	return C.gtk_widget_get_app_paintable(w.c)
}

pub fn (w Widget) get_can_default() bool {
	return C.gtk_widget_get_can_default(w.c)
}

pub fn (w Widget) set_can_default(can_default bool) {
	C.gtk_widget_set_can_default(w.c, can_default)
}

pub fn (w Widget) set_can_focus(can_focus bool) {
	C.gtk_widget_set_can_focus(w.c, can_focus)
}

pub fn (w Widget) get_focus_on_click() bool {
	return C.gtk_widget_get_focus_on_click(w.c)
}

pub fn (w Widget) set_focus_on_click(focus_on_click bool) {
	C.gtk_widget_set_focus_on_click(w.c, focus_on_click)
}

pub fn (w Widget) get_has_window() bool {
	return C.gtk_widget_get_has_window(w.c)
}

pub fn (w Widget) set_has_window(has_window bool) {
	C.gtk_widget_set_has_window(w.c, has_window)
}

pub fn (w Widget) get_sensitive() bool {
	return C.gtk_widget_get_sensitive(w.c)
}

pub fn (w Widget) is_sensitive() bool {
	return C.gtk_widget_is_sensitive(w.c)
}

pub fn (w Widget) get_visible() bool {
	return C.gtk_widget_get_visible(w.c)
}

pub fn (w Widget) is_visible() bool {
	return C.gtk_widget_is_visible(w.c)
}

pub fn (w Widget) set_visible(visible bool) {
	C.gtk_widget_set_visible(w.c, visible)
}

pub fn (w Widget) set_state_flags(flags StateFlags, clear bool) {
	C.gtk_widget_set_state_flags(w.c, flags, clear)
}

pub fn (w Widget) unset_state_flags(flags StateFlags) {
	C.gtk_widget_unset_state_flags(w.c, flags)
}

pub fn (w Widget) get_state_flags() StateFlags {
	return StateFlags(C.gtk_widget_get_state_flags(w.c))
}

pub fn (w Widget) has_default() bool {
	return C.gtk_widget_has_default(w.c)
}

pub fn (w Widget) has_focus() bool {
	return C.gtk_widget_has_focus(w.c)
}

pub fn (w Widget) has_visible_focus() bool {
	return C.gtk_widget_has_visible_focus(w.c)
}

pub fn (w Widget) has_grab() bool {
	return C.gtk_widget_has_grab(w.c)
}

pub fn (w Widget) is_drawable() bool {
	return C.gtk_widget_is_drawable(w.c)
}

pub fn (w Widget) is_toplevel() bool {
	return C.gtk_widget_is_toplevel(w.c)
}

pub fn (w Widget) set_window(window gdk.Window) {
	window_ := window.get_cptr()
	C.gtk_widget_set_window(w.c, window_)
}

pub fn (w Widget) set_receives_default(receives_default bool) {
	C.gtk_widget_set_receives_default(w.c, receives_default)
}

pub fn (w Widget) get_receives_default() bool {
	return C.gtk_widget_get_receives_default(w.c)
}

pub fn (w Widget) set_support_multidevice(support_multidevice bool) {
	C.gtk_widget_set_support_multidevice(w.c, support_multidevice)
}

pub fn (w Widget) get_support_multidevice() bool {
	return C.gtk_widget_get_support_multidevice(w.c)
}

pub fn (w Widget) set_realized(realized bool) {
	C.gtk_widget_set_realized(w.c, realized)
}

pub fn (w Widget) get_realized() bool {
	return C.gtk_widget_get_realized(w.c)
}

pub fn (w Widget) set_mapped(realized bool) {
	C.gtk_widget_set_mapped(w.c, realized)
}

pub fn (w Widget) get_mapped() bool {
	return C.gtk_widget_get_mapped(w.c)
}

pub fn (w Widget) device_is_shadowed(device gdk.Device) bool {
	device_ := device.get_cptr()
	return C.gtk_widget_device_is_shadowed(w.c, device_)
}

pub fn (w Widget) get_modifier_mask(intent gdk.ModifierIntent) gdk.ModifierType {
	return gdk.ModifierType(C.gtk_widget_get_modifier_mask(w.c, intent))
}

pub fn (w Widget) insert_action_group(name string, group gio.ActionGroup) {
	group_ := group.get_cptr()
	C.gtk_widget_insert_action_group(w.c, name.str, group_)
}

pub fn (w Widget) get_opacity() f32 {
	return f32(C.gtk_widget_get_opacity(w.c))
}

pub fn (w Widget) set_opacity(opacity f32) {
	C.gtk_widget_set_opacity(w.c, opacity)
}

pub fn (w Widget) list_action_prefixes() []string {
	c_arr_str := C.gtk_widget_list_action_prefixes(w.c)
	v_arr_str := carray_string_to_array_string(c_arr_str)
	return v_arr_str
}

pub fn (w Widget) get_action_group(prefix string) gio.ActionGroup {
	cptr := C.gtk_widget_get_action_group(w.c, prefix.str)
	return gio.ActionGroup{cptr}
}

pub fn (w Widget) get_path() WidgetPath {
	cptr := C.gtk_widget_get_path(w.c)
	return WidgetPath{cptr}
}

pub fn (w Widget) get_style_context() StyleContext {
	cptr := C.gtk_widget_get_style_context(w.c)
	return StyleContext{cptr}
}

pub fn (w Widget) reset_style() {
	C.gtk_widget_reset_style(w.c)
}

pub fn (w Widget) get_preferred_width() (int, int) {
	minimum_width := 0
	natural_width := 0
	C.gtk_widget_get_preferred_width(w.c, &minimum_width, &natural_width)
	return minimum_width, natural_width
}

pub fn (w Widget) get_preferred_height_for_width(width int) (int, int) {
	minimum_height := 0
	natural_height := 0
	C.gtk_widget_get_preferred_height_for_width(w.c, width, &minimum_height, &natural_height)
	return minimum_height, natural_height
}

pub fn (w Widget) get_preferred_width_for_height(height int) (int, int) {
	minimum_width := 0
	natural_width := 0
	C.gtk_widget_get_preferred_width_for_height(w.c, height, &minimum_width, &natural_width)
	return minimum_width, natural_width
}

pub fn (w Widget) get_preferred_height_and_baseline_for_width(width int) (int, int, int, int) {
	minimum_height := 0
	natural_height := 0
	minimum_baseline := 0
	natural_baseline := 0
	C.gtk_widget_get_preferred_height_and_baseline_for_width(w.c, width, &minimum_height,
		&natural_height, &minimum_baseline, &natural_baseline)
	return minimum_height, natural_height, minimum_baseline, natural_baseline
}

pub fn (w Widget) get_request_mode() SizeRequestMode {
	return SizeRequestMode(C.gtk_widget_get_request_mode(w.c))
}

pub fn (w Widget) get_preferred_size() (Requisition, Requisition) {
	minimum_size := &C.GtkRequisition(0)
	natural_size := &C.GtkRequisition(0)
	C.gtk_widget_get_preferred_size(w.c, &minimum_size, &natural_size)
	return Requisition{minimum_size}, Requisition{natural_size}
}

pub fn (w Widget) get_halign() Align {
	return Align(C.gtk_widget_get_halign(w.c))
}

pub fn (w Widget) set_halign(align Align) {
	C.gtk_widget_set_halign(w.c, align)
}

pub fn (w Widget) get_valign() Align {
	return Align(C.gtk_widget_get_valign(w.c))
}

pub fn (w Widget) get_valign_with_baseline() Align {
	return Align(C.gtk_widget_get_valign_with_baseline(w.c))
}

pub fn (w Widget) set_valign(align Align) {
	C.gtk_widget_set_valign(w.c, align)
}

pub fn (w Widget) get_margin_start() int {
	return C.gtk_widget_get_margin_start(w.c)
}

pub fn (w Widget) set_margin_start(margin int) {
	C.gtk_widget_set_margin_start(w.c, margin)
}

pub fn (w Widget) get_margin_end() int {
	return C.gtk_widget_get_margin_end(w.c)
}

pub fn (w Widget) set_margin_end(margin int) {
	C.gtk_widget_set_margin_end(w.c, margin)
}

pub fn (w Widget) get_margin_top() int {
	return C.gtk_widget_get_margin_top(w.c)
}

pub fn (w Widget) set_margin_top(margin int) {
	C.gtk_widget_set_margin_top(w.c, margin)
}

pub fn (w Widget) get_margin_bottom() int {
	return C.gtk_widget_get_margin_bottom(w.c)
}

pub fn (w Widget) set_margin_bottom(margin int) {
	C.gtk_widget_set_margin_bottom(w.c, margin)
}

pub fn (w Widget) get_hexpand() bool {
	return C.gtk_widget_get_hexpand(w.c)
}

pub fn (w Widget) set_hexpand(hexpand bool) {
	C.gtk_widget_set_hexpand(w.c, hexpand)
}

pub fn (w Widget) get_hexpand_set() bool {
	return C.gtk_widget_get_hexpand_set(w.c)
}

pub fn (w Widget) set_hexpand_set(set bool) {
	C.gtk_widget_set_hexpand_set(w.c, set)
}

pub fn (w Widget) get_vexpand() bool {
	return C.gtk_widget_get_vexpand(w.c)
}

pub fn (w Widget) set_vexpand(expand bool) {
	C.gtk_widget_set_vexpand(w.c, expand)
}

pub fn (w Widget) get_vexpand_set() bool {
	return C.gtk_widget_get_vexpand_set(w.c)
}

pub fn (w Widget) set_vexpand_set(set bool) {
	C.gtk_widget_set_vexpand_set(w.c, set)
}

pub fn (w Widget) queue_compute_expand() {
	C.gtk_widget_queue_compute_expand(w.c)
}

pub fn (w Widget) compute_expand(orientation Orientation) bool {
	return C.gtk_widget_compute_expand(w.c, orientation)
}

pub fn (w Widget) init_template() {
	C.gtk_widget_init_template(w.c)
}

// TODO: GObject * C.gtk_widget_get_template_child (GtkWidget *widget, GType widget_type, const gchar *name)
// Functions
fn distribute_natural_allocation(extra_space int, n_requested_sizes u32, sizes RequestedSize) int {
	return C.gtk_distribute_natural_allocation(extra_space, n_requested_sizes, sizes.c)
}
