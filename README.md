# Flutter Firestore Authentication with BLoC Pattern

This project is an example of implementing the BLoC (Business Logic Component) pattern in a Flutter application that uses Firestore and Firebase Authentication.

## Project Structure

The project is structured as follows:

- `lib/`: This is where the main code of the application resides.  
  - `bloc/`: Contains the BLoC classes for managing app state.
  - `models/`: Contains the data models used in the application.
  - `screens/`: Contains the UI screens of the application.
  - `manager/`: Contains the manager used for Firebase Authentication and Firestore.
  - `features/`: Contains the different features of the application, each feature is isolated and independent from others.
  - `shared/`: Contains the code that is shared across multiple features such as widgets, utilities, and constants.
  - `core/`: Contains the core functionalities that are used throughout the application such as network requests, local storage, and authentication.
- `test/`: Contains the unit tests for the application.
- `pubspec.yaml`: The file for managing Dart packages for the application.

## About BLoC Pattern

The BLoC pattern is a design pattern in Flutter for separating business logic from UI code. It stands for Business Logic Component. The main idea behind BLoC is that everything in the app should be represented as stream of events: widgets submit events; other widgets will respond. BLoC sits in the middle, managing the conversation.

The BLoC pattern makes your code modular, easy to test and scalable. It separates the business logic from the UI, allowing developers to focus on the UI while knowing that the business logic is separated and handled.

## Why Use BLoC Pattern

- **Separation of Concerns**: The BLoC pattern separates business logic from UI code. This makes your code cleaner and easier to maintain.
- **Testability**: Because business logic is separated from UI code, it's easier to write unit tests for the business logic.
- **Reusability**: The BLoC pattern allows you to reuse the same business logic for different UIs.

## Getting Started

To get started with this project, clone the repository and run `flutter run` in the root directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
