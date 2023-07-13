import 'package:flutter/cupertino.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';

class MenuOption extends StatelessWidget {
  const MenuOption({
    required this.description,
    required this.value,
    required this.callback,
    super.key,
  });

  final String description;
  final bool value;
  final void Function({required bool value}) callback;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(description),
          horizontalMargin12,
          CupertinoSwitch(
            value: value,
            onChanged: (value) => callback(value: value),
          )
        ],
      );
}
