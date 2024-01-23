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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmYQmixgq0ZRtT1COgBi3CBadrUXzExMQ',
    appId: '1:915217943927:web:537102929ae9eaad2de572',
    messagingSenderId: '915217943927',
    projectId: 'customchatapp-7be65',
    authDomain: 'customchatapp-7be65.firebaseapp.com',
    storageBucket: 'customchatapp-7be65.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7aGvMz5vODq4TkHZLOu9HR_kNd8WRang',
    appId: '1:915217943927:android:964bf476b5058eab2de572',
    messagingSenderId: '915217943927',
    projectId: 'customchatapp-7be65',
    storageBucket: 'customchatapp-7be65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBw7mdLpVyX2L7RvLRNgO-9F0_Kw8TDcaA',
    appId: '1:915217943927:ios:d47b942177c791612de572',
    messagingSenderId: '915217943927',
    projectId: 'customchatapp-7be65',
    storageBucket: 'customchatapp-7be65.appspot.com',
    iosBundleId: 'com.example.chatApplication',
  );
}
