import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AdvancedTile {
  final int id;
  final String title;
  final IconData icon;
  final String method;
  final List<AdvancedTile> tiles;
  bool isExpanded;

  AdvancedTile({
    required this.id,
    required this.title,
    required this.icon,
    required this.method,
    this.tiles = const [],
    this.isExpanded = false,
  });
}
