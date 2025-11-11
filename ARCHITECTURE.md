# PlantScope - Architecture Documentation

Modern Flutter application built with **Clean Architecture** principles and **BLoC pattern**.

---

## 📋 Table of Contents

- [Project Structure](#project-structure)
- [Technology Stack](#technology-stack)
- [Architecture Layers](#architecture-layers)
- [Core Managers](#core-managers)
- [Features](#features)
- [Testing](#testing)
- [Development Guide](#development-guide)

---

## 🏗️ Project Structure

```
lib/
├── core/                                    # Core application layer
│   ├── constants/                          # Application constants
│   │   ├── api_constants.dart
│   │   └── app_constants.dart
│   ├── errors/                             # Error handling
│   │   ├── exceptions.dart                 # Network exceptions
│   │   └── failures.dart
│   ├── gen/                                # Auto-generated files (flutter_gen)
│   │   ├── assets.gen.dart
│   │   └── fonts.gen.dart
│   ├── init/                               # Initialization
│   │   └── app_initializer.dart
│   ├── managers/                           # Global managers
│   │   ├── global_overlay_manager/         # Popup & overlay management
│   │   │   ├── global_overlay_manager.dart
│   │   │   └── widgets/
│   │   │       ├── global_overlay_widget.dart
│   │   │       └── popup_widget.dart
│   │   ├── locale_manager/                 # Localization management
│   │   │   └── locale_manager.dart
│   │   ├── network_manager/                # HTTP client wrapper
│   │   │   └── network_manager.dart
│   │   ├── router_manager/                 # Navigation management
│   │   │   ├── app_redirecters.dart        # Route guards
│   │   │   └── app_router.dart             # GoRouter config
│   │   ├── storage_manager/                # Local storage
│   │   │   ├── storage_key.dart
│   │   │   └── storage_manager.dart
│   │   └── user_manager/                   # User session management
│   │       └── user_manager.dart
│   ├── theme/                              # Application theming
│   │   ├── color_scheme.dart
│   │   ├── text_theme.dart
│   │   └── theme_manager.dart
│   ├── usecases/                           # Base UseCase
│   │   └── usecase.dart
│   └── utils/                              # Utility functions
│       ├── device_info_util.dart
│       └── extensions/
│           ├── context_extension.dart
│           ├── string_extension.dart
│           └── widget_extension.dart
│
├── features/                                # Feature modules
│   ├── home/                               # Home feature
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── home_local_datasource.dart
│   │   │   │   └── home_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── category_model.dart
│   │   │   │   └── question_model.dart
│   │   │   └── repositories/
│   │   │       └── home_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── category_entity.dart
│   │   │   │   └── question_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── home_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_categories_usecase.dart
│   │   │       └── get_questions_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── home_bloc.dart
│   │       │   ├── home_event.dart
│   │       │   └── home_state.dart
│   │       ├── pages/
│   │       │   └── home_page.dart
│   │       └── widgets/
│   │           ├── category_card.dart
│   │           ├── home_app_bar.dart
│   │           ├── premium_banner.dart
│   │           └── question_card.dart
│   │
│   ├── main_view/                          # Main navigation view
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   └── main_cubit.dart
│   │       └── pages/
│   │           └── main_view.dart
│   │
│   ├── onboarding/                         # Onboarding flow
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── onboarding_cubit.dart
│   │       │   └── onboarding_state.dart
│   │       ├── pages/
│   │       │   └── onboarding_page.dart
│   │       └── widgets/
│   │           └── onboarding_item.dart
│   │
│   ├── payment/                            # Payment & subscription
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── paywall_cubit.dart
│   │       │   └── paywall_state.dart
│   │       ├── models/
│   │       │   ├── paywall_feature.dart
│   │       │   └── paywall_plan.dart
│   │       ├── pages/
│   │       │   └── paywall_page.dart
│   │       └── widgets/
│   │           ├── feature_card.dart
│   │           ├── paywall_app_bar.dart
│   │           ├── paywall_footer_links.dart
│   │           └── plan_card.dart
│   │
│   └── splash/                             # Splash screen
│       └── presentation/
│           ├── cubit/
│           │   ├── splash_cubit.dart
│           │   └── splash_state.dart
│           └── pages/
│               └── splash_page.dart
│
├── shared/                                  # Shared components
│   ├── buttons/
│   │   └── app_rounded_button.dart
│   └── widgets/
│       └── custom_widgets.dart
│
├── app_export.dart                         # Common imports barrel file
├── injection_container.dart                # DI setup (GetIt)
└── main.dart                               # Application entry point
```

---

## 🛠️ Technology Stack

### Core Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| **flutter_bloc** | ^9.1.1 | State management with BLoC pattern |
| **get_it** | ^9.0.5 | Dependency injection container |
| **go_router** | ^17.0.0 | Declarative routing & navigation |
| **dio** | ^5.9.0 | HTTP client for API calls |
| **dartz** | ^0.10.1 | Functional programming (Either, Option) |
| **shared_preferences** | ^2.5.3 | Local key-value storage |
| **easy_localization** | ^3.0.8 | Internationalization (i18n) |
| **equatable** | ^2.0.7 | Value equality for state objects |

### Development Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| **bloc_test** | ^10.0.0 | BLoC testing utilities |
| **mocktail** | ^1.0.4 | Mocking library (no code generation) |
| **flutter_gen** | ^5.11.0 | Asset code generation |
| **freezed** | ^3.2.3 | Code generation for data classes |
| **build_runner** | ^2.7.1 | Code generation runner |

### Additional Tools
- **Flutter SVG**: Vector graphics support
- **Cached Network Image**: Image caching
- **Carousel Slider**: Image/content carousels
- **Lottie**: JSON-based animations
- **Shimmer**: Loading skeleton screens

---

## 🏛️ Architecture Layers

### Clean Architecture Principles

```
┌─────────────────────────────────────────────────┐
│              Presentation Layer                  │
│  (UI, BLoC/Cubit, Pages, Widgets)               │
│                     ↕                            │
│               Domain Layer                       │
│  (Entities, UseCases, Repository Interfaces)    │
│                     ↕                            │
│                Data Layer                        │
│  (Models, DataSources, Repository Impl)         │
└─────────────────────────────────────────────────┘
```

### 1️⃣ Presentation Layer
**Responsibility**: User interface and user interaction

- **BLoC/Cubit**: State management logic
  - Events/Actions trigger state changes
  - Emits new states to UI
  - Calls UseCases from domain layer
  
- **Pages**: Full-screen views
  - Listens to BLoC/Cubit states
  - Dispatches events/actions
  - Minimal business logic
  
- **Widgets**: Reusable UI components
  - Stateless when possible
  - Accept data via parameters
  - Emit callbacks for actions

**Example:**
```dart
// Cubit
class PaywallCubit extends Cubit<PaywallState> {
  void selectPlan(int index) {
    emit(state.copyWith(selectedPlanIndex: index));
  }
}

// Page
BlocBuilder<PaywallCubit, PaywallState>(
  builder: (context, state) {
    return PlanCard(
      isSelected: state.selectedPlanIndex == index,
      onTap: () => context.read<PaywallCubit>().selectPlan(index),
    );
  },
);
```

### 2️⃣ Domain Layer
**Responsibility**: Business logic and rules

- **Entities**: Core business objects
  - Pure Dart classes
  - No Flutter dependencies
  - Immutable (using Freezed or Equatable)
  
- **UseCases**: Single responsibility operations
  - One UseCase = One business operation
  - Depends on repository interfaces
  - Returns `Either<Failure, Success>` using Dartz
  
- **Repository Interfaces**: Abstract contracts
  - Defines what data operations are needed
  - Implementation is in data layer

**Example:**
```dart
// Entity
@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required int? id,
    required String title,
    String? subtitle,
    String? imageUrl,
  }) = _QuestionEntity;
}

// UseCase
class GetQuestionsUseCase {
  final HomeRepository repository;
  
  Future<Either<NetworkException, List<QuestionEntity>>> call() {
    return repository.getQuestions();
  }
}

// Repository Interface
abstract class HomeRepository {
  Future<Either<NetworkException, List<QuestionEntity>>> getQuestions();
  Future<Either<NetworkException, List<CategoryEntity>>> getCategories();
}
```

### 3️⃣ Data Layer
**Responsibility**: Data management and external communication

- **Models**: Data transfer objects
  - JSON serialization/deserialization
  - Converts to/from Entities
  - May have extra fields for API compatibility
  
- **DataSources**: Data origin abstraction
  - **Remote**: API calls via NetworkManager
  - **Local**: Storage via SharedPreferences
  - Throws exceptions on error
  
- **Repository Implementations**: Concrete data operations
  - Implements domain repository interfaces
  - Coordinates between data sources
  - Converts Models to Entities
  - Handles error mapping

**Example:**
```dart
// Model
@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    int? id,
    String? title,
    String? subtitle,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _QuestionModel;
  
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

// Remote DataSource
class HomeRemoteDataSource {
  final NetworkManager networkManager;
  
  Future<List<QuestionModel>> getQuestions() async {
    final response = await networkManager.get('/questions');
    return (response.data as List)
        .map((json) => QuestionModel.fromJson(json))
        .toList();
  }
}

// Repository Implementation
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  
  @override
  Future<Either<NetworkException, List<QuestionEntity>>> getQuestions() async {
    try {
      final models = await remoteDataSource.getQuestions();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
```

---

## 🎯 Core Managers

### GlobalOverlayManager
**Purpose**: Centralized UI overlay management (dialogs, bottom sheets, popups)

**Location**: `lib/core/managers/global_overlay_manager.dart`

**Responsibilities**:
- Show error/success/info popups
- Display loading indicators
- Manage bottom sheets
- Handle dialog lifecycle

**Usage Example**:
```dart
// Show error popup
GlobalOverlayManager.openErrorPopup(
  context: context,
  message: "Failed to load questions",
);

// Show loading
GlobalOverlayManager.showLoading(context);
GlobalOverlayManager.hideLoading();

// Show bottom sheet
GlobalOverlayManager.showBottomSheet(
  context: context,
  child: PaywallBottomSheet(),
);
```

**Integration**:
- Accessed via GetIt: `ml<GlobalOverlayManager>()`
- Used in BLoC error handling (HomeBloc)
- Maintains UI stability during errors

---

### LocaleManager
**Purpose**: Manage app language/localization

**Location**: `lib/core/managers/locale_manager.dart`

**Responsibilities**:
- Get/set current locale
- Persist language preference
- Integrate with easy_localization

**Usage Example**:
```dart
// Change language
await LocaleManager.changeLanguage(context, Locale('tr', 'TR'));

// Get current language
final currentLocale = LocaleManager.getCurrentLocale(context);
```

---

### NetworkManager
**Purpose**: Centralized HTTP client with error handling

**Location**: `lib/core/managers/network_manager.dart`

**Responsibilities**:
- Configure Dio instance
- Handle network errors
- Convert HTTP errors to `NetworkException`
- Add interceptors (auth, logging)

**Features**:
- Base URL configuration
- Timeout management
- Request/response interceptors
- Error mapping (404 → NotFound, 500 → ServerError)

**Usage Example**:
```dart
// GET request
final response = await networkManager.get('/questions');

// POST request
final response = await networkManager.post(
  '/purchase',
  data: {'plan_id': 'premium_monthly'},
);

// Error handling
try {
  final response = await networkManager.get('/questions');
} on NetworkException catch (e) {
  if (e is ServerException) {
    // Handle server error
  } else if (e is NotFoundException) {
    // Handle 404
  }
}
```

---

### StorageManager
**Purpose**: Wrapper around SharedPreferences for type-safe storage

**Location**: `lib/core/managers/storage_manager.dart`

**Responsibilities**:
- Save/retrieve primitive types
- Clear storage
- Check key existence

**Usage Example**:
```dart
// Save data
await StorageManager.setBool('onboarding_completed', true);
await StorageManager.setString('user_name', 'John Doe');

// Retrieve data
final completed = StorageManager.getBool('onboarding_completed') ?? false;
final userName = StorageManager.getString('user_name');

// Clear storage
await StorageManager.clear();
```

---

### UserManager
**Purpose**: Manage user state and subscription status

**Location**: `lib/core/managers/user_manager.dart`

**Responsibilities**:
- Track subscription status
- Manage premium features access
- Persist user preferences

**Usage Example**:
```dart
// Check subscription
final isPremium = await UserManager.hasPremiumSubscription();

// Update subscription
await UserManager.setPremiumSubscription(true);

// Clear user data
await UserManager.clearUserData();
```

---

## 🎨 Features

### 1️⃣ Splash Feature
**Purpose**: App initialization and route decision

**Location**: `lib/features/splash/`

**State Management**: `SplashCubit`

**Flow**:
1. Check onboarding completion status
2. Navigate to onboarding OR main view
3. No API calls, pure routing logic

**Key Files**:
- `presentation/cubit/splash_cubit.dart`
- `presentation/pages/splash_page.dart`

---

### 2️⃣ Onboarding Feature
**Purpose**: First-time user introduction

**Location**: `lib/features/onboarding/`

**State Management**: Cubit-less (simple state)

**Flow**:
1. Show onboarding screens
2. Mark as completed in storage
3. Navigate to main view

**Key Files**:
- `presentation/pages/onboarding_page.dart`
- `presentation/widgets/onboarding_card.dart`

---

### 3️⃣ Main View Feature
**Purpose**: Tab-based navigation container

**Location**: `lib/features/main_view/`

**State Management**: `MainViewCubit`

**Responsibilities**:
- Manage bottom navigation state
- Switch between tabs
- Maintain tab navigation state

**Tabs**:
1. Home (plant scanning)
2. My Garden
3. Profile

**Key Files**:
- `presentation/cubit/main_view_cubit.dart`
- `presentation/pages/main_view_page.dart`

---

### 4️⃣ Home Feature
**Purpose**: Plant identification and question browsing

**Location**: `lib/features/home/`

**State Management**: `HomeBloc`

**Data Flow**:
```
HomeBloc → GetQuestionsUseCase → HomeRepository → RemoteDataSource → API
```

**Events**:
- `LoadQuestionsAndCategories`: Fetch initial data

**States**:
- `HomeInitial`: Initial state
- `HomeLoading`: Data fetching
- `HomeLoaded`: Data ready with questions and categories

**Error Handling**:
- No error state in BLoC state
- Errors trigger `GlobalOverlayManager.openErrorPopup()`
- UI remains stable with empty lists

**Key Files**:
- `data/datasources/home_remote_data_source.dart`
- `data/models/question_model.dart`, `category_model.dart`
- `data/repositories/home_repository_impl.dart`
- `domain/entities/question_entity.dart`, `category_entity.dart`
- `domain/repositories/home_repository.dart`
- `domain/usecases/get_questions_use_case.dart`, `get_categories_use_case.dart`
- `presentation/bloc/home_bloc.dart`
- `presentation/pages/home_page.dart`

---

### 5️⃣ Payment Feature
**Purpose**: Premium subscription management

**Location**: `lib/features/payment/`

**State Management**: `PaywallCubit`

**Responsibilities**:
- Display subscription plans
- Manage plan selection
- Handle purchase flow
- Track paywall impressions

**Plans**:
1. Weekly
2. Monthly (Most Popular)
3. Yearly (Best Value)

**Key Files**:
- `presentation/cubit/paywall_cubit.dart`
- `presentation/pages/paywall_page.dart`
- `presentation/widgets/plan_card.dart`, `feature_item.dart`

---

## 🧪 Testing

### Test Structure
```
test/
├── features/
│   ├── home/
│   │   └── presentation/bloc/home_bloc_test.dart       # HomeBloc tests
│   ├── payment/
│   │   └── presentation/cubit/paywall_cubit_test.dart  # PaywallCubit tests
│   └── splash/
│       └── presentation/cubit/splash_cubit_test.dart   # SplashCubit tests
└── injection_container_test.dart                        # DI tests
```

### Testing Tools
- **bloc_test**: BLoC/Cubit testing utilities
  - `blocTest<Bloc, State>()` for structured tests
  - `build()`, `act()`, `expect()`, `verify()`
  
- **mocktail**: Mocking without code generation
  - `class MockRepository extends Mock implements Repository`
  - `when(() => mock.method()).thenAnswer((_) async => value)`
  - `verify(() => mock.method()).called(1)`

### Test Coverage
**Total Tests**: 21/21 passing ✅

#### HomeBloc Tests (3)
- ✅ Initial state verification
- ✅ Successful data loading
- ✅ Error handling with popup

#### PaywallCubit Tests (7)
- ✅ Initial state
- ✅ Plan selection
- ✅ Feature toggling
- ✅ Purchase initiation
- ✅ Subscription restoration
- ✅ Paywall dismissal
- ✅ Impression tracking

#### SplashCubit Tests (5)
- ✅ Initial state
- ✅ Navigation to onboarding (first launch)
- ✅ Navigation to main view (returning user)
- ✅ Storage error handling
- ✅ State persistence

#### Dependency Injection Tests (6)
- ✅ All core managers registered
- ✅ All repositories registered
- ✅ All UseCases registered
- ✅ All BLoCs/Cubits registered
- ✅ All data sources registered
- ✅ Singleton verification

### Running Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/home/presentation/bloc/home_bloc_test.dart

# Run tests in watch mode
flutter test --watch
```

### Best Practices
1. **Mock External Dependencies**: Always mock repositories, data sources, and managers
2. **Test State Transitions**: Verify initial → loading → loaded/error
3. **Verify Method Calls**: Use `verify()` to ensure UseCases/repositories are called
4. **Test Error Scenarios**: Mock failures and verify error handling
5. **Keep Tests Fast**: Avoid real network calls or file I/O
6. **Use Descriptive Names**: `test('should emit [Loading, Loaded] when data fetch succeeds')`

For detailed testing documentation, see [TEST_COVERAGE.md](./TEST_COVERAGE.md)

---

## 📚 Development Guide

### Prerequisites
- Flutter SDK 3.x
- Dart SDK 3.x
- iOS: Xcode 15+ (macOS only)
- Android: Android Studio / VS Code with Flutter extension

### Setup
```bash
# Clone repository
git clone <repository-url>
cd plant_scope

# Install dependencies
flutter pub get

# Generate code (Freezed, JSON serialization)
dart run build_runner build --delete-conflicting-outputs

# Run app
flutter run
```

### Project Commands
```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage

# Format code
dart format .

# Analyze code
flutter analyze

# Clean build artifacts
flutter clean

# Rebuild generated code
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Environment Configuration
Create `.env` file (if needed):
```
API_BASE_URL=https://api.example.com
API_KEY=your_api_key_here
```

### Adding New Features
1. Create feature folder: `lib/features/feature_name/`
2. Add layers: `data/`, `domain/`, `presentation/`
3. Define entities in domain layer
4. Create models in data layer
5. Implement repository and data sources
6. Create BLoC/Cubit in presentation layer
7. Build UI (pages/widgets)
8. Register dependencies in `injection_container.dart`
9. Write tests in `test/features/feature_name/`

### Adding New Dependencies
```bash
# Add package
flutter pub add package_name

# Add dev dependency
flutter pub add --dev package_name

# Update dependencies
flutter pub upgrade
```

### Code Generation
```bash
# Watch mode (auto-regenerate on file changes)
dart run build_runner watch

# One-time generation
dart run build_runner build

# Clean and rebuild
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Building for Release
```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires macOS)
flutter build ipa --release
```

### Debugging Tips
1. **Network Requests**: Use Dio interceptors for logging
2. **State Changes**: Enable bloc observer for logging
3. **Widget Rebuild**: Use Flutter DevTools performance tab
4. **Memory Leaks**: Profile mode with Observatory
5. **Crashes**: Check Dart DevTools debugger

### CI/CD Integration
- Run tests on each push: `flutter test`
- Static analysis: `flutter analyze`
- Format check: `dart format --set-exit-if-changed .`

---

## 📖 Additional Resources

- **Flutter Documentation**: https://flutter.dev/docs
- **BLoC Library**: https://bloclibrary.dev
- **Clean Architecture**: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- **Mocktail**: https://pub.dev/packages/mocktail
- **Go Router**: https://pub.dev/packages/go_router

---

**Last Updated**: 2025
**Version**: 1.0.0
**Maintainer**: Plant Scope Team

## Yeni Feature Ekleme

1. `lib/features/` altında yeni klasör oluştur
2. Clean Architecture katmanlarını oluştur:
   - `data/datasources/`
   - `data/models/`
   - `data/repositories/`
   - `domain/entities/`
   - `domain/repositories/`
   - `domain/usecases/`
   - `presentation/bloc/`
   - `presentation/pages/`
3. `injection_container.dart` içinde feature'ı kaydet
4. Router'a yeni route'ları ekle

## Dependency Injection Kullanımı

```dart
// Servis kaydetme (injection_container.dart)
sl.registerLazySingleton<MyRepository>(() => MyRepositoryImpl());

// Kullanım
final repository = sl<MyRepository>();
```

## Çalıştırma

```bash
# Bağımlılıkları yükle
flutter pub get

# Uygulamayı çalıştır
flutter run

# Dev flavor ile çalıştır
flutter run --flavor dev

# Prod flavor ile çalıştır
flutter run --flavor prod
```

## Build

```bash
# Android APK
flutter build apk --flavor dev
flutter build apk --flavor prod

# iOS
flutter build ios --flavor dev
flutter build ios --flavor prod
```
