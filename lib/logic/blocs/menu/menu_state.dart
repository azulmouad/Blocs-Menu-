part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuFailed extends MenuState {
  final String? message;
  MenuFailed({this.message});
}

class MenuSuccess extends MenuState {
  final List<MenuModel> listMenu;
  MenuSuccess({required this.listMenu});
}
