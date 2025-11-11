// ignore_for_file: deprecated_member_use

import 'package:call4help/data/model/time_slot_model.dart';
import 'package:call4help/presentation/providers/select_date_and_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeSlotCard extends StatelessWidget {
  final TimeSlot slot;
  const TimeSlotCard({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    // Determine colors based on slot state and selection
    Color cardColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color timeColor = Colors.black87;
    Color statusColor = slot.isFullyBooked ? Colors.red : Colors.green;
    String statusText = slot.isFullyBooked ? 'Fully Booked' : 'Available';

    if (slot.isSelected) {
      cardColor = Color(0xFF243b50);
      borderColor = Colors.black;
      timeColor = Colors.white;
      statusColor = Colors.white;
    } else if (slot.isFullyBooked) {
      cardColor = Colors.red.shade50;
    }

    return InkWell(
      onTap: () {
        Provider.of<SelectDateAndTimeProvider>(context, listen: false)
            .toggleSelection(slot);
      },
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: slot.isSelected ? borderColor : Colors.grey.shade200,
            width: slot.isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (slot.isSelected)
              BoxShadow(
                color: Colors.deepPurple.shade200.withOpacity(0.5),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            if (slot.isFullyBooked)
              BoxShadow(
                color: Colors.red.shade50,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular Tag
            if (slot.isPopular) _buildPopularTag(),
            if (slot.isPopular) const SizedBox(height: 4),

            // Time
            Text(
              slot.time,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: timeColor,
              ),
            ),
            const SizedBox(height: 6),

            // Status Icon and Text
            Row(
              children: [
                Icon(
                  Icons.fiber_manual_record,
                  color: statusColor,
                  size: 10,
                ),
                const SizedBox(width: 4),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
                    color: slot.isSelected ? Colors.white70 : statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Booking Count
            Text(
              slot.isFullyBooked
                  ? '${slot.bookedCount}/${slot.totalCapacity} booked'
                  : '${slot.availableCount}/${slot.totalCapacity} available',
              style: TextStyle(
                fontSize: 12,
                color: slot.isSelected ? Colors.white60 : Colors.grey.shade600,
              ),
            ),
            const Spacer(),

            // Progress Bar (simple approximation)
            _buildProgressBar(
              booked: slot.bookedCount,
              capacity: slot.totalCapacity,
              color: statusColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.yellow.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('🔥', style: TextStyle(fontSize: 10)),
          SizedBox(width: 4),
          Text(
            'Popular',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC36D00), // Custom darker orange
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar({required int booked, required int capacity, required Color color}) {
    double progress = booked / capacity;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey.shade200,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        minHeight: 6,
      ),
    );
  }
}
