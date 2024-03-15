import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/presentation/provider_impl/provider_tic_tac_toe_view_model.dart';

class ProviderTicTacToeScreen extends StatelessWidget {
  const ProviderTicTacToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Consumer<ProviderTicTacToeViewModel>(
        builder: (context, viewModel, _) => GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => viewModel.makeAMove(context, index),
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    viewModel.board[index],
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
