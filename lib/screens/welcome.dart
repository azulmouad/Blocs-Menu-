import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/menu/menu_bloc.dart';
import '../widgets/welcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome Screen'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<MenuBloc>().add(GetAllMenuEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context, builder: (builder) => const DialogAddMenu());
        },
      ),
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          ///STATE LOADING
          if (state is MenuLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            ///STATE FAILED ( GET MESSAGE )
          } else if (state is MenuFailed) {
            return Center(child: Text(state.message.toString()));

            /// STATE SUCCESS ( GET LIST MENU )
          } else if (state is MenuSuccess) {
            final list = state.listMenu;

            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(list[i].title),
                  subtitle: Text(list[i].subtitle),
                  trailing: Switch(
                    value: list[i].status,
                    onChanged: (value) {
                      context.read<MenuBloc>().add(
                          UpdateMenuEvent(status: value, title: list[i].title));
                    },
                  ),
                );
              },
              separatorBuilder: (_, i) => const SizedBox(height: 10),
            );
          }

          /// NO STATE
          return const Text("NO STATE");
        },
      ),
    );
  }
}
