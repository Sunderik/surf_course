import 'package:flutter/material.dart';
import 'package:task_280049/core/theme/extensions/text_extension.dart';

const String _appBarTitle = 'Эксклюзивная палитра «Colored Box»';
const Size _appBarHeight = Size.fromHeight(164);

class ColorsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ColorsScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: _appBarHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: SizedBox(height: 44, width: double.maxFinite),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _appBarTitle,
                    softWrap: true,
                    style: Theme.of(context).textTheme.customTitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => _appBarHeight;
}
