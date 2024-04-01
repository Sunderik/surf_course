import 'package:flutter/material.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/theme/icons_extensions.dart';
import 'package:task_280398/core/theme/text_extension.dart';

/// Виджет заголовка страницы профиля
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      titleTextStyle: theme.textTheme.customTitle.copyWith(color: theme.colorScheme.tertiary),
      iconTheme: theme.iconTheme.appBarIconTheme.copyWith(color: theme.colorScheme.primary),
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Icon(
          size: 22,
          Icons.keyboard_backspace,
        ),
      ),
      title: const Text(
        StringsConstants.profileAppBarTitle,
      ),
      actions: [_ActionButton(callback: () {}, name: StringsConstants.saveAppBarAction)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Виджет отображения кнопок действий в заголовке страницы профиля
class _ActionButton extends StatelessWidget {
  final VoidCallback callback;
  final String name;

  const _ActionButton({required this.callback, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextButton(
        onPressed: callback,
        child: Text(
          name,
          style: Theme.of(context).textTheme.customButton.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
