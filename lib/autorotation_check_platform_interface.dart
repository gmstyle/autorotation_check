import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'autorotation_check_method_channel.dart';

abstract class AutorotationCheckPlatform extends PlatformInterface {
  /// Constructs a AutorotationCheckPlatform.
  AutorotationCheckPlatform() : super(token: _token);

  static final Object _token = Object();

  static AutorotationCheckPlatform _instance = MethodChannelAutorotationCheck();

  /// The default instance of [AutorotationCheckPlatform] to use.
  ///
  /// Defaults to [MethodChannelAutorotationCheck].
  static AutorotationCheckPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AutorotationCheckPlatform] when
  /// they register themselves.
  static set instance(AutorotationCheckPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();

  Future<bool?> isAutorotationEnabled();
}
