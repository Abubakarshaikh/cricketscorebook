import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScoreBookBloc>(
      create: (context) => ScoreBookBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Score Book"),
      ),
      body: Column(
        children: [
          BlocBuilder<ScoreBookBloc, int>(
            builder: (context, state) {
              return Text(
                "$state",
                style: GoogleFonts.pacifico(
                  fontSize: 36,
                ),
              );
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  CounterButton(
                    number: 1,
                    onTap: () {
                      context
                          .read<ScoreBookBloc>()
                          .add(ScoreCounter.incrementByOne);
                    },
                  ),
                  CounterButton(
                    number: 2,
                    onTap: () {
                      context
                          .read<ScoreBookBloc>()
                          .add(ScoreCounter.incrementByTwo);
                    },
                  ),
                  CounterButton(
                    number: 4,
                    onTap: () {
                      context
                          .read<ScoreBookBloc>()
                          .add(ScoreCounter.incrementByFour);
                    },
                  ),
                  CounterButton(
                    number: 6,
                    onTap: () {
                      context
                          .read<ScoreBookBloc>()
                          .add(ScoreCounter.incrementBySix);
                    },
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final VoidCallback onTap;
  const CounterButton({
    Key? key,
    required this.onTap,
    required this.number,
  }) : super(key: key);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          number.toString(),
          style: GoogleFonts.pacifico(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

enum ScoreCounter {
  incrementByOne,
  incrementByTwo,
  incrementBySix,
  incrementByFour,
}

class ScoreBookBloc extends Bloc<ScoreCounter, int> {
  ScoreBookBloc() : super(0) {
    on<ScoreCounter>(_scoreCounter);
  }

  void _scoreCounter(ScoreCounter event, Emitter<int> emit) {
    switch (event) {
      case ScoreCounter.incrementByOne:
        emit(state + 1);
        break;
      case ScoreCounter.incrementByTwo:
        emit(state + 2);
        break;
      case ScoreCounter.incrementByFour:
        emit(state + 4);
        break;
      case ScoreCounter.incrementBySix:
        emit(state + 6);
        break;

      default:
    }
  }
}
