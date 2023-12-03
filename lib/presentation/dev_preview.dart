import 'dart:core';
import 'package:dev_preview/dev_preview.dart';
import 'package:flutter/material.dart';

class DevPreview extends StatelessWidget {
  const DevPreview({
    super.key,
    required this.child,
    required this.isEnabled,
    this.devices,
    this.data,
    this.availableLocales,
    this.defaultDevice,
    this.tools,
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
  final Color? backgroundColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: isEnabled,
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
