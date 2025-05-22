[![pub package](https://img.shields.io/pub/v/flutter_advertising_id.svg)](https://pub.dartlang.org/packages/fluwx)
![Build status](https://github.com/OpenFlutter/flutter_advertising_id/actions/workflows/build_test.yml/badge.svg)
[![GitHub stars](https://img.shields.io/github/stars/OpenFlutter/flutter_advertising_id)](https://github.com/OpenFlutter/fluwx/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/OpenFlutter/flutter_advertising_id)](https://github.com/OpenFlutter/fluwx/network)
[![GitHub license](https://img.shields.io/github/license/OpenFlutter/flutter_advertising_id)](https://github.com/OpenFlutter/fluwx/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/OpenFlutter/flutter_advertising_id)](https://github.com/OpenFlutter/flutter_advertising_id/issues)
<a target="_blank" href="https://qm.qq.com/q/TJ29rkzywM"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="OpenFlutter" title="OpenFlutter"></a>

---

# flutter_advertising_id

A Flutter plugin to access advertising ID.

Wraps [ASIdentifierManager.advertisingIdentifier](https://developer.apple.com/documentation/adsupport/asidentifiermanager/1614151-advertisingidentifier) (on iOS) and [advertising ID](https://developers.google.com/android/reference/com/google/android/gms/ads/identifier/AdvertisingIdClient) (on Android).

## Getting Started

Run this command
```
 flutter pub add flutter_advertising_id
```
This will add a line like this to your package's pubspec.yaml

```yaml
dependencies:
  ....
  flutter_advertising_id: ^0.0.1
```

## Usage


### Get advertising ID.

```dart
String? advertisingId;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  advertisingId = await FlutterAdvertisingId().getAdvertisingId(true);
} on PlatformException {
  advertisingId = null;
}
```

### Get limitAdTrackingEnabled

Retrieves whether the user has limit ad tracking enabled or not.

```dart
bool? isLimitAdTrackingEnabled;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  isLimitAdTrackingEnabled = await FlutterAdvertisingId().limitAdTrackingEnabled;
} on PlatformException {
  isLimitAdTrackingEnabled = false;
}
```

### Get authorizationStatus

Retrieves whether the user has limit ad tracking enabled or not.

```dart

final authorizationStatus = await FlutterAdvertisingId().authorizationStatus;

```

## Star history

![stars](https://starchart.cc/OpenFlutter/flutter_advertising_id.svg)

## LICENSE

    Copyright 2025 OpenFlutter Project

    Licensed to the Apache Software Foundation (ASF) under one or more contributor
    license agreements.  See the NOTICE file distributed with this work for
    additional information regarding copyright ownership.  The ASF licenses this
    file to you under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License.  You may obtain a copy of
    the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
    License for the specific language governing permissions and limitations under
    the License.