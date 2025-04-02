# weather

A Weather project.

## Project structure
lib/
├── core.dart          
│   ├── theme/
│   │   ├── app_colors.dart #all colors in app
│   │   ├── app_images.dart #all image in app
│   │   ├── app_string.dart #lang
│   │   ├── app_style.dart #style - include padding, margin, spaces...
│   │   ├── app_themes.dart #themes of the application, text, background...
│
├── models/            # Data models
├── views/       
│   │   ├── home/
│   │   │   ├── bloc/
│   │   │   │   ├── home_bloc.dart
│   │   │   │   ├── home_event.dart
│   │   │   │   ├── home_state.dart
│   │   │   ├── home_screen.dart #page main
│
└── widget/           # UI Screens
    ├── button_text_widget.dart #button custom
    ├── error_screen.dart #page error
    ├── loading_screen.dart #page loading

## plugins (pub.dev)
flutter_bloc: ^9.1.0
google_fonts: ^6.2.1
flutter_animate: ^4.5.2



