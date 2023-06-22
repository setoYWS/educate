import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const options = ['A', 'B', 'C', 'D'];

class QuestionForm extends StatefulWidget {
  const QuestionForm({Key? key}) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final _formKey = GlobalKey<FormState>();
  final _questionCtrl = TextEditingController();
  final _optionCtrls = options.map((o) => TextEditingController()).toList();
  final _question = {'value': '', 'correct': options[0], 'options': options};
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 1;
  }

  void showSnackbar({required bool success, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 96,
          right: 16,
          left: 16,
        ),
        behavior: SnackBarBehavior.floating,
        content: Row(children: [
          Icon(
            success ? Icons.gpp_good : Icons.error,
            color: success ? Colors.greenAccent : Colors.redAccent,
          ),
          const SizedBox(width: 8),
          Text(text),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _questionCtrl.dispose();
    for (var ctrl in _optionCtrls) {
      ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Questions'),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: _count,
                            itemBuilder: (context, index) {
                              return _uiWidget(index);
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  _uiWidget(int index) {
    return Column(children: [
      SizedBox(
        child: TextFormField(
          controller: _questionCtrl,
          decoration: const InputDecoration(labelText: 'Question *'),
          validator: (v) => v!.isEmpty ? 'Please fill in the Question' : null,
        ),
      ),
      const SizedBox(height: 32),
      const Text('Correct Option'),
      Row(
          children: options
              .map((option) => [
                    Radio<String>(
                      value: option,
                      groupValue: _question['correct'] as String,
                      onChanged: (v) =>
                          setState(() => _question['correct'] = v!),
                    ),
                    Text(option),
                    const SizedBox(width: 16)
                  ])
              .expand((w) => w)
              .toList()),
      const SizedBox(height: 32),
      ...options
          .asMap()
          .entries
          .map((entry) => [
                TextFormField(
                  controller: _optionCtrls[entry.key],
                  decoration:
                      InputDecoration(labelText: 'Option ${entry.value}*'),
                  validator: (v) => v!.isEmpty
                      ? 'Please fill in Option ${entry.value}'
                      : null,
                ),
                const SizedBox(height: 32),
              ])
          .expand((w) => w),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 77, 103, 247),
                padding: const EdgeInsets.all(5),
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _question['value'] = _questionCtrl.text;
                _question['options'] = _optionCtrls.asMap().entries.map(
                  (entry) {
                    return {
                      'index': options[entry.key],
                      'value': entry.value.text
                    };
                  },
                );
                if (kDebugMode) {
                  print(_question);
                }
                showSnackbar(
                  success: true,
                  text: _count.toString(),
                );
              } else {
                showSnackbar(
                  success: false,
                  text: 'Please fill all the required fields.',
                );
              }
              setState(() {
                _count++;
              });
            },
            child: const Text('Next'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 41, 66, 206),
                padding: const EdgeInsets.all(5),
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _question['value'] = _questionCtrl.text;
                _question['options'] = _optionCtrls.asMap().entries.map(
                  (entry) {
                    return {
                      'index': options[entry.key],
                      'value': entry.value.text
                    };
                  },
                );
                if (kDebugMode) {
                  print(_question);
                }
                showSnackbar(
                  success: true,
                  text: 'Question uploaded successfully.',
                );
              } else {
                showSnackbar(
                  success: false,
                  text: 'Please fill all the required fields.',
                );
              }
            },
            child: const Text('Finish'),
          )
        ],
      )
    ]);
  }
}
