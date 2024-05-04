import 'package:flutter_test/flutter_test.dart';
import 'package:autorotation_check/autorotation_check.dart';
import 'package:autorotation_check/autorotation_check_platform_interface.dart';
import 'package:autorotation_check/autorotation_check_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAutorotationCheckPlatform
    with MockPlatformInterfaceMixin
    implements AutorotationCheckPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> isAutorotationEnabled() {
    throw UnimplementedError();
  }
}

void main() {
  final AutorotationCheckPlatform initialPlatform =
      AutorotationCheckPlatform.instance;

  test('$MethodChannelAutorotationCheck is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAutorotationCheck>());
  });

  test('getPlatformVersion', () async {
    AutorotationCheck autorotationCheckPlugin = AutorotationCheck();
    MockAutorotationCheckPlatform fakePlatform =
        MockAutorotationCheckPlatform();
    AutorotationCheckPlatform.instance = fakePlatform;

    expect(await autorotationCheckPlugin.getPlatformVersion(), '42');
  });
}
