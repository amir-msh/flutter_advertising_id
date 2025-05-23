import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_advertising_id.dart';
import 'flutter_advertising_id_platform_interface.dart';

/// An implementation of [FlutterAdvertisingIdPlatform] that uses method channels.
class MethodChannelFlutterAdvertisingId extends FlutterAdvertisingIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'dev.openflutter/flutter_advertising_id',
  );

  @override
  Future<String?> getAdvertisingId([
    bool requestTrackingAuthorization = false,
  ]) async {
    return await methodChannel.invokeMethod<String>(
      'getAdvertisingId',
      requestTrackingAuthorization,
    );
  }

  @override
  Future<bool?> get limitAdTrackingEnabled async =>
      await methodChannel.invokeMethod<bool?>('limitAdTrackingEnabled');

  @override
  Future<AdTrackingAuthorizationStatus> get authorizationStatus {
    return methodChannel.invokeMethod<int>('authorizationStatus').then((value) {
      switch (value) {
        case 0:
          return AdTrackingAuthorizationStatus.notDetermined;
        case 1:
          return AdTrackingAuthorizationStatus.restricted;
        case 2:
          return AdTrackingAuthorizationStatus.denied;
        case 3:
          return AdTrackingAuthorizationStatus.authorized;
        default:
          throw Exception('Unknown authorization status: $value');
      }
    });
  }
}
