import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_285473/core/core.dart';

/// Объект бизнес-логики окна регистрации
class RegistrationPageWidgetModel extends BaseWidgetModel {
  /// Ключ формы регистрации
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Контроллер поля ввода клички животного
  final TextEditingController nameController = TextEditingController();

  /// Контроллер поля ввода даты рождения животного
  final TextEditingController birthdayController = TextEditingController();

  /// Контроллер поля ввода веса животного
  final TextEditingController weightController = TextEditingController();

  /// Контроллер поля ввода эл. почты владельца животного
  final TextEditingController emailController = TextEditingController();

  /// Контроллер поля ввода последней прививки от бешенства
  final TextEditingController rabiesController = TextEditingController();

  /// Контроллер поля ввода последней прививки от ковида
  final TextEditingController covidController = TextEditingController();

  /// Контроллер поля ввода последней прививки от малярии
  final TextEditingController malariaController = TextEditingController();

  /// Значение текущего выбранного типа животного
  Pets _currentPet = Pets.values[0];

  /// Текущий тип животного
  Pets get currentPet => _currentPet;

  /// Значение состояния окна регистрации животного (загрузка/ожидание)
  bool _isLoading = false;

  /// Состояние окна регистрации животного (загрузка/ожидание)
  bool get isLoading => _isLoading;

  /// Контроллер патока значений состояния окна регистрации животного
  final StreamController<bool> _loadingStatusController = StreamController<bool>.broadcast();

  /// Поток значений состояния окна регистрации животного
  Stream<bool> get loadingStatusStream => _loadingStatusController.stream;

  @override
  void init() {}

  @override
  void dispose() {
    _loadingStatusController.close();
    nameController.dispose();
    birthdayController.dispose();
    weightController.dispose();
    emailController.dispose();
    rabiesController.dispose();
    covidController.dispose();
    malariaController.dispose();
  }

  /// Установить текущий тип животного
  void setCurrentPet(Pets pet) {
    if (_currentPet != pet) {
      _currentPet = pet;
    }
  }

  /// Имитировать отправку данных
  Future<void> sendData() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _changeLoadingStatus();
    await Future.delayed(const Duration(seconds: 2));
    _changeLoadingStatus();
  }

  /// Изменить состояние окна формы регистрации и отправить его в контроллер
  void _changeLoadingStatus() {
    _isLoading = !_isLoading;
    _loadingStatusController.sink.add(_isLoading);
  }
}
