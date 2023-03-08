import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../list_tiles/creation_list_tile.dart';
import '../list_tiles/instance_list_tile.dart';

/// A tile for custom cards with a modifiable list.
class ListCardTile extends StatelessWidget {
  /// Creates a card tile with a modifiable list.
  const ListCardTile({
    Key? key,
    this.title,
    required this.values,
    this.createNew,
    this.delete,
    this.add,
  }) : super(key: key);

  /// A possible descriptor for the list.
  ///
  /// A null title will result in an expanded variant that is meant to take up an entire card.
  final String? title;

  /// All the values that need to be displayed by this list card tile.
  final List<String> values;

  /// The function to call when creating a new instance.
  final void Function()? createNew;

  /// The function to call to delete an instance.
  final void Function(String)? delete;

  /// The function to call to add an instance.
  final void Function(String)? add;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    List<Widget> columnChildren = [];

    if (title == null) {
      columnChildren.add(LimitedBox(
        maxHeight: 450,
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(top: 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: ListView.builder(
              itemExtent: 35,
              itemCount: values.length,
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (context, index) {
                return InstanceListTile(
                  values[index],
                  delete: delete,
                  add: add,
                );
              },
            ),
          ),
        ),
      ));
    } else {
      columnChildren.add(LimitedBox(
        maxHeight: 150,
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(top: 3),
          child: Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: ListView.builder(
              itemExtent: 35,
              itemCount: values.length,
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (context, index) {
                return InstanceListTile(
                  values[index],
                  delete: delete,
                  add: add,
                );
              },
            ),
          ),
        ),
      ));
    }

    if (createNew != null) {
      columnChildren.add(CreationListTile(
        onClick: createNew,
      ));
    }

    return title == null
        // Expanded variant
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: columnChildren,
            ),
          )
        // Embedded variant
        : ListTile(
            horizontalTitleGap: titleGap,
            leading: Container(
              width: cardTileTitleWidth,
              alignment:
                  values.isEmpty ? Alignment.centerRight : Alignment.topRight,
              padding: values.isEmpty
                  ? const EdgeInsets.only(top: 2)
                  : const EdgeInsets.all(0),
              child: Text(
                title!,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                children: columnChildren,
              ),
            ),
          );
  }
}
