import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:summoner_timer/core/di/injection_container.dart';

import './presentation/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await setupDependencies();

  runApp(const RootApp());
}
