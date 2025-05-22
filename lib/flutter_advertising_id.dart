import 'flutter_advertising_id_platform_interface.dart';

/// A class that provides methods to interact with the advertising ID and
/// limit ad tracking settings of the platform.
class AdvertisingId {
  /// Retrieves the advertising ID of the device.
  ///
  /// If [requestTrackingAuthorization] is set to `true`, it will request
  /// tracking authorization from the user before retrieving the ID.
  ///
  /// Returns a `Future` that resolves to the advertising ID as a `String?`.
  /// If the ID cannot be retrieved, it resolves to `null`.
  Future<String?> getAdvertisingId([
    bool requestTrackingAuthorization = false,
  ]) async {
    return FlutterAdvertisingIdPlatform.instance.getAdvertisingId(
      requestTrackingAuthorization,
    );
  }

  /// Checks whether the "Limit Ad Tracking" setting is enabled on the device.
  ///
  /// Returns a `Future` that resolves to a `bool?` indicating the status:
  /// - `true`: Limit Ad Tracking is enabled.
  /// - `false`: Limit Ad Tracking is disabled.
  /// - `null`: Unable to determine the status.
  Future<bool?> get limitAdTrackingEnabled async {
    return await FlutterAdvertisingIdPlatform.instance.limitAdTrackingEnabled;
  }

  /// Retrieves the current tracking authorization status of the device. Please not that this will always
  /// return `TrackingAuthorizationStatus.authorized` on Android.
  ///
  /// Returns a `Future` that resolves to a `TrackingAuthorizationStatus` enum value:
  /// - `TrackingAuthorizationStatus.notDetermined`: The user has not yet made a choice regarding tracking.
  /// - `TrackingAuthorizationStatus.restricted`: The user has restricted tracking.
  /// - `TrackingAuthorizationStatus.denied`: The user has denied tracking.
  /// - `TrackingAuthorizationStatus.authorized`: The user has authorized tracking.
  Future<TrackingAuthorizationStatus> get authorizationStatus async {
    return await FlutterAdvertisingIdPlatform.instance.authorizationStatus;
  }
}

/// The possible tracking authorization statuses for the device.
enum TrackingAuthorizationStatus {
  /// The user has not yet made a choice regarding tracking.
  notDetermined,

  /// The user has restricted tracking.
  restricted,

  /// The user has denied tracking.
  denied,

  /// The user has authorized tracking.
  authorized,
}
