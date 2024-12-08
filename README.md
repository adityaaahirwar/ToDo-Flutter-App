# ToDo Flutter App

## Description

The **ToDo Flutter App** is a simple yet functional task management application built using Flutter. It allows users to:

- Add tasks to a to-do list.
- Mark tasks as complete or incomplete.
- Delete tasks.
- Automatically save and retrieve tasks using local storage (SharedPreferences) to ensure data persists across app restarts.

This project is ideal for those learning Flutter or for developers seeking inspiration for a task management app.

---

## Features

- **Task Management**: Add, update, mark as done, and delete tasks.
- **Persistent Storage**: Tasks are saved locally and retrieved when the app is reopened.
- **Responsive UI**: Adapts to various screen sizes.
- **Flutter Best Practices**: Organized code structure with clean, maintainable design.

---

## Screenshots

Add relevant screenshots to showcase your app.

---

## Installation

### Prerequisites

1. Flutter installed on your system ([installation guide](https://flutter.dev/docs/get-started/install)).
2. Git installed ([Git installation guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)).

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/adityaaahirwarToDo-Flutter-App.git
   ```
2. Navigate to the project directory:
   ```bash
   cd ToDo-Flutter-App
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## Usage

1. Launch the app on your device or emulator.
2. Add new tasks by typing into the input field and pressing the **Add** button.
3. Mark tasks as complete by tapping the checkbox.
4. Delete tasks by pressing the delete button.
5. Close and reopen the app to see your tasks persist.

---

## Project Structure

```plaintext
lib/
├── main.dart       # Entry point of the app
├── model/         # Contains data models (e.g., ToDo.dart)
├── screens/       # UI screens for the app
├── widgets/       # Reusable UI components (e.g., ToDoItem)
├── constants/     # App-wide constants (e.g., colors.dart)
```

---

## Technologies Used

- **Flutter**: Framework for building cross-platform apps.
- **Dart**: Programming language used in Flutter.
- **SharedPreferences**: Library for storing key-value pairs locally.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Description of changes"
   ```
4. Push your branch:
   ```bash
   git push origin feature-name
   ```
5. Open a Pull Request.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contact

For questions or feedback, contact:

- **Name**: Aditya Ahirwar
- **Email**: [adityahirwar21@gmail.com](mailto\:adityahirwar21@gmail.com)
- **GitHub**: adityaaahirwar

