module gtk

pub enum ResizeMode {
	parent = C.GTK_RESIZE_PARENT
	queue = C.GTK_RESIZE_QUEUE
	immediate = C.GTK_RESIZE_IMMEDIATE
}

pub struct Container {
	c &C.GtkContainer
}

pub fn (c &Container) add(widget IWidget) {
	C.gtk_container_add(c.c, widget.c)
}

pub fn (c &Container) set_border_width(border_width int) {
	C.gtk_container_set_border_width(c.c, border_width)
}
