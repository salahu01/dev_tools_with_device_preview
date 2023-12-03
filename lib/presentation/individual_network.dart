import 'package:dev_tools/entities/network_entity.dart';
import 'package:dev_tools/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndividualNetworkView extends StatelessWidget {
  const IndividualNetworkView({super.key, required this.networkEntity});
  final NetworkEntity networkEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network', style: TextStyle(fontSize: 18)),
        actions: [
          Center(
            child: Text(
              '${networkEntity.statusCode}',
              style: TextStyle(
                color: switch (networkEntity.statusCode) {
                  null => Colors.white,
                  <= 299 && >= 200 => Colors.green,
                  _ => Colors.red,
                },
              ),
            ),
          ).pOnly(right: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        children: [
          _item('Url', networkEntity.uri),
          _item('Headers', networkEntity.headers),
          _item('Payload', networkEntity.payload),
          _item('Params', networkEntity.queryParams),
          _item('Response', networkEntity.response),
        ],
      ),
    );
  }

  Widget _item(String title, dynamic value) {
    if (value == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              onPressed: () async => await Clipboard.setData(ClipboardData(text: '$value')),
              icon: const Icon(Icons.copy),
            ),
          ],
        ),
        Text('$value', textAlign: TextAlign.start),
      ],
    );
  }
}
