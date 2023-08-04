import 'package:flutter/material.dart';
import 'package:fluttershow_base/components/widgets/spacing/margins.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';

class MenuMultiSelect extends StatelessWidget {
  const MenuMultiSelect({
    required this.optionName,
    required this.options,
    required this.callback,
    required this.value,
    super.key,
  });

  final String optionName;
  final dynamic value;
  final List<(String, dynamic)> options;
  final void Function((String, dynamic)) callback;

  bool isSelected(int index) =>
      options[index].$2.toString() == value.toString();

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: 160,
        child: Row(
          children: [
            Text(optionName),
            horizontalMargin16,
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: options.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    callback(options[index]);
                  },
                  child: ColoredBox(
                    color: isSelected(index) ? Colors.blue : Colors.grey,
                    child: Padding(
                      padding: horizontalPadding12,
                      child: Center(
                        child: Text(
                          options[index].$1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
