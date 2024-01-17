# Profile App

 A Flutter application for managing user profiles, featuring:

Personal Form screen: Collects user information (name, email, password, gender, birthdate) and saves it to a local database.
Profile screen: Displays saved user data and a "View on Map" button to open the user's location on an external map app.
Language switching: Supports English and Arabic, with a language switcher button in the AppBar.
Clean architecture: Organized into layers for data, domain, and presentation logic.
Dependency injection: Facilitates testing and modularity.
BLoC state management: Manages application state efficiently.
Localization: Provides translations for both English and Arabic.
Local database: Uses hive to store user data persistently.
Production and Testing modes: Allows for different configurations based on environment.

 ## Getting Started

Clone the repository: git clone https://github.com/mohamedelshmnhory/profile.git
Install dependencies: flutter pub get
Run the app: flutter run

 ## Features

Personal Form:
Collects user information.
Saves data to the local database.
Allocates location on submit.
Profile:
Displays saved user data.
Includes a "View on Map" button to open the user's location.
Language Switching:
Supports English and Arabic.
Allows language switching via the AppBar button.

 ## Architecture

Clean architecture: Separates concerns into layers for better maintainability and testability.
Dependency injection: Enables flexible component configuration.
BLoC state management: Manages state in a predictable and testable manner.

 ## Localization

Supports English and Arabic languages.
Uses easy_localization for translation management.

 ## Database

Uses hive for local database operations.
Stores user data persistently.

 ## Additional Notes

Production and Testing modes: Use environment variables or a configuration class to switch between modes.
   Switch package name: flutter pub run change_app_package_name:main com.naser.profile
Error handling and validation: Implement proper error handling and form validation.
UI design and styling: Apply a consistent and visually appealing UI design.

## APK Download

You can download the APK for the Users app from the following link:

[Profile App APK](https://drive.google.com/file/d/1oEp4MS-BNPQkLqgC_lcL5qagfkftWhBI/view?usp=share_link)


