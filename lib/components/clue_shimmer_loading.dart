import 'package:clue_ui_component/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A shimmer loading widget for CLUe UI components.
class ClueShimmerLoading extends StatelessWidget {
  /// Creates a ClueShimmerLoading with a top layout.
  const ClueShimmerLoading.top({super.key});

  /// Creates a ClueShimmerLoading with a tree layout.
  const ClueShimmerLoading.tree({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E8F0)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        height: 100,
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: constraints.maxHeight,
                  height: constraints.maxHeight,
                  color: MyColors.xFFFFFFFF,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    width: constraints.maxWidth,
                    height: double.infinity,
                    color: MyColors.xFFFFFFFF,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
