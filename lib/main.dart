import 'package:cubit_8_http/bloc/user_cubit.dart';
import 'package:cubit_8_http/bloc/user_state.dart';
import 'package:cubit_8_http/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<UserCubit>(
        //final UserRepository userRepository = UserRepository(); ↑
        create: (context) => UserCubit(userRepository),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit http'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserEmptyState) {
            return const Center(child: Text('Users is not loaded'));
          }

          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(state.userList[index].name),
                  subtitle: Text('${state.userList[index].email}'),
                ),
              ),
            );
          }

          return const Center(child: Text('State is not defined'));
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              userCubit.userClearList();
            },
            child: const Icon(Icons.clear),
          ),
          const SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {
              userCubit.userLoadList();
            },
            child: const Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}
