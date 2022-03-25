// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cubit_8_http/data/user_model.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<User> userList;
  UserLoadedState({
    required this.userList,
  });
}

class UserErrorState extends UserState {}
