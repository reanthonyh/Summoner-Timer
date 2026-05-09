# Summoner Timer 🕹️

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A Flutter mobile application for tracking League of Legends summoner spells and game timers.

## 🚀 Technologies Used

- **[Flutter](https://flutter.dev)** - UI Framework
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - State Management
- **[freezed](https://pub.dev/packages/freezed)** - Immutable Data Classes
- **[get_it](https://pub.dev/packages/get_it)** - Dependency Injection
- **[dio](https://pub.dev/packages/dio)** - Networking

## 🏗️ Architecture

This project follows a clean architecture pattern with the following layers:

- **Domain Layer** - Business logic and entities
- **Data Layer** - Data sources, models, and repository implementations
- **Presentation Layer** - UI components using BLoC/Cubit state management

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/       # App constants
│   ├── di/              # Dependency injection
│   ├── networking/      # HTTP client setup
│   └── utils/           # Utilities (Result, etc.)
├── data/
│   ├── datasources/     # Remote and local data sources
│   ├── mappers/         # Model <-> Entity mappers
│   ├── models/          # Data models (JSON serializable)
│   └── repositories/    # Repository implementations
├── domain/
│   ├── entities/        # Business entities
│   ├── repositories/    # Repository interfaces
│   └── usecases/        # Business logic use cases
└── presentation/
    ├── <feature>/
    │   ├── bloc/        # BLoC state management
    │   ├── cubit/       # Cubit state management
    │   ├── pages/       # Screen widgets
    │   └── widgets/     # Feature-specific widgets
    └── root.dart        # App entry point
```

## 🛠️ Development Setup

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Run code generation**
   ```bash
   dart run build_runner build
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🧪 Testing

Currently, this project has no test files. When adding tests, use **mocktail** for mocking.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
