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
    apiKey: 'AIzaSyAGsFeGm-WbEVc9KFnV9uEPCnSdWPwlPb0',
    appId: '1:232246013927:web:9a2fc8b3821b55f3105742',
    messagingSenderId: '232246013927',
    projectId: 'atelier3-12294',
    authDomain: 'atelier3-12294.firebaseapp.com',
    storageBucket: 'atelier3-12294.firebasestorage.app',
    measurementId: 'G-C0ZJZV651N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANI4IYarJKOgGqtEk53sOKa8q7ho-v2Vw',
    appId: '1:232246013927:android:6e0bb7316d509a71105742',
    messagingSenderId: '232246013927',
    projectId: 'atelier3-12294',
    storageBucket: 'atelier3-12294.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSFyRdND78hvZoRnur7fCQJbxgVKWzHNg',
    appId: '1:232246013927:ios:737a9de8ea024aed105742',
    messagingSenderId: '232246013927',
    projectId: 'atelier3-12294',
    storageBucket: 'atelier3-12294.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSFyRdND78hvZoRnur7fCQJbxgVKWzHNg',
    appId: '1:232246013927:ios:737a9de8ea024aed105742',
    messagingSenderId: '232246013927',
    projectId: 'atelier3-12294',
    storageBucket: 'atelier3-12294.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGsFeGm-WbEVc9KFnV9uEPCnSdWPwlPb0',
    appId: '1:232246013927:web:bc3107c1cd93f6b5105742',
    messagingSenderId: '232246013927',
    projectId: 'atelier3-12294',
    authDomain: 'atelier3-12294.firebaseapp.com',
    storageBucket: 'atelier3-12294.firebasestorage.app',
    measurementId: 'G-Z03EM63Q84',
  );
}
