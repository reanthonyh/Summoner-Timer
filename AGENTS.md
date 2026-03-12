# AGENTS.md - Summoner Timer

This document provides guidelines and commands for agents working on this Flutter codebase.

## Project Overview

A Flutter mobile application for tracking League of Legends summoner spells and game timers. Uses **flutter_bloc** for state management, **freezed** for immutable data classes, **get_it** for dependency injection, and **dio** for networking.

## Commands

### Running the App

```bash
# Run on connected device/emulator
flutter run

# Run on specific device
flutter run -d <device_id>
```

### Code Generation

This project uses code generation (freezed, json_serializable). After modifying model files:

```bash
# Generate .freezed.dart and .g.dart files
dart run build_runner build
```

### Analysis & Linting

```bash
# Analyze code for errors
flutter analyze

# Format code (respects analysis_options.yaml: 90 char width, trailing commas)
dart format .
```

### Testing

```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/path/to/file_test.dart

# Run tests with a specific name
flutter test --name "test_name_pattern"

# Run tests in debug mode with verbose output
flutter test --debug
```

Note: This project currently has no test files. When adding tests, use **mocktail** for mocking (preferred over mockito).

## Code Style Guidelines

### Formatting

- **Line length**: 90 characters (configured in analysis_options.yaml)
- **Trailing commas**: Always use trailing commas (automate enabled)
- **Quotes**: Use single quotes (`'`) for strings
- **Const constructors**: Prefer const constructors where possible
- **Keys**: Always provide keys in widget constructors

### Imports

```dart
// Package imports (recommended for external packages)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Relative imports for local files
import '../domain/entities/account.dart';
import './presentation/home/pages/home_page.dart';
```

### Naming Conventions

- **Classes**: PascalCase (`HomeCubit`, `AccountRepository`)
- **Files**: snake_case (`home_cubit.dart`, `account_repository.dart`)
- **Methods/variables**: camelCase (`getAccount()`, `currentIndex`)
- **Constants**: camelCase or SCREAMING_SNAKE_CASE depending on context
- **Private members**: Prefix with underscore (`_sessionRepository`)

### Architecture Patterns

#### Domain Layer
- **Entities**: Use freezed for immutable data classes
- **Repositories**: Use `abstract interface class` for repository interfaces
- **Use Cases**: Use `final class` with dependency injection via constructor

```dart
// Entity (freezed)
@freezed
abstract class Account with _$Account {
  const factory Account({
    required String puuid,
    required String gameName,
  }) = _Account;
}

// Repository interface
abstract interface class AccountRepository {
  Future<Result<Account, Exception>> getAccount(String id);
}

// Use case
final class GetAccountUseCase {
  GetAccountUseCase({required this.repository});
  final AccountRepository repository;
}
```

#### Presentation Layer
- **State Management**: Use `Cubit` for simple state, `Bloc` for complex event-driven state
- **State Classes**: Use freezed for immutable states
- **Pages**: Place in `presentation/<feature>/pages/`
- **Widgets**: Place in `presentation/<feature>/widgets/`
- **Cubits/Blocs**: Place in `presentation/<feature>/bloc/` or `cubit/`

#### Data Layer
- **Models**: Use freezed + json_serializable for JSON serialization
- **Data Sources**: Implement remote/local data fetching
- **Mappers**: Map between models and entities

### Error Handling

- Use the `Result<T, E>` sealed class for error handling (defined in `lib/core/utils/result.dart`)
- Return `Result.success(data)` or `Result.failure(exception)`

```dart
Future<Result<Account, Exception>> getAccount(String id) async {
  try {
    final data = await _dataSource.fetchAccount(id);
    return Result.success(data);
  } catch (e) {
    return Result.failure(e);
  }
}
```

### Dependency Injection

Use **get_it** for DI (configured in `lib/core/di/injection_container.dart`):

```dart
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Singleton for persistent instances
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(),
  );

  // Factory for new instances each time
  getIt.registerFactory<GetAccountUseCase>(
    () => GetAccountUseCase(repository: getIt<AccountRepository>()),
  );
}
```

### Freezed & Code Generation

When creating or modifying freezed classes:

1. Create the file with `@freezed` annotation
2. Run `dart run build_runner build` to generate `.freezed.dart` and `.g.dart` files
3. Never modify generated files directly

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({required String name}) = _Account;
  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}
```

### Widgets

- Use `const` constructors where possible
- Always provide `super.key` for StatefulWidget/StatelessWidget
- Follow Flutter best practices for layout

```dart
final class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
```

## File Structure

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

## Common Tasks

### Adding a New Feature

1. Create entity in `lib/domain/entities/`
2. Create repository interface in `lib/domain/repositories/`
3. Implement repository in `lib/data/repositories/`
4. Create use case in `lib/domain/usecases/`
5. Register in `lib/core/di/injection_container.dart`
6. Create UI in `lib/presentation/`

### Adding a New API Endpoint

1. Add URL constants in appropriate file under `lib/core/constants/`
2. Create/update data source in `lib/data/datasources/`
3. Create/update model with freezed if needed
4. Update repository implementation
5. Run code generation: `dart run build_runner build`

### Modifying a Model

1. Edit the source model file (not .g.dart or .freezed.dart)
2. Run: `dart run build_runner build --delete-conflicting-outputs`
3. Verify changes compile with: `flutter analyze`
