import 'package:clue_ui_component/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtension Tests', () {
    test('TimeOfDay difference operator', () {
      DateTime dateTime1 = DateTime(2024, 2, 7, 15, 30);
      DateTime dateTime2 = DateTime(2024, 2, 7, 10, 15);

      TimeOfDay difference = dateTime1 - dateTime2;

      expect(difference.hour, 5);
      expect(difference.minute, 15);
    });

    test('Comparison operators', () {
      DateTime dateTime1 = DateTime(2024, 2, 7, 15, 30);
      DateTime dateTime2 = DateTime(2024, 2, 7, 10, 15);

      expect(dateTime1 > dateTime2, isTrue);
      expect(dateTime1 < dateTime2, isFalse);
      expect(dateTime1 >= dateTime2, isTrue);
      expect(dateTime1 <= dateTime2, isFalse);
      expect(dateTime1 >= dateTime1, isTrue);
      expect(dateTime1 <= dateTime1, isTrue);
    });

    test('copyWith method', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      DateTime copiedDateTime = dateTime.copyWith(year: 2023, month: 1);

      expect(copiedDateTime.year, 2023);
      expect(copiedDateTime.month, 1);
      expect(copiedDateTime.day, 7);
      expect(copiedDateTime.hour, 15);
      expect(copiedDateTime.minute, 30);
    });

    test('applyTimeOfDay method', () {
      DateTime dateTime = DateTime(2024, 2, 7);
      TimeOfDay timeOfDay = const TimeOfDay(hour: 15, minute: 30);
      DateTime appliedDateTime = dateTime.applyTimeOfDay(timeOfDay);

      expect(appliedDateTime.year, 2024);
      expect(appliedDateTime.month, 2);
      expect(appliedDateTime.day, 7);
      expect(appliedDateTime.hour, 15);
      expect(appliedDateTime.minute, 30);
    });

    test('toTimeOfDay getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      TimeOfDay timeOfDay = dateTime.toTimeOfDay;

      expect(timeOfDay.hour, 15);
      expect(timeOfDay.minute, 30);
    });

    test('startOfDay getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      DateTime startOfDay = dateTime.startOfDay;

      expect(startOfDay.year, 2024);
      expect(startOfDay.month, 2);
      expect(startOfDay.day, 7);
      expect(startOfDay.hour, 0);
      expect(startOfDay.minute, 0);
      expect(startOfDay.second, 0);
      expect(startOfDay.millisecond, 0);
      expect(startOfDay.microsecond, 0);
    });

    test('endOfDay getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      DateTime endOfDay = dateTime.endOfDay;

      expect(endOfDay.year, 2024);
      expect(endOfDay.month, 2);
      expect(endOfDay.day, 7);
      expect(endOfDay.hour, 23);
      expect(endOfDay.minute, 59);
      expect(endOfDay.second, 59);
      expect(endOfDay.millisecond, 999);
    });

    test('yyyyMMdd getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      String formatted = dateTime.yyyyMMdd;

      expect(formatted, '2024.02.07');
    });

    test('yyyyMMdd2 getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      String formatted = dateTime.yyyyMMdd2;

      expect(formatted, '2024.02.07 (Wed)');
    });

    test('startOfMonth getter', () {
      DateTime dateTime = DateTime(2024, 2, 1);
      expect(dateTime.startOfMonth, isTrue);

      DateTime dateTime2 = DateTime(2024, 2, 2);
      expect(dateTime2.startOfMonth, isFalse);
    });

    test('monthLocale getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      String monthLocale = dateTime.monthLocale;

      expect(monthLocale, 'February');
    });

    test('frontFormat getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      String formatted = dateTime.frontFormat;

      expect(formatted, '2024.02.07 (Wed)');
    });

    test('horizontalCalendarFormat getter', () {
      DateTime dateTime = DateTime(2024, 2, 7, 15, 30);
      String formatted = dateTime.horizontalCalendarFormat;

      expect(formatted, 'Wed\n\n07');
    });
  });
}
