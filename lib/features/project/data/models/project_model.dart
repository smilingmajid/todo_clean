import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 1)
class ProjectModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1, defaultValue: 0xFF2196F3)
  final int colorValue;

  ProjectModel({required this.name, this.colorValue = 0xFF2196F3});

  Color get color => Color(colorValue);
}
