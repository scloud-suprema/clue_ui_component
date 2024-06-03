import 'package:flutter/widgets.dart';

GlobalKey<NavigatorState> clueNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'clue');

setClueGlobalKey(GlobalKey<NavigatorState> key) {
  clueNavigatorKey = key;
}
