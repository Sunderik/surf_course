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

  /// Контроллер потока значений состояния окна регистрации животного
  final StreamController<bool> _loadingStatusController = StreamController<bool>.broadcast();

  /// Поток значений состояния окна регистрации животного
  Stream<bool> get loadingStatusStream => _loadingStatusController.stream;

  /// Значение доступности кнопки отправки данных
  bool _isDeactivated = false;

  /// Доступность кнопки отправки данных
  bool get isDeactivated => _isDeactivated;

  /// Контроллер потока значения доступности кнопки отправки данных
  final StreamController<bool> _isDeactivatedController = StreamController<bool>.broadcast();

  /// Поток значения доступности кнопки отправки данных
  Stream<bool> get isDeactivatedStream => _isDeactivatedController.stream;

  @override
  void init() {}

  @override
  void dispose() {
    _loadingStatusController.close();
    _isDeactivatedController.close();
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

  /// Проверить валидацию формы
  void checkValidForm() {
    if (_isDeactivated && formKey.currentState!.validate()) {
      _changeDeactivatedStatus(false);
      return;
    }
  }

  /// Имитировать отправку данных
  Future<void> sendData() async {
    if (!formKey.currentState!.validate()) {
      _changeDeactivatedStatus(true);
      return;
    }
    _changeDeactivatedStatus(false);
    _changeLoadingStatus();
    await Future.delayed(const Duration(seconds: 2));
    _changeLoadingStatus();
  }

  /// Изменить состояние окна формы регистрации и отправить его в контроллер
  void _changeLoadingStatus() {
    _isLoading = !_isLoading;
    _loadingStatusController.sink.add(_isLoading);
  }

  /// Изменить состояние  доступности кнопки отправки данных и  отправить его в контроллер
  void _changeDeactivatedStatus(bool newStatus) {
    if (_isDeactivated == newStatus) {
      return;
    }
    _isDeactivated = newStatus;
    _loadingStatusController.sink.add(_isDeactivated);
  }
}
