import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  static final List<Map<String, dynamic>> reviewsData = [
    {
      'name': 'Priya Sharma',
      'time': '2 days ago',
      'text':
          'Excellent service! Very professional and punctual. Highly recommended.',
      'rating': 5.0,
    },
    {
      'name': 'Rahul Kumar',
      'time': '1 week ago',
      'text': 'Good quality work. Pricing is reasonable. Will book again.',
      'rating': 4.0,
    },
    {
      'name': 'Anita Patel',
      'time': '2 weeks ago',
      'text': 'Amazing experience! Quick response and excellent results.',
      'rating': 5.0,
    },
    // Add more reviews here...
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // Outer white container for the whole section
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),

        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          shrinkWrap: true,
          children: <Widget>[
            // --- SECTION 1: Header and Summary ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Customer Reviews',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Write Review',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Rating Score and Chart Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Left Side: Score and Total Reviews
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '4.7',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index < 4.7.floor()
                                    ? Icons.star
                                    : index < 4.7
                                    ? Icons.star_half
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '180 reviews',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const SizedBox(width: 24),

                      // Right Side: Rating Distribution Chart
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const <Widget>[
                            RatingBar(rating: 5, percentage: 0.70),
                            RatingBar(rating: 4, percentage: 0.20),
                            RatingBar(rating: 3, percentage: 0.05),
                            RatingBar(rating: 2, percentage: 0.05),
                            RatingBar(rating: 1, percentage: 0.05),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                ],
              ),
            ),

            // --- SECTION 2: Individual Reviews List ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviewsData.length,
                itemBuilder: (context, index) {
                  final review = reviewsData[index];
                  return ReviewItem(
                    name: review['name'],
                    timeAgo: review['time'],
                    reviewText: review['text'],
                    rating: review['rating'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating; // 5, 4, 3, 2, 1
  final double percentage; // 0.70, 0.20, etc.

  const RatingBar({super.key, required this.rating, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: <Widget>[
          // 5★, 4★, etc.
          SizedBox(
            width: 30,
            child: Text(
              '$rating★',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          const SizedBox(width: 8),

          // Rating Bar/Progress Indicator
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: LinearProgressIndicator(
                value: percentage,
                minHeight: 8,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Percentage Text
          SizedBox(
            width: 40,
            child: Text(
              '${(percentage * 100).toInt()}%',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final String timeAgo;
  final String reviewText;
  final double rating;

  const ReviewItem({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Avatar placeholder (Small yellow circle/emoji)
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color.fromARGB(255, 255, 236, 179),
                child: Text('👋', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 12),

              // Name, Stars, and Time Ago
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // Time Ago
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),

                    // Stars
                    Row(
                      children: List.generate(
                        5,
                        (i) => Icon(
                          i < rating.floor() ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Review Text
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 8.0),
            child: Text(
              reviewText,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ),
          // Subtle Divider between reviews (optional, but clean)
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(height: 1),
          ),
        ],
      ),
    );
  }
}
