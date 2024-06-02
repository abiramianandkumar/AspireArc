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
    apiKey: 'AIzaSyAC0aZ9sj-fXzdnDQRCa25HQ60uKUgIma4',
    appId: '1:164648465017:web:3da731d26e0d0636819aa8',
    messagingSenderId: '164648465017',
    projectId: 'aspirearc',
    authDomain: 'aspirearc.firebaseapp.com',
    storageBucket: 'aspirearc.appspot.com',
    measurementId: 'G-S9PEV7NJEP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOJKbgdQa979OM2EB3z7vd1r08qXMdXd0',
    appId: '1:164648465017:android:fe47e641df663576819aa8',
    messagingSenderId: '164648465017',
    projectId: 'aspirearc',
    storageBucket: 'aspirearc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHUsp0M8oh774uaFwnQUZXyseBZvg17U4',
    appId: '1:164648465017:ios:ae3f48ff48e7a56f819aa8',
    messagingSenderId: '164648465017',
    projectId: 'aspirearc',
    storageBucket: 'aspirearc.appspot.com',
    iosBundleId: 'com.example.aspireArc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHUsp0M8oh774uaFwnQUZXyseBZvg17U4',
    appId: '1:164648465017:ios:ae3f48ff48e7a56f819aa8',
    messagingSenderId: '164648465017',
    projectId: 'aspirearc',
    storageBucket: 'aspirearc.appspot.com',
    iosBundleId: 'com.example.aspireArc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAC0aZ9sj-fXzdnDQRCa25HQ60uKUgIma4',
    appId: '1:164648465017:web:e64a0febec7cce86819aa8',
    messagingSenderId: '164648465017',
    projectId: 'aspirearc',
    authDomain: 'aspirearc.firebaseapp.com',
    storageBucket: 'aspirearc.appspot.com',
    measurementId: 'G-CENN8MHE00',
  );
}
