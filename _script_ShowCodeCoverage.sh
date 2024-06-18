#!/bin/sh

flutter test --coverage
lcov --remove coverage/lcov.info 'lib/images.dart' -o coverage/lcov.info
lcov --remove coverage/lcov.info '*.g.dart' -o coverage/lcov.info
genhtml -o coverage coverage/lcov.info
open coverage/index.html
  