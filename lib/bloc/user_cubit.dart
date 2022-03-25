import 'package:cubit_8_http/bloc/user_state.dart';
import 'package:cubit_8_http/data/user_model.dart';
import 'package:cubit_8_http/data/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserEmptyState());

  Future<void> userClearList() async {
    emit(UserEmptyState());
  }

  Future<void> userLoadList() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(userList: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }
}
