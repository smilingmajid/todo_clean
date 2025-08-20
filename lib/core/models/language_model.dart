import 'package:flutter/material.dart';

class Language {
  final String name;
  final Locale locale;
  final String flag;

  Language({
    required this.name,
    required this.locale,
    required this.flag,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}
