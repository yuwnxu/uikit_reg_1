import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент чекбокса
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomCheckbox extends StatefulWidget {
  final bool isChecked; // Начальное состояние

  const CustomCheckbox({super.key, this.isChecked = false});
  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked; // Текущее состояние

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
    Logging().info('CustomCheckbox', 'Создание', 'Чекбокс создан');
  }

  @override
  void dispose() {
    Logging().info('CustomCheckbox', 'Уничтожение', 'Чекбокс уничтожен');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        Logging().info('CustomCheckbox', 'Нажатие', _isChecked ? 'Чекбокс отмечен' : 'Отметка снята');
      },
      child: Container(
        width: 14.fw,
        height: 14.fh,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          border: Border.all(color: pink, width: 1),
        ),
        child: _isChecked ? SvgPicture.asset('assets/Checkmark.svg', width: 7.fw, height: 5.fh) : null,
      ),
    );
  }
}