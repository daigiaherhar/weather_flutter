# weather

A Weather project.
## Config
-   SDK 3.7.2
-   Flutter 3.29.2


## Project structure
lib/
├── core.dart          
│   ├── theme/
│   │   ├── app_colors.dart #all colors in app
│   │   ├── app_images.dart #all image in app
│   │   ├── app_string.dart #lang
│   │   ├── app_style.dart #style - include padding, margin, spaces...
│   │   ├── app_themes.dart #themes of the application, text, background...
├── data/
│   ├── repositories/
│   │   ├── app_colors.dart #all colors in app
│   ├── service/
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
flutter_animate: ^4.5.2
geolocator: ^13.0.4
flutter_dotenv: ^5.2.1
dio: ^5.8.0+1
get_it: ^8.0.3
intl: ^0.20.2



