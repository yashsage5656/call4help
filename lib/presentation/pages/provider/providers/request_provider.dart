import 'package:flutter/material.dart';

class Request {
  final String name;
  final String type;
  final String urgency;
  final String message;
  final String location;
  final String distance;
  final String preferredTime;
  final String timeAgo;
  final double price;

  Request({
    required this.name,
    required this.type,
    required this.urgency,
    required this.message,
    required this.location,
    required this.distance,
    required this.preferredTime,
    required this.timeAgo,
    required this.price,
  });
}

class RequestProvider extends ChangeNotifier {
  final List<Request> _requests = [
    Request(
      name: "Priya Sharma",
      type: "Bike Repair",
      urgency: "Normal",
      message: "My bike is not starting properly. Need urgent repair.",
      location: "Vijay Nagar, Indore",
      distance: "2.5 km away",
      preferredTime: "Today, 4:00 PM",
      timeAgo: "2 hours ago",
      price: 500,
    ),
    Request(
      name: "Rahul Kumar",
      type: "Emergency Repair",
      urgency: "Urgent",
      message: "Bike broke down on highway. Need immediate assistance.",
      location: "Ring Road, Bhopal",
      distance: "5.2 km away",
      preferredTime: "ASAP",
      timeAgo: "4 hours ago",
      price: 800,
    ),
  ];

  List<Request> get requests => _requests;
}
