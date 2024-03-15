import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_screen.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_state.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CubitTicTacToeCubit(
          const CubitTicTacToeInitialState(),
        ),
        child: const CubitTicTacToeScreen(),
      ),
    );
  }

  // Provider implementation
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(create: (_) => ProviderTicTacToeViewModel())
  //       ],
  //       child: const ProviderTicTacToeScreen(),
  //     ),
  //   );
  // }
}
