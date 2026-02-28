import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:summoner_timer/data/repositories/account_repository_impl.dart';
import 'package:summoner_timer/data/repositories/session_repository_impl.dart';
import 'package:summoner_timer/domain/usecases/usecases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final GetAccountUseCase _getAccountUseCase;
  String _result = 'Loading...';

  @override
  void initState() {
    super.initState();
    final sessionRepository = SessionRepositoryImpl();
    _getAccountUseCase = GetAccountUseCase(
      repository: AccountRepositoryImpl(sessionRepository: sessionRepository),
    );
    _loadAccount();
  }

  Future<void> _loadAccount() async {
    try {
      final account = await _getAccountUseCase(name: 'ZacanMeten', tag: 'ZACan');
      setState(() {
        _result =
            '${account.gameName}#${account.tagLine} - ${account.region.toString().toUpperCase()}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: .dark),
      ),
      home: Scaffold(body: Center(child: Text(_result))),
    );
  }
}
