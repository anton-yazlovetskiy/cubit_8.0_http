import 'package:cubit_8_http/data/http_api.dart';
import 'package:cubit_8_http/data/user_model.dart';

class UserRepository {
  final userResponse = UserResponce();

  Future<List<User>> getAllUsers() => userResponse.getUsers();
}
