# Flutter Reader

Flutter Reader is an open-source eBook reading application built using Flutter. It aims to provide a feature-rich and seamless reading experience, similar to popular eBook platforms like WeChat Reader. The app is designed to be highly customizable and scalable for various use cases.

## Features

- **Beautiful Book Display**: Showcase books with modern UI designs.
- **Customizable Reading Experience**: Adjustable font size, line spacing, and themes (including night mode).
- **Progress Tracking**: Automatically save and sync reading progress.
- **Bookmarks and Highlights**: Add, view, and manage bookmarks and highlights.
- **Online & Offline Reading**: Supports downloading books for offline reading.
- **Search & Filtering**: Search through books and filter by categories or tags.
- **Cloud Sync**: Sync reading data across devices (optional).
- **Audio Support**: Listen to books with Text-to-Speech (TTS) functionality.
- **Social Features**: Share book recommendations and reviews.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. You can download it from [Flutter's official website](https://flutter.dev/docs/get-started/install).
- **Dart SDK**: Included with Flutter.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/orz-ai/flutter_reader.git
   cd flutter_reader
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

### Supported Platforms

- Android
- iOS
- Web (Experimental)

## Folder Structure

```
flutter_reader/
├── android/              # Android project
├── ios/                  # iOS project
├── lib/                  # Core code
│   ├── app/              # Main app module
│   │   ├── base/         # Base module
│   │   │   ├── controller/ # Base logic handlers
│   │   │   ├── model/      # Base data structures
│   │   ├── middleware/    # Route middleware
│   │   ├── modules/       # Feature modules
│   │   │   ├── bindings/    # Dependency bindings
│   │   │   ├── controllers/ # Module logic handlers
│   │   │   ├── model/       # Request and response models
│   │   │   ├── views/       # Module UI pages
│   │   │   ├── widget/      # Module-specific widgets
│   │   │   └── index        # Module entry point
│   │   ├── routes/        # Route definitions
│   ├── common/            # Common utilities and extensions
│   │   ├── extensions/    # Extension methods
│   │   ├── lang/          # Language support
│   │   ├── utils/         # Utility classes
│   │   ├── values/        # Constant values
│   ├── http/              # Network layer with Dio
│   │   ├── entity/        # Base data structures
│   │   ├── interceptor/   # Interceptors
│   ├── widget/            # Common reusable widgets
│   ├── global/            # Third-party SDK initialization and global configuration
│   ├── initial_binding/   # Global dependency initialization
│   ├── main.dart          # Entry point
├── pubspec.yaml           # Dependency configuration
```

## Dependencies

Key packages used in this project:

- **State Management**: [Riverpod](https://pub.dev/packages/riverpod) / [Bloc](https://pub.dev/packages/flutter_bloc)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Local Storage**: [Hive](https://pub.dev/packages/hive)
- **UI Components**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil), [animations](https://pub.dev/packages/animations)
- **Text-to-Speech**: [flutter_tts](https://pub.dev/packages/flutter_tts)

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your feature description"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries or suggestions, feel free to reach out:

- **Email**: deepincode@qq.com
- **GitHub Issues**: [Create an issue](https://github.com/orz-ai/flutter_reader/issues)

---

Happy Reading with **Flutter Reader**! 📚

