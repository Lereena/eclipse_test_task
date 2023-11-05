import '../../models/models.dart';

abstract class AbstractUsersRepository {
  Future<List<User>> loadUsers();
  User? getUser(int index);
}
