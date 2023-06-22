class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Choose the group with all subject pronouns. ______",
    "options": [
      'I, me, you, my, mine, myself',
      'I, you, he, she, it, we, you, they',
      'I, you, him, hers, themselves',
      'me, you, him, her, us, you, them'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "John ask for some candy, so his friend gave _____ a Tootsie Roll.",
    "options": ['his', 'him', 'he', 'I'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Some kids don't know what to think of ______.",
    "options": ['he', 'I', 'Him', 'They'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Subject Pronouns are used in the ___________ of the sentence.",
    "options": ['predicate', 'subject', 'end', 'middle'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Object pronouns are used in ________ of the sentence.",
    "options": ['beginning', 'objection', 'propotional phrase', 'predicate'],
    "answer_index": 3,
  },
];
