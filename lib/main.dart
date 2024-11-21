import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mpay/desktop/desktop_first_screen.dart';
import 'package:mpay/firebase_options.dart';
import 'package:mpay/phone/sliders/images_slides.dart';
import 'package:mpay/phone/sliders/slides1.dart';
import 'package:mpay/redirection.dart';
import 'package:mpay/tablets/tablet_first_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    // await dotenv.load(fileName: ".env");
    // debugPrint('INFO: Fichier .env chargé avec succès');

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Redirection(
        onPhone: FirstOnboardingScreen(imageUrls: Images.images1,), 
        onTablet: TabletFirstScreen(), 
        onDesktop: DesktopFirstScreen(),
      ),
    );
  }
}

