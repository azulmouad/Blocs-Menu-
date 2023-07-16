part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class GetAllMenuEvent extends MenuEvent {}

class CreateMenuEvent extends MenuEvent {
  final String title, subtitle;
  final bool status;
  CreateMenuEvent({
    required this.title,
    required this.subtitle,
    required this.status,
  });
}

class UpdateMenuEvent extends MenuEvent {
  final String title;
  final bool status;

  UpdateMenuEvent({required this.status, required this.title});
}
