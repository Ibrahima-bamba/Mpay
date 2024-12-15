import 'package:flutter/material.dart';
import 'package:mpay/Models/model_otp.dart';
import 'package:mpay/phone/auth_connexion/inscription_phone.dart';
import 'package:mpay/tools/animations.dart';
import 'package:mpay/tools/colors.dart';

class VerifierCodePin extends StatefulWidget {
  final String savedPin;
  final VoidCallback onSuccess;

  const VerifierCodePin({
    Key? key,
    required this.savedPin,
    required this.onSuccess,
  }) : super(key: key);

  @override
  State<VerifierCodePin> createState() => _VerifierCodePinState();
}

class _VerifierCodePinState extends State<VerifierCodePin> {
  int _attempts = 0;
  final int _maxAttempts = 3;
  String _currentPin = '';

  void _handlePinInput(String pin) {
    _currentPin = pin;
  }

  void _verifyPin() {
    if (_currentPin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez entrer votre code PIN',
            style: TextStyle(fontFamily: "Baloo", color: AppColors.blanc),
          ),
          backgroundColor: AppColors.noir,
        ),
      );
      return;
    }

    if (_currentPin == widget.savedPin) {
      widget.onSuccess();
    } else {
      setState(() {
        _attempts++;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _attempts >= _maxAttempts 
                ? 'Compte temporairement bloqué'
                : 'Code PIN incorrect',
            style: const TextStyle(fontFamily: "Baloo", color: AppColors.blanc),
          ),
          backgroundColor: AppColors.noir,
        ),
      );
    }
  }

  void _handleForgotPin() {
     Navigator.push(
        context,
        SlidePageRoute(
        page: const InscriptionPhone(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Center(
                  child: Column(
                    children: [
                      Text(
                        'ENTREZ VOTRE\nCODE PIN',
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

                const Center(
                  child: Text(
                    'Entrez votre code secret',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: "Baloo"
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                OtpInputField(
                  onCompleted: _handlePinInput,
                  obscureText: true,
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _verifyPin,
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

                const SizedBox(height: 16),

                // Bouton Code PIN oublié
                Center(
                  child: TextButton(
                    onPressed: _handleForgotPin,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      'Code PIN oublié ?',
                      style: TextStyle(
                        color: Color(0xFF6B2F75),
                        fontSize: 16,
                        fontFamily: "Baloo",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}