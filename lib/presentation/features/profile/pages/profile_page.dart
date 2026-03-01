import 'package:flutter/material.dart';

final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const ProfilePage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile Page')));
  }
}
