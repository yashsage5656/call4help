import 'package:call4help/data/model/service_provider_model.dart';
import 'package:flutter/material.dart';

class ServiceDetailsProvider extends ChangeNotifier {
  final ServiceProviderModel _service = ServiceProviderModel(
    name: "Ram Bike Mechanics",
    category: "All Bike Brands Servicing",
    priceRange: "₹300 - ₹800",
    experience: 15,
    rating: 4.7,
    reviewsCount: 180,
    location: "Indore",
    about:
        "Professional service provider with 15 years of experience. We are committed to providing high-quality services with customer satisfaction as our top priority. Our team is trained and certified to handle all your needs efficiently.",
    services: [
      "Basic Service - Standard quality work",
      "Premium Service - Enhanced quality with warranty",
    ],
  );

  void onBookServiceTap(BuildContext context) {
    Navigator.pushNamed(context, '/service_booking');
  }

  ServiceProviderModel get service => _service;
}
