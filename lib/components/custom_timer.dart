import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент таймера
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomTimer extends StatefulWidget {
  final double width; // Ширина таймера
  final bool isRunning; // Идёт ли отсчёт

  const CustomTimer({super.key, required this.width, this.isRunning = false});

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  Timer? _timer; // Таймер
  int _seconds = 0; // Сколько секунд прошло

  @override
  void initState() {
    super.initState();
    Logging().info('CustomTimer', 'Создание', 'Таймер создан');
    if (widget.isRunning) _start();
  }

  // Запуск и остановка при изменении флага isRunning
  @override
  void didUpdateWidget(CustomTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRunning && !oldWidget.isRunning) _start();
    if (!widget.isRunning && oldWidget.isRunning) _stop();
  }

  @override
  void dispose() {
    _timer?.cancel();
    Logging().info('CustomTimer', 'Уничтожение', 'Таймер уничтожен');
    super.dispose();
  }

  // Запускает отсчёт
  void _start() {
    Logging().info('CustomTimer', 'Запуск', 'Отсчёт времени начался');
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });
  }

  // Останавливает отсчёт и обнуляет время
  void _stop() {
    Logging().info('CustomTimer', 'Остановка', 'Отсчёт остановлен на $_seconds с, время обнулено');
    _timer?.cancel();
    _seconds = 0;
  }

  // Время в формате мм:сс
  String _time() {
    var minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    var seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: po(t: 7.fh, b: 16.fh),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), gradient: main_gradient),
      child: Column(
        children: [
          Text(
            'Timer',
            style: poppins_reg.copyWith(fontSize: 12.fh, height: 18 / 12, color: Colors.white),
          ),
          SizedBox(height: 13.fh),
          Text(
            _time(),
            style: poppins_bold.copyWith(fontSize: 30.fh, color: Colors.white, letterSpacing: 0.3),
          ),
        ],
      ),
    );
  }
}
