import 'package:neelkanth/routing/navigation_stack_item.dart';
import 'package:neelkanth/routing/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

const String keyAppLanguage = 'keyAppLanguage';
const String keyIsOnBoardingShowed = 'keyIsOnBoardingShowed';
///
const String keyUserAuthToken = 'keyUserAuthToken';
const String keyUserId = 'keyUserId';
const String keyUserUniqueId = 'keyUserUniqueId';
const String keyEntityId = 'keyUserUniqueId';
const String keyDeviceId = 'keyDeviceId';
const String keyEmailVerified = 'keyEmailVerified';
const String keyContactVerified = 'keyContactVerified';
const String keyProfileCompleted = 'keyProfileCompleted';

const String keyUserRefreshToken = 'keyUserRefreshToken';
const String keyDeviceFCMToken = 'keyDeviceFCMToken';
const String keyAppThemeDark = 'keyAppThemeDark';

class Session {
  Session._();

  static var userBox = Hive.box('userBox');

  static String getUserAccessToken() => (userBox.get(keyUserAuthToken) ?? '');
  static int getUserId() => (userBox.get(keyUserId) ?? 0);
  static String getUserUniqueId() => (userBox.get(keyUserUniqueId) ?? '');
  static String getUserEntityId() => (userBox.get(keyEntityId) ?? '');

  static bool getEmailVerified() => (userBox.get(keyEmailVerified) ?? false);
  static bool getContactVerified() => (userBox.get(keyContactVerified) ?? false);
  static bool getProfileCompleted() => (userBox.get(keyProfileCompleted) ?? false);

  static bool isUserLogin() => (getUserAccessToken().isNotEmpty);



  static String getAppLanguage() => (userBox.get(keyAppLanguage) ?? 'en');

  static bool getIsOnBoardingShowed() =>
      (userBox.get(keyIsOnBoardingShowed) ?? false);

  static String getDeviceID() => (userBox.get(keyDeviceId) ?? '');

  static String getDeviceFCMToken() =>
      (userBox.get(keyDeviceFCMToken) ?? '123456');

  static bool? getIsAppThemeDark() => (userBox.get(keyAppThemeDark));

  ///Save Local Data
  static saveLocalData(String key, value) {
    userBox.put(key, value);
  }

  static saveDeviceFcmToken(String token){
    userBox.put(keyDeviceFCMToken, token);
  }

  ///Save Local Data
  static setIsThemeModeDark(value) {
    userBox.put(keyAppThemeDark, value);
  }


}
