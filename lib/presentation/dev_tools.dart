import 'package:dev_preview/dev_preview.dart';
import 'package:dev_preview/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DevTools extends StatelessWidget {
  const DevTools({
    Key? key,
    this.model = true,
    this.orientation = true,
    this.frameVisibility = true,
    this.virtualKeyboard = true,
  }) : super(key: key);

  final bool model;
  final bool orientation;
  final bool frameVisibility;
  final bool virtualKeyboard;

  @override
  Widget build(BuildContext context) {
    return ToolPanelSection(
      title: 'Dev Tools',
      children: [
        ListTile(
          key: const Key('network'),
          title: const Text('Network'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi),
              SizedBox(width: 8),
              Icon(Icons.chevron_right_rounded),
            ],
          ),
          onTap: () {
            final theme = Theme.of(context);
            context.push(Theme(data: theme, child: const NetworkView()));
          },
        ),
      ],
    );
  }
}
