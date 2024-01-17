import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';

enum Flavor { Dev, Production }

const String devPackageName = "com.test.profile";
const String prodPackageName = "com.naser.profile";

class EnvVariables {
  static EnvVariables? _instance;
  Flavor? flavor;

  static const _ApiBaseDev = "https://test.com";
  static const _ApiBaseProd = "https://google.com";

  String get imageBase => '$apiBaseUrl/';

  String? apiBaseUrl;

  static EnvVariables instance() {
    _instance ??= EnvVariables._internal();

    return _instance!;
  }

  Future init() async {
    await _setFlavor();
  }

  EnvVariables._internal();

  bool isProduction() => _instance!.flavor == Flavor.Production;

  bool isDevelopment() => _instance!.flavor == Flavor.Dev;

  Future _setFlavor() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();
      debugPrint(info.packageName);
      switch (info.packageName) {
        case devPackageName:
          flavor = Flavor.Dev;
          apiBaseUrl = _ApiBaseDev;
          break;
        case prodPackageName:
          flavor = Flavor.Production;
          apiBaseUrl = _ApiBaseProd;
          break;
        default:
          flavor = Flavor.Dev;
          apiBaseUrl = _ApiBaseDev;
      }
      debugPrint(apiBaseUrl);
    } catch (e) {
      flavor = Flavor.Dev;
      apiBaseUrl = _ApiBaseDev;
    }
  }
}
