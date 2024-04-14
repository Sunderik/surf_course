import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_285473/core/objects/base_widget_model.dart';
import 'package:task_285473/core/objects/pets_enum.dart';

class RegistrationPageWidgetModel extends BaseWidgetModel {
  ///
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rabiesController = TextEditingController();
  final TextEditingController covidController = TextEditingController();
  final TextEditingController malariaController = TextEditingController();

  Pets _currentPet = Pets.values[0];

  Pets get currentPet => _currentPet;

  ///
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Контроллер патока
  final StreamController<bool> _loadingStatusController = StreamController<bool>.broadcast();

  /// Поток
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

  void setCurrentPet(Pets pet) {
    if (_currentPet != pet) {
      _currentPet = pet;
    }
  }

  Future<void> sendData() async {
    if (!formKey.currentState!.validate()) return;

    changeLoadingStatus();
    await Future.delayed(const Duration(seconds: 2));
    changeLoadingStatus();
  }

  void changeLoadingStatus() {
    _isLoading = !_isLoading;
    _loadingStatusController.sink.add(_isLoading);
  }
}
