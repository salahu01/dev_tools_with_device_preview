import 'package:dev_preview/src/entities/network_entity.dart';
import 'package:flutter/material.dart';

final class NetworkServies extends ChangeNotifier {
  //* This constructor body for creating singleton widget
  static NetworkServies get instance {
    _networkServies == null ? {_networkServies = NetworkServies._internel()} : null;
    return _networkServies!;
  }

  //* This named constructor for create object for this class
  NetworkServies._internel();

  //* This variable for store this class object globally
  static NetworkServies? _networkServies;

  ///
  final _calls = ValueNotifier<List<NetworkEntity>>([]);

  ///
  set addCall(NetworkEntity entity) {
    _calls.value.add(entity);
    notifyListeners();
  }

  ///
  List<NetworkEntity> get calls => _calls.value;

  ///
  void clearCalls() {
    _calls.value.clear();
    notifyListeners();
  }
}
