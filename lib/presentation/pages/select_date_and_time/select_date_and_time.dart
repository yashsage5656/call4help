import 'package:call4help/presentation/pages/select_date_and_time/status_card.dart';
import 'package:call4help/presentation/pages/select_date_and_time/time_slot_card.dart';
import 'package:call4help/presentation/providers/select_date_and_time_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SelectDateAndTime extends StatelessWidget {
  const SelectDateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelectDateAndTimeProvider(),
      child: Consumer<SelectDateAndTimeProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF243b50),

              elevation: 0,
              foregroundColor: Colors.white,
              title: const Text(
                "Select Date & Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                decoration: AppDecoration.gradientBackground,

                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDateCard(provider),
                    const SizedBox(height: 24),
                    _buildTimeSlotHeader(),
                    const SizedBox(height: 16),
                    _buildSlotGrid(provider),
                    const SizedBox(height: 20),
                    _buildTimeSummaryCards(provider),
                    const SizedBox(height: 20),
                    _buildQuickTip(provider),
                    const SizedBox(height: 20),
                    buildPaymentButton(context: context, provider: provider),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDateCard(SelectDateAndTimeProvider provider) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.calendar_month, color: Colors.purple),
              SizedBox(width: 6),
              Text(
                "Select Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 items per row
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9, // Adjust height/width ratio
            ),
            itemCount: provider.next7Days.length,
            itemBuilder: (context, index) {
              final date = provider.next7Days[index];
              final isSelected = provider.selectedIndex == index;
              final isToday = DateUtils.isSameDay(date, DateTime.now());

              return GestureDetector(
                onTap: () => provider.selectDate(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    // gradient: isSelected
                    //     ? const LinearGradient(
                    //         colors: [Color(0xFF8A3FFF), Color(0xFF5F67FF)],
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //       )
                    //     : null,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? Color(0xFF243b50)
                          : Colors.grey.shade300,
                    ),
                    color: isSelected ? Color(0xFF243b50) : Colors.white,

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEE').format(date),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('d').format(date),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (isToday && !isSelected)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlotHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.schedule, color: Colors.deepPurple),
              SizedBox(width: 8),
              Text(
                'Select Time Slot',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              _buildLegend('Available', Colors.green),
              const SizedBox(width: 12),
              _buildLegend('Busy', Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(String text, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: color),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildSlotGrid(SelectDateAndTimeProvider provider) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75, // Adjust to fit card content
      ),
      itemCount: provider.slots.length,
      itemBuilder: (context, index) {
        final slot = provider.slots[index];
        return TimeSlotCard(slot: slot);
      },
    );
  }

  Widget _buildTimeSummaryCards(SelectDateAndTimeProvider provider) {
    return Row(
      children: [
        Expanded(
          child: StatusCard(
            count: provider.availableSlotCount,
            label: 'Available Slots',
            color: Colors.green.shade100,
            textColor: Colors.green.shade800,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatusCard(
            count: provider.unavailableSlotCount,
            label: 'Unavailable Slots',
            color: Colors.red.shade100,
            textColor: Colors.red.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickTip(SelectDateAndTimeProvider provider) {
    final popularCount = provider.popularAvailableCount;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.flash_on, color: Colors.orange.shade700, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: 'Quick Tip: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: 'Popular slots ('),
                  TextSpan(text: '🔥', style: TextStyle(fontSize: 14)),
                  TextSpan(
                    text:
                        ') fill up fast! $popularCount popular slots still available.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPaymentButton({
    required BuildContext context,
    required SelectDateAndTimeProvider provider,
  }) {
    return InkWell(
      onTap: () => provider.onContinuePaymentTap(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
        color:      Color(0xFF243b50),

          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Continue to payment",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }


}
