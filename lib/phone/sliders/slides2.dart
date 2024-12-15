import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mpay/phone/sliders/images_slides.dart';
import 'package:mpay/phone/sliders/slides1.dart';
import 'package:mpay/phone/sliders/slides3.dart';
import 'package:mpay/tools/animations.dart';
import 'package:mpay/tools/colors.dart';
import 'package:mpay/tools/font.dart';

class OnboardingScreen extends StatelessWidget {
  final List<String> imageUrls;

  const OnboardingScreen({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             const SizedBox(height: 10),
            // Ancre d'évolution (trois traits)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    color: AppColors.grisClair, // Trait gris
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 5,
                    color: AppColors.violet, // Trait violet (actif)
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

            // Grille d'images style maçon avec animation
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
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

            // Liste des fonctionnalités
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    CustomAnimations.animateListTile(
                      const ListTile(
                        leading: Icon(
                          Icons.lens_rounded,
                          color: AppColors.violet,
                        ),
                        title: Text(
                          "Explorez les outils.",
                          style: TextStyle(
                            fontFamily: AppsFont.font2,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      0,
                    ),
                    CustomAnimations.animateListTile(
                      const ListTile(
                        leading: Icon(
                          Icons.lens_rounded,
                          color: AppColors.violet,
                        ),
                        title: Text(
                          "Connectez-vous rapidement.",
                          style: TextStyle(
                            fontFamily: AppsFont.font2,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      1,
                    ),
                    CustomAnimations.animateListTile(
                      const ListTile(
                        leading: Icon(
                          Icons.lens_rounded,
                          color: AppColors.violet,
                        ),
                        title: Text(
                          "Gérez vos données facilement.",
                          style: TextStyle(
                            fontFamily: AppsFont.font2,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      2,
                    ),
                  ],
                ),
              ),
            ),

            
            // Barre de navigation en bas
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 55,
                      color: AppColors.noir,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page:
                              FirstOnboardingScreen(imageUrls: Images.images1),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.violet), // Couleur de fond violette
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Bords légèrement arrondis
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 12.0), // Marges internes
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page:
                              ThirdOnboardingScreen(imageUrls: Images.images3),
                        ),
                      );
                    },
                    child: const Text(
                      'Continuer',
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte en blanc
                        fontWeight: FontWeight.bold,
                        fontFamily: AppsFont.font2,
                        fontSize: 16, // Texte en gras
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
