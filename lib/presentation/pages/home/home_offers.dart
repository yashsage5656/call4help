import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeOffers extends StatelessWidget {
  const HomeOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/services/home.png',
      'assets/services/real estate.png',
      'assets/services/education_crop.jpg',
      'assets/services/cyber cafe.png',
      'assets/services/car repair.png',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        CarouselSlider(
          options: CarouselOptions(
            height: 200,

            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            autoPlayInterval: const Duration(seconds:3),
            autoPlayCurve: Curves.easeInCubic,
          ),
          items: imageList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),

      ],
    );
  }
}

