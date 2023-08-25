// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCx8YcWc-g9p3s676uNrGXaPhcB2bHpQp0',
    appId: '1:1097420132312:web:f1aafe0041ff4e5573acad',
    messagingSenderId: '1097420132312',
    projectId: 'financeapp-270a7',
    authDomain: 'financeapp-270a7.firebaseapp.com',
    storageBucket: 'financeapp-270a7.appspot.com',
    measurementId: 'G-P6XQ2FHYYV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ5va2MV6yv-Yy7Zthg8FgxijC9H8k7cw',
    appId: '1:1097420132312:android:fd6518bbc6ed98b073acad',
    messagingSenderId: '1097420132312',
    projectId: 'financeapp-270a7',
    storageBucket: 'financeapp-270a7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2RyoItaGcsgB-FQCrVrQRNzwWhYkKdpI',
    appId: '1:1097420132312:ios:f498c698ab45cb3373acad',
    messagingSenderId: '1097420132312',
    projectId: 'financeapp-270a7',
    storageBucket: 'financeapp-270a7.appspot.com',
    iosClientId: '1097420132312-hbcbfne5bie503k8p7oo38k328su6i29.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyecto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2RyoItaGcsgB-FQCrVrQRNzwWhYkKdpI',
    appId: '1:1097420132312:ios:96ea77ecd9f447b373acad',
    messagingSenderId: '1097420132312',
    projectId: 'financeapp-270a7',
    storageBucket: 'financeapp-270a7.appspot.com',
    iosClientId: '1097420132312-pvcvat30r7uk8rcvfddm4bds225lslda.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyecto.RunnerTests',
  );
}