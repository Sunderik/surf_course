import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_280398/core/constants/strings_constants.dart';
import 'package:task_280398/core/domain/models/app_state_model.dart';
import 'package:task_280398/core/theme/button_extensions.dart';
import 'package:task_280398/features/profile_screen/profile_screen_widget_model.dart';
import 'package:task_280398/features/profile_screen/widgets/avatar.dart';
import 'package:task_280398/features/profile_screen/widgets/awards.dart';
import 'package:task_280398/features/profile_screen/widgets/profile_app_bar.dart';
import 'package:task_280398/features/profile_screen/widgets/profile_info_container.dart';

/// Виджет экран профиля пользователя
class ProfileScreenView extends StatelessWidget {
  /// Экран профиля пользователя
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetModel = Provider.of<ProfileScreenWidgetModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: const ProfileAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  const Avatar(avatar: NetworkImage(StringsConstants.avatarUrlAddress)),
                  const Awards(),
                  const ProfileInfoContainer(
                    title: StringsConstants.nameContainerTitle,
                    data: StringsConstants.nameContainerData,
                  ),
                  const ProfileInfoContainer(
                    title: StringsConstants.emailContainerTitle,
                    data: StringsConstants.emailContainerData,
                  ),
                  const ProfileInfoContainer(
                    title: StringsConstants.birthdayContainerTitle,
                    data: StringsConstants.birthdayContainerData,
                  ),
                  ProfileInfoContainer(
                    callback: () {},
                    title: StringsConstants.teamContainerTitle,
                    data: StringsConstants.teamContainerData,
                  ),
                  ProfileInfoContainer(
                    callback: () {},
                    title: StringsConstants.positionContainerTitle,
                    data: StringsConstants.positionContainerData,
                  ),
                  Consumer<AppStateModel>(builder: (_, state, child) {
                    return ProfileInfoContainer(
                      callback: () => widgetModel.openChangeThemeBottomSheet(context),
                      title: StringsConstants.bottomSheetTitle,
                      data: state.currentTheme.getThemeTypeName,
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.mainButton.style,
                      child: const Text(StringsConstants.exitButtonName),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
