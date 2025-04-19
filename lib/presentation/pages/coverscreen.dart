import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for the game state
final gameStartedProvider = StateProvider<bool>((ref) => false);

class CoverScreen extends ConsumerWidget {
  const CoverScreen({super.key, required bool hasgameStarted});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasgameStarted = ref.watch(gameStartedProvider);

    return hasgameStarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.2),
            child: Text(
              'tap to play',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.deepPurple,
              ),
            ),
          );
  }
}
