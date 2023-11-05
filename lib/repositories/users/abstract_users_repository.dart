import '../../models/models.dart';

abstract class AbstractUsersRepository {
  Future<List<User>> loadUsers();
  Future<User?> getUser(int index);
}
