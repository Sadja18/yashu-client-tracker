import 'package:flutter/material.dart';
import 'package:yashu_client/widgets/tabs/new_entry/tab_create.dart';
import 'package:yashu_client/widgets/tabs/new_entry/tab_upload.dart';

class NewRecordsPage extends StatefulWidget {
  static const routeName = '/new-entry';
  const NewRecordsPage({super.key});

  @override
  State<NewRecordsPage> createState() => _NewRecordsPageState();
}

class _NewRecordsPageState extends State<NewRecordsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enter New Records'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    Text('Add record'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const [
                    Icon(Icons.file_upload),
                    Text('Upload File'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            CreateNewRecord(),
            ExcelUpload(),
          ],
        ),
      ),
    );
  }
}
