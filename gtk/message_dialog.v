module gtk

pub enum MessageType {
	info = C.GTK_MESSAGE_INFO
	warning = C.GTK_MESSAGE_WARNING
	question = C.GTK_MESSAGE_QUESTION
	error = C.GTK_MESSAGE_ERROR
	other = C.GTK_MESSAGE_OTHER
}

pub enum ButtonsType {
	none_ = C.GTK_BUTTONS_NONE
	ok = C.GTK_BUTTONS_OK
	close = C.GTK_BUTTONS_CLOSE
	cancel = C.GTK_BUTTONS_CANCEL
	yes_no = C.GTK_BUTTONS_YES_NO
	ok_cancel = C.GTK_BUTTONS_OK_CANCEL
}

pub struct MessageDialog {
	c &C.GtkWidget
}

pub fn new_message_dialog(parent Window, flags DialogFlags, message_type MessageType, buttons ButtonsType, message_format string) MessageDialog {
	return MessageDialog{C.gtk_message_dialog_new(parent.c, flags, message_type, buttons,
		message_format.str)}
}

pub fn new_message_dialog_with_markup(parent Window, flags DialogFlags, message_type MessageType, buttons ButtonsType, message_format string) MessageDialog {
	return MessageDialog{C.gtk_message_dialog_new_with_markup(parent.c, flags, message_type,
		buttons, message_format.str)}
}

pub fn (m MessageDialog) dialog_set_markup(str string) {
	C.gtk_message_dialog_set_markup(m.c, str.str)
}

pub fn (m MessageDialog) format_secondary_text(message_format string) {
	C.gtk_message_dialog_format_secondary_text(m.c, message_format.str)
}

pub fn (m MessageDialog) format_secondary_markup(message_format string) {
	C.gtk_message_dialog_format_secondary_markup(m.c, message_format.str)
}

pub fn (m MessageDialog) get_message_area() Widget {
	return Widget{C.gtk_message_dialog_get_message_area(m.c)}
}

// Inherited from Dialog
pub fn (m MessageDialog) run() ResponseType {
	return ResponseType(C.gtk_dialog_run(m.c))
}

pub fn (m MessageDialog) response(response_id ResponseType) {
	C.gtk_dialog_response(m.c, response_id)
}

pub fn (m MessageDialog) add_button(button_text string, response_id ResponseType) Button {
	return Button{C.gtk_dialog_add_button(m.c, button_text.str, response_id)}
}

// TODO: void C.gtk_dialog_add_buttons (GtkDialog *dialog, const gchar *first_button_text, ...)
pub fn (m MessageDialog) add_action_widget(child IWidget, response_id ResponseType) {
	C.gtk_dialog_add_action_widget(m.c, child.c, response_id)
}

pub fn (m MessageDialog) set_default_response(response_id ResponseType) {
	C.gtk_dialog_set_default_response(m.c, response_id)
}

pub fn (m MessageDialog) set_response_sensitive(response_id ResponseType, setting bool) {
	C.gtk_dialog_set_response_sensitive(m.c, response_id, setting)
}

pub fn (m MessageDialog) get_response_for_widget(widget IWidget) int {
	return C.gtk_dialog_get_response_for_widget(m.c, widget.c)
}

pub fn (m MessageDialog) get_widget_for_response(response_id ResponseType) &Widget {
	widget := C.gtk_dialog_get_widget_for_response(m.c, response_id)
	if widget == 0 {
		return 0
	}
	return &Widget{widget}
}

pub fn (m MessageDialog) get_content_area() Box {
	return Box{C.gtk_dialog_get_content_area(m.c)}
}

pub fn (m MessageDialog) get_header_bar() &Widget {
	widget := C.gtk_dialog_get_header_bar(m.c)
	if widget == 0 {
		return 0
	}
	return &Widget{widget}
}

// Inherited from Window
// TODO
// Inherited from Widget
pub fn (m MessageDialog) destroy() {
	C.gtk_widget_destroy(m.c)
}
