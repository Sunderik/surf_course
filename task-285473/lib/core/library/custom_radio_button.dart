import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/objects/pets_enum.dart';
import 'package:task_285473/core/theme/text_extension.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

/// Значение размера сторон кнопки
const double _sizeContainer = 72;

/// Виджет радио кнопки типа животного
class PetRadioOption extends StatelessWidget {
  /// Текущее значение группы, к которой относится радио кнопка
  final int? groupValue;

  /// Тип животного относящийся к радио кнопке
  final Pets pet;

  /// Обработчик события нажатия на радиокнопку
  final ValueChanged<int> onTap;

  ///Радио кнопка типа животного
  const PetRadioOption({
    super.key,
    required this.groupValue,
    required this.pet,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final wm = context.read<RegistrationPageWidgetModel>();
    final bool isSelected = pet.index == groupValue;
    final Color color = isSelected ? Theme.of(context).primaryColor : ColorsConstants.appWhite;
    return StreamBuilder<bool>(
        stream: wm.loadingStatusStream,
        builder: (_, __) {
          final loading = wm.isLoading;
          return Container(
            margin: const EdgeInsets.all(5),
            child: InkWell(
              onTap: loading ? null : () => onTap(pet.index),
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: _sizeContainer,
                      width: _sizeContainer,
                      decoration: BoxDecoration(
                        color: loading ? color.withOpacity(0.24) : color,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: SizedBox.square(
                            dimension: _sizeContainer / 2,
                            child: Image.asset(pet.assetPath,
                                color: isSelected ? Colors.white : ColorsConstants.appBlack)),
                      ),
                    ),
                    Text(pet.label, style: Theme.of(context).textTheme.radioTitle),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
