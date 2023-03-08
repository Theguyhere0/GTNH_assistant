import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../list_tiles/sectioned_list_tile.dart';

/// A tile for custom cards with a modifiable sectioned list.
class SectionedListCardTile extends StatelessWidget {
  /// Creates a card tile with a modifiable list.
  const SectionedListCardTile({
    Key? key,
    this.title,
    required this.values,
    this.delete,
    this.add,
  }) : super(key: key);

  /// A possible descriptor for the list.
  ///
  /// A null title will result in an expanded variant that is meant to take up an entire card.
  final String? title;

  /// All the values that need to be displayed by this sectioned list card tile.
  final Map<String, List<String>> values;

  /// The function to call to delete an instance.
  final void Function(String)? delete;

  /// The function to call to add an instance.
  final void Function(String)? add;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    // Expanded variant
    if (title == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: LimitedBox(
          maxHeight: 450,
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.only(top: 3),
            child: Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                    children: values.keys
                        .toList()
                        .map((e) => SectionedListTile(
                              e,
                              values: values[e] ?? [],
                              delete: delete,
                              add: add,
                            ))
                        .toList()),
              ),
            ),
          ),
        ),
      );
    } else {
      return ListTile(
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
            children: [
              LimitedBox(
                maxHeight: 150,
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(top: 3),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                          children: values.keys
                              .toList()
                              .map((e) => SectionedListTile(
                                    e,
                                    values: values[e] ?? [],
                                    delete: delete,
                                    add: add,
                                  ))
                              .toList()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
