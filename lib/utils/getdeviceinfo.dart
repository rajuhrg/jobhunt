import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:platform_device_id/platform_device_id.dart';

class GetDeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Map<String, dynamic> _deviceData = <String, dynamic>{};
  Future<Map> getdeviceRawData() async {
    Map devicedata = await getDeviceData();
    return devicedata;
  }

  Future<Map> getDeviceData() async {
    // final deviceInfo = await deviceInfoPlugin.deviceInfo;
    // final map = await deviceInfo.toMap();
    // print(map);
// return map;
// return {};
    try {
      if (kIsWeb) {
        _deviceData =
            _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
        // print(_deviceData);
      } else {
        if (Platform.isAndroid) {
          _deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          _deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        }
      }
    } on PlatformException {
      _deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    // return ";
    return _deviceData;
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'sysname:': data.utsname.sysname,
      'nodename:': data.utsname.nodename,
      'release:': data.utsname.release,
      'version:': data.utsname.version,
      'machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  getDeviceId() async {
    var deviceid1 = await getDeviceIdFun();
    return deviceid1.toString();
  }

  Future<String> getDeviceIdFun() async {
// deviceId.clear();
    var deviceId = "";
    try {
      deviceId = (await PlatformDeviceId.getDeviceId)!;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    return deviceId.toString();
  }
}
