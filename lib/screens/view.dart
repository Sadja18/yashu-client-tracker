import 'package:flutter/material.dart';
import 'package:yashu_client/widgets/tabs/existing_entry/calendar.dart';
import 'package:yashu_client/widgets/tabs/existing_entry/table.dart';

class ViewScreenPage extends StatefulWidget {
  static const routeName = '/view-page';
  const ViewScreenPage({super.key});

  @override
  State<ViewScreenPage> createState() => _ViewScreenPageState();
}

class _ViewScreenPageState extends State<ViewScreenPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.calendar_month_sharp),
                    Text('Calendar'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.table_bar_sharp),
                    Text('Table'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CalendarView(),
            TableView(),
          ],
        ),
      ),
    );
  }
}
