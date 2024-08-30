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
    apiKey: 'AIzaSyASmLuAJHzEsx35TiCqs9wsY_P5fLL4WPU',
    appId: '1:421083927001:web:50834423f0481ec41409c8',
    messagingSenderId: '421083927001',
    projectId: 'phoneauth-71cda',
    authDomain: 'phoneauth-71cda.firebaseapp.com',
    storageBucket: 'phoneauth-71cda.appspot.com',
    measurementId: 'G-FCZEJFR3FL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsEH7Rspgt1DwVWVWrM4uJsYjik1p67_M',
    appId: '1:421083927001:android:3d6ed492d184ef191409c8',
    messagingSenderId: '421083927001',
    projectId: 'phoneauth-71cda',
    storageBucket: 'phoneauth-71cda.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHPoHYVZQym6SGzZ1bDRab9YXL_KtweQE',
    appId: '1:421083927001:ios:e2d2d243d98c51d91409c8',
    messagingSenderId: '421083927001',
    projectId: 'phoneauth-71cda',
    storageBucket: 'phoneauth-71cda.appspot.com',
    androidClientId: '421083927001-j1i9uglc446ila1jf5ov3mcr3kjn3kni.apps.googleusercontent.com',
    iosClientId: '421083927001-0ga2upun2dnl3uptj1tg5s5klo16cchp.apps.googleusercontent.com',
    iosBundleId: 'com.example.providerLearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHPoHYVZQym6SGzZ1bDRab9YXL_KtweQE',
    appId: '1:421083927001:ios:7496ec7e8085a0ca1409c8',
    messagingSenderId: '421083927001',
    projectId: 'phoneauth-71cda',
    storageBucket: 'phoneauth-71cda.appspot.com',
    androidClientId: '421083927001-j1i9uglc446ila1jf5ov3mcr3kjn3kni.apps.googleusercontent.com',
    iosClientId: '421083927001-kjlqcqn7uvg0e4rbijh30ch6f0dqv5oi.apps.googleusercontent.com',
    iosBundleId: 'com.example.providerLearn.RunnerTests',
  );
}
