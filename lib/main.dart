import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mpay/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");
    debugPrint('INFO: Fichier .env chargé avec succès');

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {

    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Salut"),
      ),
      body: Container(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
