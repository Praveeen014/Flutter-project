import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuizPage(),
    );
  }
}

class Question {
  final String text;
  final List<String> choices;
  final int correctIndex;

  const Question({
    required this.text,
    required this.choices,
    required this.correctIndex,
  });
}

const List<Question> sampleQuestions = [
  Question(
    text: 'What is the capital of France?',
    choices: ['Berlin', 'London', 'Paris', 'Rome'],
    correctIndex: 2,
  ),
  Question(
    text: 'Which planet is known as the Red Planet?',
    choices: ['Earth', 'Mars', 'Jupiter', 'Venus'],
    correctIndex: 1,
  ),
  Question(
    text: 'Who wrote "Hamlet"?',
    choices: [
      'Charles Dickens',
      'William Shakespeare',
      'Leo Tolstoy',
      'Mark Twain',
    ],
    correctIndex: 1,
  ),
];

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _index = 0;
  int _score = 0;
  int? _selected;

  void _select(int choiceIndex) {
    if (_selected != null) return;

    setState(() {
      _selected = choiceIndex;
      if (choiceIndex == sampleQuestions[_index].correctIndex) {
        _score++;
      }
    });
  }

  void _next() {
    if (_index + 1 < sampleQuestions.length) {
      setState(() {
        _index++;
        _selected = null;
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ResultPage(
            score: _score,
            total: sampleQuestions.length,
            onRestart: _restart,
          ),
        ),
      );
    }
  }

  void _restart() {
    setState(() {
      _index = 0;
      _score = 0;
      _selected = null;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final q = sampleQuestions[_index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_index + 1} / ${sampleQuestions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(q.text, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            ...List.generate(q.choices.length, (i) {
              final isSelected = _selected == i;
              final correct = q.correctIndex == i;

              Color? color;
              if (_selected != null) {
                if (isSelected) {
                  color = correct ? Colors.green[200] : Colors.red[200];
                } else if (correct) {
                  color = Colors.green[100];
                }
              }

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: color),
                  onPressed: () => _select(i),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(q.choices[i]),
                  ),
                ),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: _selected == null ? null : _next,
              child: Text(
                _index + 1 < sampleQuestions.length ? 'Next' : 'Finish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onRestart;

  const ResultPage({
    super.key,
    required this.score,
    required this.total,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $score / $total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: onRestart, child: const Text('Restart')),
          ],
        ),
      ),
    );
  }
}
