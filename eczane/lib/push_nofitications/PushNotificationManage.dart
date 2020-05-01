import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    String token;
    if (!_initialized) {


      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print('COPY THIS TO MESSAGES');
      print("FirebaseMessaging token: $token");

      _initialized = true;
    }
    else
      print("FirebaseMessaging token: $token");
  }
  Future www()async{
    return await _firebaseMessaging.getToken();
  }





}
