import 'package:flutter/material.dart';

import '../../../theme/palette.dart';
import '../../../utils/constants.dart';
import 'instance_list_tile.dart';

/// A tile for custom sectioned lists.
class SectionedListTile extends StatefulWidget {
  /// Creates a tile for displaying an element.
  const SectionedListTile(
    this.name, {
    Key? key,
    required this.values,
    this.delete,
    this.add,
    this.select,
  }) : super(key: key);

  /// The name of the section.
  final String name;

  /// All the values that need to be displayed by this sectioned list tile.
  final List<String> values;

  /// The function to call to delete this instance.
  final void Function(String)? delete;

  /// The function to call to add this instance.
  final void Function(String)? add;

  /// The function to call to select this instance.
  final void Function(String)? select;

  @override
  State<SectionedListTile> createState() => _SectionedListTile();
}

class _SectionedListTile extends State<SectionedListTile> {
  bool _sectionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // The name of the section
          Text(
            widget.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color:
                      _sectionExpanded ? Palette.highlight : Palette.standard,
                ),
          ),
          // A divider taking up the rest of the section
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              child: Divider(
                thickness: 2,
                color: _sectionExpanded ? Palette.highlight : Palette.standard,
              ),
            ),
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
      // Toggle arrow
      leading: Icon(
        _sectionExpanded
            ? Icons.keyboard_arrow_down_rounded
            : Icons.chevron_right_rounded,
        color: _sectionExpanded ? Palette.highlight : Palette.standard,
        size: infoIconSize,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() => _sectionExpanded = expanded);
      },
      childrenPadding:
          const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
      children: widget.values
          .map((e) => InstanceListTile(
                e,
                delete: widget.delete,
                add: widget.add,
                select: widget.select,
              ))
          .toList(),
    );
  }
}
