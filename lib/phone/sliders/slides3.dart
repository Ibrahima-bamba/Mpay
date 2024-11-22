import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mpay/phone/sliders/animation-screen.dart';
import 'package:mpay/phone/sliders/images_slides.dart';
import 'package:mpay/phone/sliders/slides2.dart';
import 'package:mpay/phone/sliders/slides_animations.dart';
import 'package:mpay/tools/colors.dart';
import 'package:mpay/tools/font.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  final List<String> imageUrls;

  ThirdOnboardingScreen({Key? key, required this.imageUrls}) : super(key: key);

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
                    color: AppColors.grisClair, // Trait gris
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
                    color: AppColors.violet, // Trait gris
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            // Grille d'images
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: 3, // Trois images dans la grille
                  itemBuilder: (context, index) {
                    return CustomAnimations.animateImage(
                      ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        )
                      ),
                      index,
                    );
                  },
                ),
              ),
            ),
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
                        title: Text("Fonctionnalité 1 : Explorez les outils.", 
                        style: TextStyle(fontFamily: AppsFont.font2, fontSize: 17),),
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
                            "Fonctionnalité 2 : Connectez-vous rapidement.", 
                            style: TextStyle(fontFamily: AppsFont.font2, fontSize: 17),),
                      ),
                      1,
                    ),
                  ],
                ),
              ),
            ),
            // Bouton Commencer
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
                              const OnboardingScreen(imageUrls: Images.images2),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
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
                            horizontal: 20.0,
                            vertical: 12.0), // Marges internes
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlidePageRoute(
                          page: const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Commencer",
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte en blanc
                        fontWeight: FontWeight.bold,
                        fontFamily:  AppsFont.font2, 
                        fontSize: 16// Texte en gras
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
