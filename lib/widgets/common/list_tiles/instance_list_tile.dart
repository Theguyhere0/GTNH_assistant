import 'package:flutter/material.dart';

import '../../../theme/palette.dart';
import '../buttons/add_button.dart';
import '../buttons/delete_button.dart';

/// A tile for custom lists for editing an element.
class InstanceListTile extends StatelessWidget {
  /// Creates a tile for displaying an element.
  const InstanceListTile(
    this.name, {
    Key? key,
    this.delete,
    this.add,
    this.select,
  }) : super(key: key);

  /// The name of the element.
  final String name;

  /// The function to call to delete this instance.
  final void Function(String)? delete;

  /// The function to call to add this instance.
  final void Function(String)? add;

  /// The function to call to select this instance.
  final void Function(String)? select;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Text(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      )
    ];
    if (delete != null) {
      children.add(const Spacer());
      children.add(DeleteButton(() => delete!(name)));
    } else if (add != null) {
      children.add(const Spacer());
      children.add(AddButton(() => add!(name)));
    }

    return ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
      hoverColor: select == null ? Palette.card : Palette.focus,
      onTap: select == null ? null : () => select!(name),
    );
  }
}
