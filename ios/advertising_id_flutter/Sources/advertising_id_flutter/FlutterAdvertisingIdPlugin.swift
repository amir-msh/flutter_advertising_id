import Flutter
import UIKit
import AdSupport
import AppTrackingTransparency

public class FlutterAdvertisingIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dev.openflutter/flutter_advertising_id", binaryMessenger: registrar.messenger())
    let instance = FlutterAdvertisingIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAdvertisingId":
        let manager = ASIdentifierManager.shared()

            if (ATTrackingManager.trackingAuthorizationStatus == ATTrackingManager.AuthorizationStatus.authorized) {
                result(manager.advertisingIdentifier.uuidString)
            } else if (call.arguments as? Bool ?? false){
                ATTrackingManager.requestTrackingAuthorization { status in
                    if (status == ATTrackingManager.AuthorizationStatus.authorized) {
                        result(manager.advertisingIdentifier.uuidString)
                    } else {
                        result(nil)
                    }
                }
            } else {
                result(nil)
            }

    case "limitAdTrackingEnabled":
        result(ATTrackingManager.trackingAuthorizationStatus != ATTrackingManager.AuthorizationStatus.authorized)
    case "authorizationStatus":
        let status = ATTrackingManager.trackingAuthorizationStatus
        switch status {
        case .authorized:
            result(3)
        case .denied:
            result(2)
        case .authorized:
            result(1)
        case .notDetermined:
            result(0)
        default:
            result(1)
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
