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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx9dXJuwC010SZ3OVnEZh2ZFDXGysS6os',
    appId: '1:362798120813:android:3a776cf5208dcbb0ab6464',
    messagingSenderId: '362798120813',
    projectId: 'salim-cbt',
    databaseURL: 'https://salim-cbt-default-rtdb.firebaseio.com',
    storageBucket: 'salim-cbt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTuRGrNSX_bfOljEc0HkYbPuv31kQcBxA',
    appId: '1:362798120813:ios:4f08de8cfe2a595fab6464',
    messagingSenderId: '362798120813',
    projectId: 'salim-cbt',
    databaseURL: 'https://salim-cbt-default-rtdb.firebaseio.com',
    storageBucket: 'salim-cbt.appspot.com',
    androidClientId: '362798120813-ahru52km72n9cpdkltvsrvm4pao9tm4q.apps.googleusercontent.com',
    iosClientId: '362798120813-b09g4tjhgc2pq9e90f40i829mjnonpdm.apps.googleusercontent.com',
    iosBundleId: 'com.example.salimCbt',
  );
}
