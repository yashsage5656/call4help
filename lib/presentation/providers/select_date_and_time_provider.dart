import 'package:call4help/data/model/time_slot_model.dart';
import 'package:flutter/material.dart';

class SelectDateAndTimeProvider extends ChangeNotifier {
  late List<DateTime> _next7Days;
  int _selectedIndex = 0;

  SelectDateAndTimeProvider() {
    _generateDates();
  }

  void _generateDates() {
    _next7Days = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
  }

  List<DateTime> get next7Days => _next7Days;
  int get selectedIndex => _selectedIndex;
  DateTime get selectedDate => _next7Days[_selectedIndex];

  void selectDate(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      // In a real app, you would fetch time slots here based on the new date
      notifyListeners();
    }
  }

  List<TimeSlot> _slots = [
    TimeSlot(id: '1', time: '9:00 AM', totalCapacity: 5, bookedCount: 3, isPopular: false),
    TimeSlot(id: '2', time: '10:00 AM', totalCapacity: 5, bookedCount: 4, isPopular: true),
    TimeSlot(id: '3', time: '11:00 AM', totalCapacity: 5, bookedCount: 5, isPopular: false), // Fully booked
    TimeSlot(id: '4', time: '12:00 PM', totalCapacity: 5, bookedCount: 2, isPopular: false),
    TimeSlot(id: '5', time: '2:00 PM', totalCapacity: 5, bookedCount: 3, isPopular: true),
    TimeSlot(id: '6', time: '3:00 PM', totalCapacity: 5, bookedCount: 1, isPopular: false),
    TimeSlot(id: '7', time: '4:00 PM', totalCapacity: 5, bookedCount: 5, isPopular: false), // Fully booked
    TimeSlot(id: '8', time: '5:00 PM', totalCapacity: 5, bookedCount: 4, isPopular: true),
    TimeSlot(id: '9', time: '6:00 PM', totalCapacity: 5, bookedCount: 2, isPopular: false),
  ];

  List<TimeSlot> get slots => _slots;

  int get availableSlotCount => _slots.where((s) => s.isAvailable).length;
  int get unavailableSlotCount => _slots.where((s) => !s.isAvailable).length;
  int get popularAvailableCount => _slots.where((s) => s.isPopular && s.isAvailable).length;

  void toggleSelection(TimeSlot slot) {
    if (slot.isFullyBooked) return;

    final index = _slots.indexWhere((s) => s.id == slot.id);
    if (index != -1) {
      // Find currently selected slot and unselect it
      final previouslySelected = _slots.indexWhere((s) => s.isSelected);
      if (previouslySelected != -1 && previouslySelected != index) {
        _slots = List.from(_slots);
        _slots[previouslySelected] = _slots[previouslySelected].copyWith(isSelected: false);
      }

      // Toggle the target slot
      _slots = List.from(_slots);
      _slots[index] = slot.copyWith(isSelected: !slot.isSelected);

      notifyListeners();
    }
  }

  void onContinuePaymentTap(BuildContext context) {
    Navigator.pushNamed(context, '/select_payment_method');
  }
}