# Flutter Clean Template

Enterprise-ready Flutter starter template with clean architecture, Bloc, AutoRoute, and GetIt/Injectable.

## Stack
- State management: `flutter_bloc`
- Routing: `auto_route`
- DI: `get_it` + `injectable`
- Networking: `dio`
- Models/serialization: `freezed` + `json_serializable`
- Error handling: `fpdart`
- Linting: `very_good_analysis`

## Project Structure
```
lib/
  app/             # App shell, routing
  core/            # Config, DI, errors, networking, shared utilities
  features/        # Feature-first clean architecture modules
```

## Getting Started
```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

## Useful Commands
```bash
flutter analyze
flutter test
flutter test integration_test
```

## Environment
Edit `assets/env/.env` for environment values like API base URLs. Avoid committing secrets.
