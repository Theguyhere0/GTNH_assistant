import 'package:flutter/material.dart';
import 'package:gtnh_assistant/widgets/base_status_section/base_status_section.dart';
import 'package:gtnh_assistant/widgets/crafting_report_section/crafting_report_section.dart';

import '../utils/constants.dart';
import 'custom_app_bar/custom_app_bar.dart';

/// This is the primary page for the app.
class MainPage extends StatelessWidget {
  /// Creates the primary functional page.
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    // Make sure the page is scrollable
    return Scrollbar(
      thumbVisibility: true,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
          // Bottom side shouldn't matter if it gets cut off
          bottom: false,
          // Provide page margin on all sides
          minimum: const EdgeInsets.symmetric(
            horizontal: pageHorizontalPadding - defaultPadding * 2,
            vertical: pageVerticalPadding,
          ),
          // Break up the page into rows
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              CustomAppBar(),
              BaseStatusSection(),
              CraftingReportSection(),
            ],
          ),
        ),
      ),
    );
  }
}
