import 'package:flutter/material.dart';
import 'package:mpay/phone/auth_connexion/inscription_phone.dart';
import 'package:mpay/phone/auth_connexion/verifier_code_pin.dart';
import 'package:mpay/phone/phone_first_screen.dart';
import 'package:mpay/tools/animations.dart';
import 'package:mpay/tools/colors.dart';

class PhoneConnexionScreen extends StatefulWidget {
  const PhoneConnexionScreen({Key? key}) : super(key: key);

  @override
  State<PhoneConnexionScreen> createState() => _PhoneConnexionScreenState();
}

class _PhoneConnexionScreenState extends State<PhoneConnexionScreen> {
  final TextEditingController _phoneController = TextEditingController();
  String? _errorText;

  bool _isValidPhoneNumber(String value) {
    if (value.isEmpty) return false;

    // Vérifie que le numéro commence par 07, 01 ou 05
    final validPrefixes = ['07', '01', '05'];
    final hasValidPrefix =
        validPrefixes.any((prefix) => value.startsWith(prefix));

    // Vérifie que le numéro fait exactement 10 chiffres
    final isCorrectLength = value.length == 10;

    return hasValidPrefix && isCorrectLength;
  }

  void _validateAndConnect() {
    final phoneNumber = _phoneController.text;
    if (!_isValidPhoneNumber(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Le numéro doit commencer par 07, 01 ou 05 et contenir 10 chiffres.',
            style: TextStyle(color: AppColors.blanc, fontFamily: "Baloo"),
          ),
          backgroundColor: AppColors.noir,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      Navigator.push(
        context,
        SlidePageRoute(
          page: VerifierCodePin(
            savedPin: "1234", // Votre PIN stocké
            onSuccess: () {
              // Navigation vers l'écran principal
              Navigator.push(
                context,
                SlidePageRoute(
                  page: const PhoneFirstScreen(),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/fond2.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   width: 90,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[200],
                  //     borderRadius: BorderRadius.circular(6),
                  //   ),
                  //   child: const Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       'Version 1',
                  //       style: TextStyle(
                  //         color: AppColors.noir,
                  //         fontSize: 18,
                  //         fontFamily: "Baloo",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlidePageRoute(
                            page: const InscriptionPhone(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B2F75),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        "S'INSCRIRE",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Baloo",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 140),
                  Column(
                    children: [
                      const Center(
                        child: Text(
                          'CONNEXION',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.violet,
                            fontFamily: "Baloo",
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 2,
                          width: 60,
                          decoration:
                              const BoxDecoration(color: AppColors.grisClair),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 55),
                  const Center(
                    child: Text(
                      'Entrer votre numéro de téléphone',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontFamily: "Baloo",
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 12,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.noir,
                            border: Border(
                              right: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: const Text(
                            '(+225)',
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.blanc,
                              fontFamily: "Baloo",
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontSize: 33,
                              fontFamily: "Baloo",
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              hintText: '0745678912',
                              hintStyle: TextStyle(
                                fontSize: 33,
                                color: Colors.grey,
                                fontFamily: "Baloo",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _validateAndConnect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B2F75),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'SE CONNECTER',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Baloo",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
