import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  Future<void> write(String key, dynamic json);

  dynamic read<S>(String key, {S Function(Map) construct});

  dynamic readList(
    String key, {
    Function(List<dynamic>)? map,
  });

  void remove(String key);

  void removeAll();
}

class StorageService implements LocalStorage {
  StorageService() {
    _init();
  }

  late GetStorage storage;

  void _init() {
    storage = GetStorage();
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await storage.write(key, convert.jsonEncode(value));
  }

  @override
  dynamic read<S>(String key, {S Function(Map)? construct}) {
    final value = storage.read(key);
    if (value == null) return;
    if (construct == null) return convert.jsonDecode(value);
    final Map<String, dynamic> json = convert.jsonDecode(value);

    return construct(json);
  }

  // @override
  // readList<S>(String key, {Function(List<S>) construct}) {
  //   final jsonArray = GetStorage().read(key);
  //   final resourceName = S;
  //   final List<S> list = [];
  //   for (var item in convert.json.decode(jsonArray)) list.add(resourceName.fromJson(item));

  //   return construct(list);
  // }

  @override
  void remove(String key) {
    GetStorage().remove(key);
  }

  @override
  void removeAll() {
    throw UnimplementedError();
  }

  @override
  readList(
    String key, {
    dynamic Function(List<dynamic>)? map,
  }) {
    final result = GetStorage().read(key);
    if (result == null) return;
    final jsonArray = convert.jsonDecode(result);
    final list = jsonArray.toList();
    return map?.call(list) ?? list;
  }
}
