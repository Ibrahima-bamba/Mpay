import 'package:flutter/material.dart';
import 'package:mpay/Models/model_otp.dart';
import 'package:mpay/phone/phone_first_screen.dart';
import 'package:mpay/tools/animations.dart';
import 'package:mpay/tools/colors.dart';

class ConfirmerCodePin  extends StatelessWidget {
  final String originalPin;

  const ConfirmerCodePin ({
    Key? key,
    required this.originalPin,
  }) : super(key: key);

  

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
                      'CONFIRMER LE\nCODE PIN',
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
                  'Confirmer le code pin',
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
                  if (pin == originalPin) {
                    // PIN correct
                    print('PIN confirmé avec succès');
                  } else {
                    // PIN incorrect
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Les codes PIN ne correspondent pas',
                        style: TextStyle(color: AppColors.blanc, fontFamily: "Baloo")),
                        backgroundColor: AppColors.noir,
                      ),
                    );
                  }
                },
                obscureText: true,
              ),

              const Spacer(),

              // Bouton Continuer
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                 
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const PhoneFirstScreen(),
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
                    'COMFIRMER',
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