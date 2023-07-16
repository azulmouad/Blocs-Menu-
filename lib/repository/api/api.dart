import 'dart:convert';

import 'package:demo/repository/models/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

final locale = GetStorage();

class MenuApi {
  Future<List<MenuModel>> getAllMenu() async {
    try {
      // locale.remove("menus");
      // await Future.delayed(const Duration(seconds: 2));

      final data = await locale.read("menus");

      if (data != null) {
        final List<dynamic> json = jsonDecode(data);

        return json.map((map) => MenuModel.fromJson(map)).toList();
      }

      return [];
    } catch (e) {
      debugPrint("Error: $e");
      return [];
    }
  }

  Future<bool> addMenu(String title, String subtitle, bool status) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final List<MenuModel> oldList = List.of(await getAllMenu());

      oldList.add(MenuModel(status: status, title: title, subtitle: subtitle));

      await locale.write(
          "menus", jsonEncode(oldList.map((model) => model.toJson()).toList()));

      return true;
    } catch (e) {
      debugPrint("Error create: $e");
      return false;
    }
  }

  Future<bool> removeMenu(String title) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final List<MenuModel> oldList = List.of(await getAllMenu());

      oldList.removeWhere((model) => model.title == title);

      await locale.write(
          "menus", jsonEncode(oldList.map((model) => model.toJson()).toList()));

      return true;
    } catch (e) {
      debugPrint("Error remove: $e");
      return false;
    }
  }

  Future<bool> updateStatusMenu(String title, bool status) async {
    try {
      final List<MenuModel> oldList = List.of(await getAllMenu());

      ///GET INDEX MENU FROM LIST
      final int indexMenu = oldList.indexWhere((model) => model.title == title);

      ///GET MENU MODEL
      final menu = oldList.singleWhere((model) => model.title == title);

      ///UPDATE MENU ONLY STATUS
      oldList[indexMenu] = menu.copyWith(status: status);

      await locale.write(
          "menus", jsonEncode(oldList.map((model) => model.toJson()).toList()));

      return true;
    } catch (e) {
      debugPrint("Error remove: $e");
      return false;
    }
  }
}
