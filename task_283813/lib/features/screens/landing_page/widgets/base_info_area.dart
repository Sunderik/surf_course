import 'package:flutter/material.dart';
import 'package:task_283813/core/core.dart';
import 'package:task_283813/features/screens/landing_page/widgets/skill_rating.dart';

/// Виджет базовой информации
class BaseInfoArea extends StatelessWidget {
  const BaseInfoArea({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Avatar(),
        ),
        _BaseInfo(),
      ],
    );
  }
}

class _BaseInfo extends StatelessWidget {
  const _BaseInfo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DataWrapper.fio,
                style: Theme.of(context).textTheme.zarubkaTitle,
              ),
              Text(DataWrapper.birthday, style: Theme.of(context).textTheme.cimeroContent),
              Text(DataWrapper.location, style: Theme.of(context).textTheme.cimeroContent),
              const SizedBox(height: 20),
              Text(DataWrapper.slogan, style: Theme.of(context).textTheme.ganeshaContent),
              const SizedBox(height: 20),
              const SkillRating(name: 'Общительность', value: 5),
              const SkillRating(name: 'Трудоспособность', value: 4),
              const SkillRating(name: 'Внимательность', value: 4),
              const SkillRating(name: 'Планирование', value: 3),
              const SkillRating(name: 'Мультизадачность', value: 2),
            ],
          ),
        ),
      ),
    );
  }
}
