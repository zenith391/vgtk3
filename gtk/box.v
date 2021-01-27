module gtk

pub struct Box {
	c &C.GtkWidget
}

pub struct BoxQuery {
	expand    bool
	fill      bool
	padding   u32
	pack_type PackType
}

pub fn new_box(orientation Orientation, space int) Box {
	return Box{C.gtk_box_new(orientation, space)}
}

pub fn new_hbox(space int) Box {
	return new_box(.horizontal, space)
}

pub fn new_vbox(space int) Box {
	return new_box(.vertical, space)
}

pub fn (b Box) pack_start(child IWidget, expand bool, fill bool, padding u32) {
	C.gtk_box_pack_start(voidptr(b.c), b.c, expand, fill, padding)
}

pub fn (b Box) pack_end(child IWidget, expand bool, fill bool, padding u32) {
	C.gtk_box_pack_end(voidptr(b.c), b.c, expand, fill, padding)
}

pub fn (b Box) get_homogeneous() bool {
	return C.gtk_box_get_homogeneous(voidptr(b.c))
}

pub fn (b Box) set_homogeneous(homogeneous bool) {
	C.gtk_box_set_homogeneous(voidptr(b.c), homogeneous)
}

pub fn (b Box) get_spacing() int {
	return C.gtk_box_get_spacing(voidptr(b.c))
}

pub fn (b Box) set_spacing(spacing int) {
	C.gtk_box_set_spacing(voidptr(b.c), spacing)
}

pub fn (b Box) reorder_child(child IWidget, position int) {
	C.gtk_box_reorder_child(voidptr(b.c), b.c, position)
}

pub fn (b Box) query_child_packing(child IWidget) BoxQuery {
	expand := false
	fill := false
	padding := u32(0)
	pack_type := PackType(0)
	C.gtk_box_query_child_packing(voidptr(b.c), b.c, &expand, &fill, &padding, &pack_type)
	return BoxQuery{expand, fill, padding, pack_type}
}

pub fn (b Box) set_child_packing(child IWidget, expand bool, fill bool, padding u32, pack_type PackType) {
	C.gtk_box_set_child_packing(b.c, child.c, expand, fill, padding, pack_type)
}

pub fn (b Box) get_baseline_position() BaselinePosition {
	return BaselinePosition(C.gtk_box_get_baseline_position(b.c))
}

pub fn (b Box) set_baseline_position(position BaselinePosition) {
	C.gtk_box_set_baseline_position(b.c, position)
}

pub fn (b Box) get_center_widget() &C.GtkWidget {
	return C.gtk_box_get_center_widget(b.c)
}

pub fn (b Box) set_center_widget(widget IWidget) {
	C.gtk_box_set_center_widget(b.c, widget.c)
}

// Inherited from Widget
pub fn (b Box) get_halign() Align {
	return Align(C.gtk_widget_get_halign(b.c))
}

pub fn (b Box) set_halign(align Align) {
	C.gtk_widget_set_halign(b.c, align)
}

pub fn (b Box) get_valign() Align {
	return Align(C.gtk_widget_get_valign(b.c))
}

pub fn (b Box) set_valign(align Align) {
	C.gtk_widget_set_valign(b.c, align)
}

// Inherited from Container
pub fn (b Box) add(widget IWidget) {
	C.gtk_container_add(b.c, widget.c)
}

pub fn (b Box) remove(widget IWidget) {
	C.gtk_container_remove(b.c, widget.c)
}

// Implementing GtkOrientable
pub fn (b Box) set_orientation(orientation Orientation) {
	C.gtk_orientable_set_orientation(b.c, orientation)
}

pub fn (b Box) get_orientation() Orientation {
	return Orientation(C.gtk_orientable_get_orientation(b.c))
}
