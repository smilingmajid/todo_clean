import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 1)
class ProjectModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int colorValue;

  ProjectModel({
    required this.name,
    required this.colorValue,
  });

  Color get color => Color(colorValue);
}
