import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/core.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';
import 'package:task_285473/features/registration_page/widgets/form_sections/fields_sections.dart';
import 'package:task_285473/features/registration_page/widgets/form_sections/pet_types_sections.dart';
import 'package:task_285473/features/registration_page/widgets/form_sections/vaccinations_section.dart';

/// Виджет формы регистрации животного
class RegistrationForm extends StatefulWidget {
  /// Форма регистрации животного
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

/// Состояние виджета формы регистрации
class _RegistrationFormState extends State<RegistrationForm> {
  RegistrationPageWidgetModel get wm => context.read<RegistrationPageWidgetModel>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: wm.formKey,
      child: Column(
        children: [
          PetsTypesSection(onChanged: _changePetType),
          const FieldsSection(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: wm.currentPet.mayHaveVaccinations ? const VaccinationsSection() : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  /// Изменить выбранный тип животного, на животное с [index] в перечислении [Pets]
  _changePetType(int index) {
    wm.setCurrentPet(Pets.values[index]);
    setState(() {});
  }
}
