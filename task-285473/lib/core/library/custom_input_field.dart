import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/objects/input_type.dart';
import 'package:task_285473/core/theme/text_extension.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

typedef ValidationFunc = String? Function(String? value);
typedef onTapFuncs = Future<void> Function(BuildContext context, TextEditingController controller);

class CustomInputField extends StatefulWidget {
  ///Ключ формы к которой относится поле
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  /// Заголовок поля
  final String label;

  final InputType inputType;

  const CustomInputField(
      {super.key, required this.formKey, required this.label, required this.inputType, required this.controller});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  RegistrationPageWidgetModel get wm => Provider.of<RegistrationPageWidgetModel>(context, listen: false);

  /// Признак что значение не соответствует условиям валидации
  bool isError = false;

  late TextEditingController _controller;

  final _formFieldKey = GlobalKey<FormFieldState>();

  late InputType type;

  @override
  void initState() {
    _controller = widget.controller;
    type = widget.inputType;
    super.initState();
  }

  @override
  void dispose() {
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final validator = type.validator;
    final errorContentStyle = theme.inputContent.copyWith(color: ColorsConstants.appError);
    final onTap = type.onFocusFunc;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          StreamBuilder<bool>(
              stream: wm.loadingStatusStream,
              builder: (_, __) {
                return TextFormField(
                  enabled: !wm.isLoading,
                  key: _formFieldKey,
                  controller: _controller,
                  inputFormatters: type.formatters,
                  keyboardType: type.keyboardType,
                  style: isError ? errorContentStyle : theme.inputContent,
                  decoration: const InputDecoration().copyWith(
                    hintText: widget.label,
                    labelText: widget.label,
                    labelStyle: isError ? errorContentStyle : null,
                  ),
                  validator: (value) {
                    final result = validator(value);
                    // Если валидация прошла успешно
                    if (result == null) {
                      setState(() {
                        isError = false;
                      });
                      return null;
                    }
                    // Если валидация прошла c ошибкой
                    setState(() {
                      isError = true;
                    });
                    return null;
                  },
                  onChanged: (_) => _validate(),
                  onFieldSubmitted: (value) {
                    _controller.text = value.trim();
                  },
                  onTap: onTap != null
                      ? () async {
                          await onTap(context, _controller);
                          _validate();
                        }
                      : null,
                );
              }),
          isError
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.inputType.errorMsg, style: Theme.of(context).textTheme.inputError))
              : Container()
        ],
      ),
    );
  }

  void _validate() {
    _formFieldKey.currentState!.validate();
  }
}
