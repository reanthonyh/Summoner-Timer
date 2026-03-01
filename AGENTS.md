# AGENTS.md - Developer Guidelines for Summoner Timer

This document provides guidelines for AI agents working on this codebase.

## Project Overview

- **Type**: Flutter mobile application (iOS/Android)
- **State Management**: flutter_bloc
- **Architecture**: Clean Architecture (domain/data/presentation layers)
- **DI**: get_it for dependency injection

## Build Commands

### Flutter Commands
```bash
# Run the app
flutter run

# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Run with specific device
flutter run -d <device_id>
```

### Code Generation
This project uses freezed and json_serializable for code generation. Run after modifying model files:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
# Run all tests
flutter test

# Run a single test file
flutter test test/path/to/file_test.dart

# Run tests with verbose output
flutter test -v

# Run tests matching a name pattern
flutter test --name "test_name_pattern"
```

### Linting & Analysis
```bash
# Analyze code for issues
flutter analyze

# Apply automatic fixes (e.g., formatting)
dart fix --apply

# Format code
dart format .
```

## Code Style Guidelines

### Imports

- Use package imports: `import 'package:summoner_timer/...'`
- Group imports in this order:
  1. Dart SDK imports
  2. Package imports (external)
  3. Relative imports (internal)
- Example:
```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:summoner_timer/core/di/injection_container.dart';
import 'package:summoner_timer/domain/entities/account.dart';
```

### Formatting

- **Page width**: 90 characters
- **Trailing commas**: Always use (automated)
- Use `dart format .` to format code
- Enable "format on save" in your editor

### Types & Generators

- Use **freezed** for immutable data classes (entities, states, models)
- Use **json_serializable** for JSON serialization
- Run `build_runner` after creating/modifying freezed or json_serializable files
- Generated files should NOT be edited manually (they have `.freezed.dart`, `.g.dart` extensions)

### Naming Conventions

- **Classes**: PascalCase (e.g., `AccountRepository`, `ProfileCubit`)
- **Methods/Variables**: camelCase (e.g., `getAccount()`, `currentAccount`)
- **Private members**: Prefix with underscore (e.g., `_sessionRepository`)
- **Constants**: lowerCamelCase with k prefix (e.g., `kApiKey`)
- **Files**: snake_case (e.g., `account_repository.dart`)
- **Enums**: PascalCase with Value suffix for values (e.g., `UiStatus.loading`)

### Classes

- Use `final class` for immutable classes
- Use `class` for classes that need mutation
- Place private fields at the top after constructors

### Error Handling

- Wrap async calls in try-catch blocks
- Emit error states in Cubits/Blocs rather than throwing
- Use meaningful error messages:
```dart
throw Exception('Error parsing json response from Riot Account-V1');
```

### State Management (flutter_bloc)

- Use Cubit for simpler state (no events needed)
- Define states as immutable classes (freezed recommended)
- Follow naming: `<Feature>State`, `<Feature>Cubit`

### Repository Pattern

- Abstract repositories in `domain/repositories/`
- Implementations in `data/repositories/`
- Use repository for data access abstraction

### Dependency Injection

- Register all dependencies in `lib/core/di/injection_container.dart`
- Use `registerLazySingleton` for singletons
- Use `registerFactory` for transient dependencies

### Best Practices

- Avoid `print()` statements in production code
- Use const constructors where possible
- Prefer expression bodies for simple functions
- Use pattern matching (Dart 3+): `final AccountModelRequest(:name, :tag) = request;`

## Environment Variables

- Environment variables are stored in `.env` file
- Load with `flutter_dotenv` in main():
```dart
await dotenv.load(fileName: '.env');
```

## Key Packages

- `flutter_bloc` - State management
- `freezed` - Immutable data classes
- `json_serializable` - JSON serialization
- `dio` - HTTP client
- `get_it` - Dependency injection
- `cached_network_image` - Image caching
