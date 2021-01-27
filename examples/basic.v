module main

import os
import gtk

fn btn_clicked(btn gtk.Button, data voidptr) {
	if btn.get_label() == 'VGTK3 is ..' {
		btn.set_label('VGTK3 is awesome!')
	} else {
		btn.set_label('VGTK3 is ..')
	}
}

fn run_quit(mi gtk.Button, data voidptr) {
	gtk.main_quit()
}

fn run_code(mi gtk.Button, data voidptr) {
	source := 'runme.v'
	app := &AppState(data)
 	input := app.code.get_text()

	os.rm(source) or { panic(err) }
	mut f := os.open_file(source, 'w+') or { panic(err) }
	f.writeln(input) or { panic(err) }
	f.close()

	mut cmd := os.Command{
		path: 'v run runme.v'
		redirect_stdout: true
	}
	cmd.start() or { panic(err) }
	mut out := ''
	for !cmd.eof {
		out += cmd.read_line()
	}
	cmd.close() or { panic(err) }
	app.result.set_text(out)
}

fn menu_exit(mi gtk.MenuItem, data voidptr) {
	gtk.main_quit()
}

fn menu_about(mi gtk.MenuItem, data voidptr) {
	os.system("ls /")
}

fn alert_clicked(btn gtk.Button, data voidptr) {
	btn.set_label('All Fine!')
}

fn win_destroy(win gtk.Window, data voidptr) {
	gtk.main_quit() // necessary as gtk won't exit itself when window is destroyed.
}

struct AppState {
mut:
	window gtk.Window
	menubar gtk.MenuBar
	have_menubar bool
	code gtk.TextView
	result gtk.TextView
}

fn new_appstate() AppState {
	return AppState{
		window: gtk.new_window()
	}
}

fn (mut app AppState) ready() {
	w := app.window
	w.set_position(.center)
	w.set_title('Im made with V')
	w.on('destroy', win_destroy, voidptr(0))
	w.show_all()
}

fn (mut app AppState)get_bbox() gtk.ButtonBox {
	bbox := gtk.new_hbutton_box()
	bbox.set_layout(.end)

	gtk.Box(bbox).set_spacing(10)
	app.window.set_border_width(10)
//	c := &gtk.Container(vbox.c)
	//c.set_border_width(10)

	a := gtk.new_button_with_label('Run')
	a.on('activate', run_code, app)
	a.on('clicked', run_code, app)
	r := gtk.new_button_with_label('Quit')
	r.on('activate', run_quit, app)
	r.on('clicked', run_quit, app)
	bbox.add(a)
	bbox.add(r)
	return bbox
}

fn (mut app AppState)get_paned() gtk.Paned {
	p := gtk.new_paned(.horizontal)
	p.set_position(200)
	p.set_wide_handle(true)
	code := gtk.new_text_view()
	code.set_text("fn main() {
  println('Hello World')
}
")
	code0 := gtk.new_scrolled_window()
	code0.add(code)
	p.add1(code0)
	result := gtk.new_text_view()

	result.set_text('hello world')
	result.set_editable(false)
	result0 := gtk.new_scrolled_window()
	result0.add(result)
	p.add2(result0)

	app.code = code
	app.result = result
	return p
}

fn (mut app AppState)get_menubar() gtk.MenuBar {
	if app.have_menubar {
		return app.menubar
	}
/*
	if mb := app.menubar {
		return mb
	}
*/
	bar := gtk.new_menu_bar()
	app.menubar = bar

	menu := gtk.new_menu()
	file_me := gtk.new_menu_item_with_label("File")
	quit := gtk.new_menu_item_with_label("Quit")
	quit.set_accel_path('GTKTest/File/Quit')
	quit.set_use_underline(true)
	quit.on('activate', menu_exit, &app)
	file_me.set_submenu(menu)

	edit_me := gtk.new_menu_item_with_label('Edit')
	edit_me.set_submenu(menu)

	about := gtk.new_menu_item_with_label('About')
	about.on('activate', menu_about, voidptr(0))
	menu.append(gtk.new_menu_item_with_label('Open'))
	menu.append(about)
	// menu.append(gtk.new_separator_menu_item())
	menu.append(quit)
	bar.append(file_me)
	return bar
}

fn main() {
	mut app := new_appstate()

	menu := app.get_menubar()

	vbox := gtk.new_vbox(20)
	vbox.set_halign(.fill)
	btn := gtk.new_button_with_label('VGTK3 is ..')
	btn2 := gtk.new_button_with_label('Im useless!')
	alert := gtk.new_button_with_label('Alert!')

	hbox := gtk.new_hbox(20)
	hbox.set_halign(.end)
	entry := gtk.new_entry()

	btn.set_size(200, 100)
	btn2.set_size(100, 50)
	alert.set_size(80, 20)
/*
	entry.set_text("Good Night!")
	btn.on("clicked", btn_clicked, &window)

	gtk.accel_map_add_entry('GTK-Test/File/Quit', 65, 0)
	quit.set_accel_path('GTKTest/File/Quit')
	quit.set_use_underline(true)
	quit.on('activate', menu_exit, &window)

	alert.on("clicked", alert_clicked, &window)
*/
	entry.set_text('Good Night!')
	btn.on('clicked', btn_clicked, &app.window)

	gtk.accel_map_add_entry('GTK-Test/File/Quit', 65, 0)

	alert.on('clicked', alert_clicked, &app.window)

	hbox.add(entry)
	hbox.add(alert)

	vbox.pack_start(menu, false, false, 0)

	vbox.pack_start(btn, false, false, 0)
	vbox.pack_start(btn2, false, false, 0)
	vbox.pack_start(hbox, false, false, 0)

	paned := app.get_paned()

	vbox.pack_start(paned, true, true, 0)

	bbox := app.get_bbox()

	vbox.pack_end(bbox, false, false, 0)
	vbox.set_spacing(10)
	app.window.add(vbox)

	app.ready()
	gtk.main()
}
