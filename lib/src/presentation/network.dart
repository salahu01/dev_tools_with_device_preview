import 'package:dev_preview/src/extensions/extensions.dart';
import 'package:dev_preview/src/presentation/individual_network.dart';
import 'package:dev_preview/src/services/network_services.dart';
import 'package:flutter/material.dart';

class NetworkView extends StatefulWidget {
  const NetworkView({super.key});

  @override
  State<NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends State<NetworkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network', style: TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            onPressed: () => NetworkServies.instance.clearCalls(),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: NetworkServies.instance.calls,
        builder: (context, calls, child) {
          return switch ('$calls') {
            '[]' => const Center(
                child: Text('No calls!', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            _ => ListView.separated(
                itemCount: calls.length,
                separatorBuilder: (BuildContext context, int _) => const Divider(color: Colors.white24).pxy(y: 8),
                itemBuilder: (BuildContext context, int _) {
                  return ListTile(
                    onTap: () => context.push(Theme(data: Theme.of(context), child: IndividualNetworkView(networkEntity: calls[_]))),
                    title: Text('${NetworkServies.instance.calls.value[_].uri}'),
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
