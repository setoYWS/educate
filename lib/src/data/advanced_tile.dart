import 'package:educate/src/models/advanced_tile.dart';
import 'package:flutter/material.dart';

final advancedTiles = <AdvancedTile>[
  AdvancedTile(
    id: 0,
    icon: Icons.language,
    title: 'Lesson',
    tiles: [
      AdvancedTile(
          id: 1, title: 'Subject Pronouns', icon: Icons.book, method: ''),
      AdvancedTile(
          id: 2, title: 'Demonstrative pronouns', icon: Icons.book, method: ''),
      AdvancedTile(
          id: 3, title: 'Question words', icon: Icons.quiz, method: 'Quiz')
    ],
    method: '',
  ),
];
