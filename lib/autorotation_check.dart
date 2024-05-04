import 'autorotation_check_platform_interface.dart';

class AutorotationCheck {
  Future<String?> getPlatformVersion() {
    return AutorotationCheckPlatform.instance.getPlatformVersion();
  }

  Future<bool?> isAutorotationEnabled() {
    return AutorotationCheckPlatform.instance.isAutorotationEnabled();
  }
}
