import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:toctoc/app/shared/services/notification_service.dart';

class CallStore extends Store<Map<String, dynamic>> {

  CallStore() : super({
    'name': '',
    'profilePictureUrl': ''
  });

  Future<void> loadMessageData(String? receiveData) async {
    if(receiveData != null){
      update(jsonDecode(receiveData));
    }else{
      final NotificationAppLaunchDetails? notificationAppLaunchDetails = await NotificationService.notification.getNotificationAppLaunchDetails();
      if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
        try{
          String? dataEncode = notificationAppLaunchDetails!.notificationResponse?.payload;
          if(dataEncode != null){
              update(jsonDecode(dataEncode));
          }else{
            Modular.to.pop();
          }
        }catch(e){
          Modular.to.pop();
        }
      }else{
        Modular.to.pop();
      }
    }
  }

}