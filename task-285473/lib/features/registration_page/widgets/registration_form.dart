import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/constants/strings_constants.dart';
import 'package:task_285473/core/library/custom_checkbox.dart';
import 'package:task_285473/core/library/custom_input_field.dart';
import 'package:task_285473/core/library/custom_radio_button.dart';
import 'package:task_285473/core/objects/input_type.dart';
import 'package:task_285473/core/objects/pets_enum.dart';
import 'package:task_285473/core/theme/text_extension.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  RegistrationPageWidgetModel get wm => Provider.of<RegistrationPageWidgetModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);
    return Form(
      key: wm.formKey,
      child: Column(
        children: [
          _PetsSection(onChanged: _onChange),
          const _FieldsSection(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: wm.currentPet.needVaccinations ? const VaccinationsSection() : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  _onChange(int value) {
    wm.setCurrentPet(Pets.values[value]);
    setState(() {});
  }
}

class _PetsSection extends StatelessWidget {
  final Function(int) onChanged;

  const _PetsSection({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final wm = Provider.of<RegistrationPageWidgetModel>(context, listen: false);
    final currentPet = wm.currentPet;
    return Row(
        children: Pets.values
            .map((pet) => PetRadioOption<int>(pet: pet, groupValue: currentPet.index, onChanged: onChanged))
            .toList());
  }
}

class _FieldsSection extends StatelessWidget {
  const _FieldsSection();

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
          inputType: NumberType(),
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

class VaccinationsSection extends StatelessWidget {
  const VaccinationsSection({
    super.key,
  });

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
