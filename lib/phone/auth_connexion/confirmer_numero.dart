import 'package:flutter/material.dart';
import 'package:mpay/Models/model_otp.dart';
import 'package:mpay/phone/auth_connexion/definir_code_pin.dart';
import 'package:mpay/tools/animations.dart';
// Ajustez le chemin d'importation

class ConfirmerNumero extends StatefulWidget {
  const ConfirmerNumero({Key? key}) : super(key: key);

  @override
  State<ConfirmerNumero> createState() => _ConfirmerNumeroState();
}

class _ConfirmerNumeroState extends State<ConfirmerNumero> {
  int _timeRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
        _startTimer();
      }
    });
  }

  String get _timerText {
    final minutes = (_timeRemaining / 60).floor();
    final seconds = _timeRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Version
             

              const SizedBox(height: 80),

              // Titre
              const Center(
                child: Column(
                  children: [
                    Text(
                      'VERIFIER\nNUMERO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6B2F75),
                        fontFamily: "Baloo"
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 40,
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Sous-titre
              const Center(
                child: Text(
                  'Entrez le code reçu par SMS',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: "Baloo"
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Timer
              Center(
                child: Text(
                  'Renvoyer le code dans $_timerText',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: "Baloo"
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Champs OTP
              OtpInputField(
                onCompleted: (code) {
                  // Gérer la vérification du code
                  print('Code entré: $code');
                },
                obscureText: false,
              ),

              const Spacer(),

              // Bouton Confirmer
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const DefinirCodePin(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B2F75),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'CONFIRMER',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Baloo"
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
