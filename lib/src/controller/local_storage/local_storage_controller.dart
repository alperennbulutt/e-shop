// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  final localStorage = GetStorage();

  // save local value functions ------------------------------------------
  saveStringToLocal(String key, String value) {
    localStorage.write(key, value);
  }

  saveIntToLocal(String key, int value) {
    localStorage.write(key, value);
  }

  saveBooleanToLocal(String key, bool value) {
    localStorage.write(key, value);
  }

  saveDoubleToLocal(String key, double value) {
    localStorage.write(key, value);
  }

  saveListToLocal(String key, List value) async {
    var result = await json.encode(value);

    localStorage.write(key, result);
  }

  saveDynamicToLocal(String key, dynamic value) {
    localStorage.write(key, value);
  }
// ----------------------------------------------------------------------

  // get local value functions ------------------------------------------
  String getStringFromLocal(String key) {
    String value = localStorage.read(key) == null ? '' : localStorage.read(key);
    return value;
  }

  int getIntFromLocal(String key) {
    int value = localStorage.read(key) == null ? 0 : localStorage.read(key);
    return value;
  }

  bool getBooleanFromLocal(String key) {
    bool value =
        localStorage.read(key) == null ? false : localStorage.read(key);
    return value;
  }

  double getDoubleFromLocal(String key) {
    double value = localStorage.read(key);
    return value;
  }

  getListFromLocal(String key) {
    return localStorage.read(key);
  }

  getDynamicFromLocal(String key) {
    return localStorage.read(key);
  }
  // ----------------------------------------------------------------------

  // remove from local storage function
  removeFromLocal(String key) {
    localStorage.remove(key);
  }

  // remove all values

  removeAllValuesFromLocal() {
    localStorage.erase();
  }
}
