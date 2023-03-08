import 'package:flutter/material.dart';

/// Information about the version of GTNH this was designed for
class GTNHVersion extends StatelessWidget {
  const GTNHVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          'For GTNH v2.2.0.0',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(heightDelta: 0.2),
        ),
      ),
    );
  }
}
