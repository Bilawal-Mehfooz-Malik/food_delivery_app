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
    apiKey: 'AIzaSyBAe355wd2N-OVz2TvnxluVw4HlzKUUEls',
    appId: '1:848245090569:web:3531207d9176958144cbd8',
    messagingSenderId: '848245090569',
    projectId: 'food-delivery-app-f44d5',
    authDomain: 'food-delivery-app-f44d5.firebaseapp.com',
    storageBucket: 'food-delivery-app-f44d5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_utY-9TLt_CXLUFxnFs4GPDJ-IERx-oQ',
    appId: '1:848245090569:android:9d1124d08d6e398a44cbd8',
    messagingSenderId: '848245090569',
    projectId: 'food-delivery-app-f44d5',
    storageBucket: 'food-delivery-app-f44d5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTkSJU-OR3ALSI-HMS9HAjUWR45fiX6Dw',
    appId: '1:848245090569:ios:659f33721d33de2e44cbd8',
    messagingSenderId: '848245090569',
    projectId: 'food-delivery-app-f44d5',
    storageBucket: 'food-delivery-app-f44d5.appspot.com',
    iosBundleId: 'com.example.foodDeliveryApp',
  );

}