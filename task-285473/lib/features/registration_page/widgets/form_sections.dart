import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/core.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

/// Виджет раздела выбора типа животного
class PetsTypesSection extends StatelessWidget {
  /// Обработчик изменения типа животного
  final Function(int) onChanged;

  /// Раздел   типов животных
  const PetsTypesSection({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);
    final currentPet = wm.currentPet;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: Pets.values
            .map((pet) => PetRadioOption(pet: pet, groupValue: currentPet.index, onTap: onChanged))
            .toList());
  }
}

/// Виджет раздела ввода информации о животном
class FieldsSection extends StatelessWidget {
  /// Раздел ввода информации о животном
  const FieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);
    final formKey = wm.formKey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomInputField(
          controller: wm.nameController,
          inputType: TextType(),
          formKey: formKey,
          label: StringsConstants.nameInputHint,
        ),
        CustomInputField(
          controller: wm.birthdayController,
          inputType: DateType(),
          formKey: formKey,
          label: StringsConstants.birthdayInputHint,
        ),
        CustomInputField(
          controller: wm.weightController,
          inputType: IntegerType(),
          formKey: formKey,
          label: StringsConstants.weightInputHint,
        ),
        CustomInputField(
          controller: wm.emailController,
          inputType: EmailType(),
          formKey: formKey,
          label: StringsConstants.emailInputError,
        ),
      ],
    );
  }
}

/// Виджет раздела ввода информации о прививках животного
class VaccinationsSection extends StatelessWidget {
  /// Раздел ввода информации о прививках животного
  const VaccinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [Text(StringsConstants.vaccinationsTitle, style: Theme.of(context).textTheme.sectionTitle)],
          ),
        ),
        CustomCheckBox(title: StringsConstants.rabies, controller: wm.rabiesController),
        CustomCheckBox(title: StringsConstants.covid, controller: wm.covidController),
        CustomCheckBox(title: StringsConstants.malaria, controller: wm.malariaController),
      ],
    );
  }
}
