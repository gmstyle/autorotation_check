import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'autorotation_check_platform_interface.dart';

/// An implementation of [AutorotationCheckPlatform] that uses method channels.
class MethodChannelAutorotationCheck extends AutorotationCheckPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('autorotation_check');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> isAutorotationEnabled() async {
    final isAutorotationEnabled =
        await methodChannel.invokeMethod<bool>('isAutorotationEnabled');
    return isAutorotationEnabled;
  }
}
