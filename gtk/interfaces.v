module gtk

pub interface IWidget {
	c &C.GtkWidget
}

pub interface IContainer {
	add(IWidget)
}
