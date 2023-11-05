import 'package:flutter/material.dart';

import 'repositories/users/models/models.dart';
import 'widgets/user_card.dart';

final user = User(
  id: '1',
  name: 'Kitty cat asdf asdf asdv asdca` zedf asegvasefaedf',
  company: Company(
    name: 'Fufelshmerz Inc. asdfas dfawe fszefv sdbfzesfda efsdgas`e sf se f',
    catchPhraze: '',
    bs: '',
  ),
  username: 'kit',
  email: 'kit@fflmz.com',
  address: Address(
    street: 'Mock street',
    suite: '2',
    city: 'New York',
    zipcode: '123-432',
    geo: Coordinates(lat: 124.123, lng: -1244.01),
  ),
  phone: '+9 234 234135',
  website: 'kit.com',
);

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: UserCard(user: user),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 64,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  iconSize: 64,
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
