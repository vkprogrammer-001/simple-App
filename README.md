# Flutter Login & Home App

A Flutter application with login authentication and image gallery using Bloc state management.

## Features

- **Login Screen**: Email and password validation with form submission
- **Home Screen**: Displays 10 images from Picsum API in a vertical list
- **Bloc State Management**: Clean architecture with separate blocs for each feature
- **Input Validation**: Email format and password strength validation
- **Responsive Design**: Images adapt to screen width with proper aspect ratios

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Dependencies

- `flutter_bloc` - State management
- `http` - API integration
- `google_fonts` - Montserrat font styling
- `equatable` - Value equality for states

## Architecture

```
lib/
├── features/
│   ├── login/
│   │   ├── login_bloc.dart
│   │   ├── login_event.dart
│   │   └── login_state.dart
│   └── home/
│       ├── home_bloc.dart
│       ├── home_event.dart
│       └── home_state.dart
└── screens/
    ├── login_screen.dart
    └── home_screen.dart
```

## Validation Rules

- **Email**: Must match valid email format
- **Password**: Minimum 8 characters with uppercase, lowercase, number,