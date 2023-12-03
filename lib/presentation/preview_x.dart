import 'dart:core';
import 'package:dev_tools/dev_tools.dart';
import 'package:flutter/material.dart';

class PreviewX extends StatelessWidget {
  const PreviewX({
    super.key,
    required this.child,
    this.devices,
    this.data,
    this.availableLocales,
    this.defaultDevice,
    required this.tools,
    this.storage,
    this.backgroundColor,
  });
  final Widget child;
  final List<DeviceInfo>? devices;
  final DevicePreviewData? data;
  final bool isToolbarVisible = true;
  final List<Locale>? availableLocales;
  final DeviceInfo? defaultDevice;
  final List<Widget>? tools;
  final DevicePreviewStorage? storage;
  final bool enabled = true;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: DevToolsData.isEnabled,
      availableLocales: availableLocales,
      backgroundColor: backgroundColor,
      data: data,
      defaultDevice: defaultDevice,
      devices: devices,
      isToolbarVisible: isToolbarVisible,
      storage: storage,
      tools: tools ??
          const [
            DevTools(),
            DeviceSection(),
            SystemSection(),
            AccessibilitySection(),
            SettingsSection(),
          ],
      builder: (context) => child,
    );
  }
}
