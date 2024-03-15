import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_state.dart';

class CubitTicTacToeScreen extends StatelessWidget {
  const CubitTicTacToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: BlocBuilder<CubitTicTacToeCubit, CubitTicTacToeState>(
        builder: (context, state) => GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  context.read<CubitTicTacToeCubit>().makeAMove(context, index),
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    context.read<CubitTicTacToeCubit>().board[index],
                    style: const TextStyle(fontSize: 48.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
