import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент кнопки
// Дата создания: 16-11-2026
// Автор создания: 1

class CustomButton extends StatefulWidget {
  final String text; // Текст кнопки
  final double width; // Ширина кнопки
  final VoidCallback? onTap; // Действие при нажатии

  const CustomButton({super.key, required this.text, required this.width, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomButton', 'Создание', 'Кнопка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomButton', 'Уничтожение', 'Кнопка уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Logging().info('CustomButton', 'Нажатие', 'Произошло нажатие на кнопку');
        widget.onTap?.call();
      },
      child: Container(
        width: widget.width,
        padding: ps(v: 18.fh),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r), gradient: main_gradient),
        child: Center(
          child: Text(
            widget.text,
            style: poppins_bold.copyWith(color: Colors.white, fontSize: 14.fh),
          ),
        ),
      ),
    );
  }
}
