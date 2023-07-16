import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../repository/api/api.dart';
import '../../../repository/models/menu.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuApi menuApi;
  MenuBloc(this.menuApi) : super(MenuInitial()) {
    ///GET DATA
    on<GetAllMenuEvent>((event, emit) async {
      emit(MenuLoading());
      final defaultList = await menuApi.getAllMenu();

      defaultList.isEmpty
          ? emit(MenuFailed(message: "List is Empty"))
          : emit(MenuSuccess(listMenu: defaultList));
    });

    /// Create Menu
    on<CreateMenuEvent>((event, emit) async {
      emit(MenuLoading());

      final result = await menuApi.addMenu(
        event.title,
        event.subtitle,
        event.status,
      );

      if (result) {
        final newList = await menuApi.getAllMenu();
        emit(MenuSuccess(listMenu: newList));
      } else {
        emit(MenuFailed(message: "Menu has not created."));
      }
    });

    on<UpdateMenuEvent>((event, emit) async {
      emit(MenuLoading());

      final result = await menuApi.updateStatusMenu(
        event.title,
        event.status,
      );

      if (result) {
        final newList = await menuApi.getAllMenu();
        emit(MenuSuccess(listMenu: newList));
      } else {
        emit(MenuFailed(message: "Menu has not updated."));
      }
    });
  }
}
