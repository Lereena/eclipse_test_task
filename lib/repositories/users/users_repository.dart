import '../../models/models.dart';
import '../../rest_client.dart';
import 'abstract_users_repository.dart';

class UsersRepository implements AbstractUsersRepository {
  final RestClient restClient;

  UsersRepository({required this.restClient});

  final List<User> _items = [];

  @override
  Future<List<User>> loadUsers() async {
    _items.clear();

    _items.addAll(await restClient.getUsers());

    return _items;
  }

  @override
  Future<User?> getUser(int index) async {
    if (_items.isEmpty) return null;

    if (index > _items.length - 1) {
      final newIndex = index % _items.length;

      return _items[newIndex];
    }

    if (index < 0) {
      final newIndex = _items.length + index;

      return _items[newIndex];
    }

    return _items[index];
  }
}
