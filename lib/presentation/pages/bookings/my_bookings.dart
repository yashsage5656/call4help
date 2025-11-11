import 'package:call4help/presentation/providers/my_booking_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookingHistoryProvider(),
      child: Scaffold(
        appBar: PrimaryAppBar(title: "My Bookings"),
        body: const _BookingHistoryBody(),
      ),
    );
  }
}

class _BookingHistoryBody extends StatelessWidget {
  const _BookingHistoryBody();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingHistoryProvider>();

    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: AppDecoration.gradientBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _TabBarSection(
                activeCount: provider.activeBookings.length,
                historyCount: provider.historyBookings.length,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _BookingList(items: provider.activeBookings),
                    _BookingList(items: provider.historyBookings),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarSection extends StatelessWidget {
  final int activeCount;
  final int historyCount;

  const _TabBarSection({required this.activeCount, required this.historyCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        tabs: [
          Tab(text: 'Active ($activeCount)'),
          Tab(text: 'History ($historyCount)'),
        ],
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final List<Widget> items;

  const _BookingList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: items.length,
      itemBuilder: (_, i) => items[i],
    );
  }
}
