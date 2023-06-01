import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/game_logic.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD0BCFF),
      body: SafeArea(
        child: Consumer<BaseLogic>(
          builder: (context, value, child) {
            return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: value.turn
                                  ? Colors.white
                                  : const Color.fromRGBO(89, 100, 0, 0.15),
                            ),
                            child: const Text('Jugador 1 O'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: !value.turn
                                  ? Colors.white
                                  : const Color.fromRGBO(89, 100, 0, 0.15),
                            ),
                            child: const Text('Jugador 2 X'),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          !context.read<BaseLogic>().isGameIn
                              ? context.read<BaseLogic>().setStage()
                              : context.read<BaseLogic>().resetGame();
                        },
                        child: Text(context.watch<BaseLogic>().isGameIn
                            ? 'Reiniciar Partida'
                            : 'Iniciar la partida'),
                      ),
                      !value.isThereAWinner
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 9,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                int row = index ~/ 3;
                                int col = index % 3;

                                return GestureDetector(
                                  onTap: () => value.isGameIn
                                      ? value.setBoardWithMark(row, col)
                                      : null,
                                  child: Container(
                                    margin: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.amber,
                                    ),
                                    child: Center(
                                        child: Text(context
                                            .read<BaseLogic>()
                                            .board[row][col])),
                                  ),
                                );
                              },
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: !value.turn
                                    ? Colors.white
                                    : const Color.fromRGBO(89, 100, 0, 0.12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(left: 50),
                                      child: const Icon(
                                          Icons.account_circle_outlined)),
                                  Expanded(
                                      child: Text(
                                    'Ganador ${value.turn ? "Jugador 1" : "Jugador 2"}',
                                    style: const TextStyle(fontSize: 55),
                                  )),
                                ],
                              ),
                            ),
                    ]));
          },
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(size.width * 0.3333, 0);
    path.lineTo(size.width * 0.3333, size.height);

    path.moveTo(size.width * 0.6666, 0);
    path.lineTo(size.width * 0.6666, size.height);

    path.moveTo(0, size.height * 0.3333);
    path.lineTo(size.width, size.height * 0.3333);

    path.moveTo(0, size.height * 0.6666);
    path.lineTo(size.width, size.height * 0.6666);

    path.moveTo(
      size.width * 0.05,
      size.width * 0.05,
    );
    path.lineTo(size.width * 0.28, size.height * 0.28);

    path.moveTo(size.width * 0.05, size.height * 0.28);
    path.lineTo(size.width * 0.28, size.height * 0.05);

    path.addOval(Rect.fromCircle(
      center: Offset(60, 190),
      radius: 40.0,
    ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void paintX() {}
}
