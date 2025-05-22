import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_advertising_id/flutter_advertising_id.dart';
import 'package:flutter_advertising_id/flutter_advertising_id_platform_interface.dart';
import 'package:flutter_advertising_id/flutter_advertising_id_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';


void main() {
  final FlutterAdvertisingIdPlatform initialPlatform = FlutterAdvertisingIdPlatform.instance;

  test('$MethodChannelFlutterAdvertisingId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAdvertisingId>());
  });


}
