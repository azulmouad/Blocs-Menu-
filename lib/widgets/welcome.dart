import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/menu/menu_bloc.dart';

class DialogAddMenu extends StatefulWidget {
  const DialogAddMenu({super.key});

  @override
  State<DialogAddMenu> createState() => _DialogAddMenuState();
}

class _DialogAddMenuState extends State<DialogAddMenu> {
  final title = TextEditingController();
  final subtitle = TextEditingController();
  bool status = true;

  @override
  void dispose() {
    title.dispose();
    subtitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Menu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          TextField(
            controller: subtitle,
            decoration: const InputDecoration(hintText: "SubTitle"),
          ),
          Switch(
            value: status,
            onChanged: (value) {
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<MenuBloc>().add(CreateMenuEvent(
                  subtitle: subtitle.text,
                  title: title.text,
                  status: status,
                ));
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
