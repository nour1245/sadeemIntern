# Sadeem Intern - E-Commerce App

![Flutter](https://img.shields.io/badge/Flutter-3.16.9-blue)
![Dart](https://img.shields.io/badge/Dart-3.3.0-blue)

A feature-rich e-commerce mobile application built with Flutter, implementing modern architecture and advanced concepts.

[![GitHub Repository](https://img.shields.io/badge/GitHub-Repository-brightgreen)](https://github.com/nour1245/sadeemIntern)

## 📱 Features
- **Onboarding Screen** with dynamic pagination
- **Authentication Flow** (Login/Session Management)
- **Home Screen** with:
  - Product categories
  - Best-selling products
  - Category-based product filtering
- **Product Search** with real-time results
- **Shopping Cart** management
- **User Profile** with personal details
- **Responsive UI** across devices
- Infinite scroll pagination
- Secure token storage
- Internationalization support

## 🛠 Advanced Technologies & Packages
| Category              | Technologies/Packages                                                                 |
|-----------------------|---------------------------------------------------------------------------------------|
| **State Management**  | `flutter_bloc`, `bloc` (Cubit Pattern)                                                |
| **Dependency Injection** | `get_it`                                                                          |
| **Networking**        | `dio`, `retrofit`, `pretty_dio_logger`                                                |
| **Local Storage**     | `hive`, `shared_preferences`, `flutter_secure_storage`                                |
| **UI/UX**             | `curved_labeled_navigation_bar`, `shimmer`, `flutter_screenutil`                      |
| **Code Generation**   | `freezed`, `retrofit_generator`, `json_serializable`, `build_runner`                  |
| **Navigation**        | Custom routing with `AppRouter`                                                       |
| **Internationalization** | `flutter_localizations`, `intl`                                                  |
| **Security**          | Encrypted token storage with `flutter_secure_storage`                                 |

## 🚀 Architecture
- **Clean Architecture** principles
- Feature-first folder structure
- Repository pattern implementation
- Separation of concerns:
  - Data Layer (Repositories/Datasources)
  - Business Logic Layer (Cubits)
  - Presentation Layer (UI Components)

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/nour1245/sadeemIntern.git

2. **install dependencies**
    ```bash
    flutter pub get

🌐 Internationalization
Supports multiple languages using:

flutter_intl for localization management

Generated localization files in lib/generated/l10n

🔒 Security Features
Secure token storage using flutter_secure_storage

API request encryption

Session management with shared_preferences

📸 Screenshots
soon...

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

coming updates:
1. Adding actual screenshots
2. Including a CI/CD badge
3. Adding contribution guidelines
4. Expanding the architecture diagram section
5. Adding API documentation links
