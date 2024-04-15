import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_285473/core/constants/colors_constants.dart';
import 'package:task_285473/core/objects/input_type.dart';
import 'package:task_285473/core/theme/text_extension.dart';
import 'package:task_285473/features/registration_page/registration_page_widget_model.dart';

/// Виджет базового поля ввода данных
class CustomInputField extends StatefulWidget {
  /// Ключ формы к которой относится поле
  final GlobalKey<FormState> formKey;

  /// Контроллер поля ввода
  final TextEditingController controller;

  /// Заголовок поля
  final String label;

  /// Тип поля ввода
  final InputType inputType;

  /// Базовое поле ввода данных
  const CustomInputField(
      {super.key, required this.formKey, required this.label, required this.inputType, required this.controller});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

/// Состояние базового поля ввода данных
class _CustomInputFieldState extends State<CustomInputField> {
  /// Экземпляр бизнес-логики
  RegistrationPageWidgetModel get wm => Provider.of<RegistrationPageWidgetModel>(context, listen: false);

  /// Признак того, что значение в поле не соответствует условиям валидации
  bool isError = false;

  /// Локальный экземпляр контроллера поля ввода
  late TextEditingController _controller;

  /// Ключ поля в форме
  final _formFieldKey = GlobalKey<FormFieldState>();

  /// Локальный тип поля ввода
  late InputType _type;

  ///Узел фокусировки в приложении
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller = widget.controller;
    _type = widget.inputType;
    _focusNode.addListener(unfocusHandler);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final validator = _type.validator;
    final errorContentStyle = theme.inputContent.copyWith(color: ColorsConstants.appError);
    final onTap = _type.onTapFunc;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          StreamBuilder<bool>(
              stream: wm.loadingStatusStream,
              builder: (_, __) {
                return TextFormField(
                  focusNode: _focusNode,
                  enabled: !wm.isLoading,
                  key: _formFieldKey,
                  controller: _controller,
                  inputFormatters: _type.formatters,
                  keyboardType: _type.keyboardType,
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
                    return '';
                  },
                  onTap: onTap != null
                      ? () async {
                          await onTap(context, _controller);
                          _validate();
                        }
                      : null,
                  onChanged: (_) => _validate(),
                  onFieldSubmitted: (value) {
                    _controller.text = value.trim();
                  },
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

  /// Проверить значение в поле на соответствие условиям валидации для данного типа поля
  void _validate() {
    _formFieldKey.currentState!.validate();
  }

  /// Обработчик снятия фокуса с текстового поля
  Future<void> unfocusHandler() async {
    if (!_focusNode.hasFocus) {
      // При отключенной кнопке, начинаем проверять форму целиком
      if (wm.isDeactivated) {
        wm.checkValidForm();
      }
    }
  }
}
