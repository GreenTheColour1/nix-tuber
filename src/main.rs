use libadwaita::{
    Application, ApplicationWindow, HeaderBar, WindowTitle,
    gtk::Orientation,
    prelude::{ApplicationExt, ApplicationExtManual, BoxExt, WidgetExt},
};

fn build_ui(application: &Application) {
    let content = libadwaita::gtk::Box::new(Orientation::Vertical, 0);
    content.append(
        &HeaderBar::builder()
            .title_widget(&WindowTitle::new("Nix-Tuber", ""))
            .build(),
    );

    let window = ApplicationWindow::builder()
        .application(application)
        .title("Nix-Tuber")
        .default_height(250)
        .default_width(400)
        .content(&content)
        .build();

    window.show();
}

pub fn main() {
    let application = Application::new(
        Some("com.github.GreenTheColour1.nix-tuber"),
        Default::default(),
    );

    application.connect_activate(build_ui);
    application.run();
}
