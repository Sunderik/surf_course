import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/constants/strings_constants.dart';
import 'package:task_285473/core/library/custom_input_field.dart';
import 'package:task_285473/core/objects/input_type.dart';
import 'package:task_285473/core/theme/text_extension.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

///
class CustomCheckBox extends StatefulWidget {
  ///
  final String title;

  ///
  final bool checked;

  ///
  final TextEditingController controller;

  const CustomCheckBox({super.key, this.checked = false, required this.title, required this.controller});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  RegistrationPageWidgetModel get wm => Provider.of<RegistrationPageWidgetModel>(context, listen: false);
  late bool _isChecked;

  @override
  void initState() {
    _isChecked = widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      StreamBuilder<bool>(
          stream: wm.loadingStatusStream,
          builder: (_, __) {
            final loading = wm.isLoading;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: loading ? null : () => _change(!_isChecked),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Checkbox(
                    fillColor: loading
                        ? MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return ColorsConstants.appActive.withOpacity(0.24);
                              }
                              return Colors.white; // Use the component's default.
                            },
                          )
                        : null,
                    value: _isChecked,
                    onChanged: loading ? null : (value) => _change(value ?? false),
                  ),
                  Flexible(child: Text(widget.title, style: Theme.of(context).textTheme.radioTitle)),
                ],
              ),
            );
          }),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _isChecked
            ? CustomInputField(
                controller: widget.controller,
                inputType: DateType(),
                formKey: wm.formKey,
                label: StringsConstants.vaccinationsInputHint,
              )
            : const SizedBox.shrink(),
      ),
    ]);
  }

  _change(bool val) {
    setState(() {
      _isChecked = val;
    });
  }
}
