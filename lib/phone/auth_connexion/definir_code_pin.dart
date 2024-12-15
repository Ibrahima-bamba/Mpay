import 'package:flutter/material.dart';
import 'package:mpay/Models/model_otp.dart';
import 'package:mpay/phone/auth_connexion/confirmer_code_pin.dart';
import 'package:mpay/tools/animations.dart';

class DefinirCodePin extends StatelessWidget {
  const DefinirCodePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             

              const SizedBox(height: 80),

              // Titre
              const Center(
                child: Column(
                  children: [
                    Text(
                      'DEFINIR VOTRE\nUN CODE PIN',
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
                  'Entrez un code pin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontFamily: "Baloo"
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Champs OTP
              OtpInputField(
                onCompleted: (pin) {
                  // Gérer le nouveau PIN
                  print('Nouveau PIN: $pin');
                },
                obscureText: true,
              ),

              const Spacer(),

              // Bouton Continuer
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String originalPin = "1234"; // Le PIN défini précédemment
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: ConfirmerCodePin( originalPin: originalPin),
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
                    'CONTINUER',
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