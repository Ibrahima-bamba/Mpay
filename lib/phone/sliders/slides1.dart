import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mpay/phone/sliders/animation-screen.dart';
import 'package:mpay/phone/sliders/images_slides.dart';
import 'package:mpay/phone/sliders/slides2.dart';
import 'package:mpay/phone/sliders/slides_animations.dart';
import 'package:mpay/tools/colors.dart';
import 'package:mpay/tools/font.dart';

class FirstOnboardingScreen extends StatelessWidget {
  final List<String> imageUrls;

  FirstOnboardingScreen({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             const SizedBox(height: 10),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    color: AppColors.violet, // Trait gris
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 5,
                    color: AppColors.grisClair, // Trait violet (actif)
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 5,
                    color: AppColors.grisClair, // Trait gris
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            // Grille d'images
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return CustomAnimations.animateImage(
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      index,
                    );
                  },
                ),
              ),
            ),
            // Message de bienvenue
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Center(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Bienvenue à \nnotre application !",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, 
                        fontFamily: AppsFont.font2, color:AppColors.violet ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Bouton Découvrir
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      AppColors.violet), // Couleur de fond violette
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Bords légèrement arrondis
                    ),
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(
                        horizontal: 110.0, vertical: 12.0), // Marges internes
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      page: const OnboardingScreen(imageUrls: Images.images2),
                    ),
                  );
                },
                child: const Text(
                  "Découvrir",
                  style: TextStyle(
                    color: Colors.white, // Couleur du texte en blanc
                    fontWeight: FontWeight.bold,
                    fontFamily: AppsFont.font2, fontSize: 20 // Texte en gras
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
