📁 Flutter Project Structure Explained

This repository provides a clear and beginner-friendly explanation of the default folder and file structure created when you initialize a Flutter project.

🚀 Introduction

When you create a Flutter project using:

flutter create project_name

Flutter automatically generates multiple folders and files. Understanding these is essential for efficient development.

This repository explains each component in a simple and practical way.



📂 Project Structure Overview
project_name/
│
├── lib/                # Main Dart code (UI & logic)
│   └── main.dart       # Entry point of the app
│
├── android/            # Android-specific configuration
├── ios/                # iOS-specific configuration
├── web/                # Web support files
├── windows/            # Windows desktop support
├── linux/              # Linux desktop support
├── macos/              # macOS desktop support
│
├── test/               # Test files
├── build/              # Auto-generated build files
├── .dart_tool/         # Internal Flutter/Dart files
│
├── pubspec.yaml        # Dependencies & assets
├── README.md           # Project documentation
└── .gitignore          # Ignored files for Git


📌 Folder & File Explanation
📁 lib/
The most important folder
Contains all Dart code
Includes main.dart (entry point of the app)

📁 android/
Contains native Android code (Java/Kotlin)
Handles permissions and build configuration

📁 ios/
Contains native iOS code (Swift/Objective-C)
Used when building for Apple devices

📁 web/
Enables running Flutter apps in the browser
Includes HTML, CSS, and JS files

📁 windows/ | linux/ | macos/
Desktop platform support
Platform-specific configurations

📁 test/
Used for writing test cases
Includes unit and widget testing

📁 build/
Stores compiled/generated files
Automatically created during build
⚠️ Do not modify manually

📁 .dart_tool/
Internal Flutter and Dart tooling files
⚠️ Ignore this folder
📄 Important Files
📄 pubspec.yaml ⭐
Manages dependencies
Declares assets like images and fonts

Example:

dependencies:
  flutter:
    sdk: flutter

📄 main.dart
Entry point of the Flutter app
Contains runApp() function

📄 .gitignore
Specifies files to ignore in version control

📄 README.md
Documentation of the project


🧠 Key Takeaways
Work mainly inside lib/
Use pubspec.yaml to manage packages
Avoid modifying build/ and .dart_tool/
Platform folders are rarely edited unless needed
🎯 Purpose of This Repository

This repository is created to help beginners:

Understand Flutter structure
Navigate project folders easily
Start development with clarity
📚 Learning Resource

This is part of my Flutter learning journey where I document concepts step by step.

🤝 Contributing

Feel free to contribute by improving explanations or adding examples.

👨‍💻 Author

Praveen
GitHub: https://github.com//praveeen014

⭐ Support

If you found this helpful, consider giving this repo a star ⭐