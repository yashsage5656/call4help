class TimeSlot {
  final String id;
  final String time;
  final int totalCapacity;
  final int bookedCount;
  final bool isPopular;
  bool isSelected;

  TimeSlot({
    required this.id,
    required this.time,
    required this.totalCapacity,
    required this.bookedCount,
    this.isPopular = false,
    this.isSelected = false,
  });

  int get availableCount => totalCapacity - bookedCount;
  bool get isAvailable => availableCount > 0 && bookedCount < totalCapacity;
  bool get isFullyBooked => bookedCount >= totalCapacity;

  // Factory method to copy and update the selection state
  TimeSlot copyWith({
    bool? isSelected,
  }) {
    return TimeSlot(
      id: id,
      time: time,
      totalCapacity: totalCapacity,
      bookedCount: bookedCount,
      isPopular: isPopular,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
