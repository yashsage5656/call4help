import 'package:call4help/presentation/pages/provider/pages/provider_request/active_section.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_request/completed_section.dart';
import 'package:call4help/presentation/pages/provider/pages/provider_request/new_requests.dart';
import 'package:call4help/presentation/pages/provider/providers/request_provider.dart';
import 'package:call4help/presentation/widgets/color_decoration.dart';
import 'package:call4help/presentation/widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RequestProvider(),
      child: Consumer<RequestProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: PrimaryAppBar(title: "My Requests"),

          body: Container(
            decoration: AppDecoration.gradientBackground,

            child: DefaultTabController(
              length: 3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  spacing: 8,
                  children: [
                    _TabBarSection(activeCount: 2, historyCount: 2),
                    Expanded(
                      child: TabBarView(
                        children: [
                          NewRequests(provider: provider),
                          ActiveSection(),
                          CompletedSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
        color: Color(0xffECECF0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        tabs: [
          Tab(text: 'New Requests'),
          Tab(text: 'Active'),
          Tab(text: 'Completed'),
        ],
      ),
    );
  }
}
