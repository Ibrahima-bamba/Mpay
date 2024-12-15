import 'package:flutter/material.dart';
import 'package:mpay/phone/auth_connexion/confirmer_numero.dart';
import 'package:mpay/tools/animations.dart';
import 'package:mpay/tools/colors.dart';

class InscriptionPhone extends StatefulWidget {
  const InscriptionPhone({Key? key}) : super(key: key);

  @override
  State<InscriptionPhone> createState() => _InscriptionPhoneState();
}

class _InscriptionPhoneState extends State<InscriptionPhone> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _acceptConditions = false;

  bool _isValidPhoneNumber(String value) {
    if (value.isEmpty) return false;
    final validPrefixes = ['07', '01', '05'];
    final hasValidPrefix =
        validPrefixes.any((prefix) => value.startsWith(prefix));
    final isCorrectLength = value.length == 10;
    return hasValidPrefix && isCorrectLength;
  }

  void _handleInscription() {
    if (!_acceptConditions) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Veuillez accepter les conditions d\'utilisation',
            style: TextStyle(color: AppColors.blanc, fontFamily: "Baloo"),
          ),
          backgroundColor: AppColors.noir,
        ),
      );
      return;
    }

    if (!_isValidPhoneNumber(_phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Numéro de téléphone invalide',
            style: TextStyle(
              color: AppColors.blanc, fontFamily: "Baloo"),
          ),
          backgroundColor: AppColors.noir,
        ),
      );
      return;
    }

      Navigator.push(
        context,
        SlidePageRoute(
        page: const ConfirmerNumero(),
        ),
      );
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
             

              const SizedBox(height: 60),

              // Titre
              const Center(
                child: Text(
                  'INSCRIPTION',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B2F75),
                      fontFamily: "Baloo" // Couleur violette
                      ),
                ),
              ),

              const SizedBox(height: 40),

              // Champ Nom
              const Text('Entrez votre nom', 
              style: TextStyle(fontFamily: "Baloo"),),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _nomController,
                  decoration: const InputDecoration(
                    hintText: 'Exemple : Zoukouo', labelStyle: TextStyle(fontFamily: "Baloo"),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              // Champ Prénom
              const Text('Entrez votre prenom', style: TextStyle(fontFamily: "Baloo"),),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _prenomController,
                  decoration: const InputDecoration(
                    hintText: 'Exemple : Koua Marc',labelStyle: TextStyle(fontFamily: "Baloo"),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              // Champ Numéro
              const Text('Votre numero', style: TextStyle(fontFamily: "Baloo"),),
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '(+225)',
                        style: TextStyle(color: Colors.white, fontFamily: "Baloo"),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: '0779372968',labelStyle: TextStyle(fontFamily: "Baloo"),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Checkbox Conditions
              Row(
                children: [
                  Checkbox(
                    value: _acceptConditions,
                    onChanged: (value) {
                      setState(() {
                        _acceptConditions = value ?? false;
                      });
                    },
                  ),
                  const Text('Accepter les conditions d\'utilisations', style: TextStyle(fontFamily: "Baloo"),),
                ],
              ),

              const SizedBox(height: 30),

              // Bouton S'inscrire
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleInscription,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B2F75),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'S\'INSCRIRE',
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

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
