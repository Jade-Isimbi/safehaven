# SafeHaven

A Flutter-based mobile application designed to provide support, education, and resources for individuals affected by gender-based violence (GBV). SafeHaven offers a comprehensive platform with educational content, coping tools, legal rights information, and support services.

## Features

- **Educational Content**: Comprehensive information about GBV awareness and prevention
- **Coping Tools**: Mental health resources and wellness techniques
- **Legal Rights**: Information about legal rights and protections
- **Support Directory**: Access to support services and emergency contacts
- **Bookmarking System**: Save important content for later reference
- **Rating System**: User feedback mechanism for continuous improvement
- **Multi-language Support**: Content available in multiple languages
- **User Authentication**: Secure login and registration system

##  Screenshots

in the folder named screenshot

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** 
- **Dart SDK** 
- **Android Studio** / **VS Code** with Flutter extensions
- **Firebase CLI** (for backend services)
- **Git** (for version control)

##  Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/safehaven.git
cd safehaven
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Firebase Setup

#### Install Firebase CLI
```bash
npm install -g firebase-tools
```

#### Login to Firebase
```bash
firebase login
```

#### Initialize Firebase (if not already done)
```bash
firebase init
```

#### Configure Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select existing one
3. Enable Authentication, Firestore, and Storage
4. Download `google-services.json` for Android and `GoogleService-Info.plist` for iOS
5. Place them in the appropriate directories:
   - Android: `android/app/google-services.json`
   - iOS: `ios/Runner/GoogleService-Info.plist`

### 4. Environment Configuration

Create a `.env` file in the root directory (if needed):

```env
FIREBASE_PROJECT_ID=your-firebase-project-id
```

### 5. Run the Application

#### For Development
```bash
flutter run
```

#### For Production Build
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## Project Structure

```
lib/
├── features/                    # Feature-based architecture
│   ├── auth/                   # Authentication
│   ├── bookmarks/              # Bookmark functionality
│   ├── coping/                 # Mental health tools
│   ├── gbv/                    # GBV educational content
│   ├── home/                   # Home screen
│   ├── menu/                   # Main menu
│   ├── onboarding/             # Onboarding flow
│   ├── rating/                 # User rating system
│   ├── rights/                 # Legal rights information
│   ├── search/                 # Search functionality
│   ├── settings/               # App settings
│   ├── splash/                 # Splash screen
│   └── support/                # Support services
├── shared/                     # Shared components
│   ├── providers/              # Global providers
│   └── widgets/                # Reusable widgets
├── firebase_options.dart        # Firebase configuration
└── main.dart                   # App entry point
```

## Configuration

### Firebase Configuration

The app uses Firebase for:
- **Authentication**: User login/registration
- **Firestore**: Data storage for content and user data
- **Storage**: File storage (if needed)

### Dependencies

Key dependencies include:
- `firebase_core`: Firebase initialization
- `firebase_auth`: User authentication
- `cloud_firestore`: Database operations
- `provider`: State management
- `flutter_rating_bar`: Rating functionality

## Development

### Running Tests
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

### Format Code
```bash
flutter format lib/
```

### Generate Documentation
```bash
dart doc
```

##  Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Security Considerations

- User authentication is handled securely through Firebase Auth
- Sensitive data is stored in Firebase Firestore with proper security rules
- API keys and configuration are managed through Firebase Console
- User privacy is protected through proper data handling practices

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


