import 'package:flutter_advertising_id/flutter_advertising_id.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_advertising_id_method_channel.dart';

abstract class FlutterAdvertisingIdPlatform extends PlatformInterface {
  /// Constructs a FlutterAdvertisingIdPlatform.
  FlutterAdvertisingIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAdvertisingIdPlatform _instance =
      MethodChannelFlutterAdvertisingId();

  /// The default instance of [FlutterAdvertisingIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAdvertisingId].
  static FlutterAdvertisingIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAdvertisingIdPlatform] when
  /// they register themselves.
  static set instance(FlutterAdvertisingIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getAdvertisingId([
    bool requestTrackingAuthorization = false,
  ]) async {
    throw UnimplementedError('getAdvertisingId() has not been implemented.');
  }

  Future<bool?> get limitAdTrackingEnabled async {
    throw UnimplementedError(
      'limitAdTrackingEnabled has not been implemented.',
    );
  }

  Future<TrackingAuthorizationStatus> get authorizationStatus async {
    throw UnimplementedError('authorizationStatus has not been implemented.');
  }
}
