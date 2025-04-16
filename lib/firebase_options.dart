// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD0nhZQidq6iclDPKqJ-woNvH_xcrS5DOA',
    appId: '1:144102285007:web:0e088a157edfc9235861ba',
    messagingSenderId: '144102285007',
    projectId: 'fruit-hub-37180',
    authDomain: 'fruit-hub-37180.firebaseapp.com',
    storageBucket: 'fruit-hub-37180.firebasestorage.app',
    measurementId: 'G-36NMJG9B1D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDekvIFF_3iztXfSJKoqZmXl_z7zv2apDE',
    appId: '1:144102285007:android:02407a7b2971917c5861ba',
    messagingSenderId: '144102285007',
    projectId: 'fruit-hub-37180',
    storageBucket: 'fruit-hub-37180.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlWvYkW5bP0AjQVWrF55HVbQz4Gmv4KYM',
    appId: '1:144102285007:ios:86f3a3fd988e05135861ba',
    messagingSenderId: '144102285007',
    projectId: 'fruit-hub-37180',
    storageBucket: 'fruit-hub-37180.firebasestorage.app',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlWvYkW5bP0AjQVWrF55HVbQz4Gmv4KYM',
    appId: '1:144102285007:ios:86f3a3fd988e05135861ba',
    messagingSenderId: '144102285007',
    projectId: 'fruit-hub-37180',
    storageBucket: 'fruit-hub-37180.firebasestorage.app',
    iosBundleId: 'com.example.fruitsHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0nhZQidq6iclDPKqJ-woNvH_xcrS5DOA',
    appId: '1:144102285007:web:6a685d59a4f0c2ac5861ba',
    messagingSenderId: '144102285007',
    projectId: 'fruit-hub-37180',
    authDomain: 'fruit-hub-37180.firebaseapp.com',
    storageBucket: 'fruit-hub-37180.firebasestorage.app',
    measurementId: 'G-PHW456SR4E',
  );
}
