import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент кнопки выхода
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomLogout extends StatefulWidget {
  final String text; // Текст рядом с иконкой
  final VoidCallback? onTap; // Действие при нажатии

  const CustomLogout({super.key, required this.text, this.onTap});

  @override
  State<CustomLogout> createState() => _CustomLogoutState();
}

class _CustomLogoutState extends State<CustomLogout> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomLogout', 'Создание', 'Кнопка выхода создана');
  }

  @override
  void dispose() {
    Logging().info('CustomLogout', 'Уничтожение', 'Кнопка выхода уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Logging().info('CustomLogout', 'Нажатие', 'Произошло нажатие на кнопку выхода');
        widget.onTap?.call();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18.fw,
            height: 18.fw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              border: Border.all(color: pink, width: 1),
            ),
            child: Transform.translate(
              offset: Offset(2.fw, 0),
              child: Icon(Icons.arrow_back, size: 16.fw, color: pink),
            ),
          ),
          SizedBox(width: 18.fw),
          Text(widget.text, style: poppins_reg.copyWith(fontSize: 16.fh, letterSpacing: -0.3)),
        ],
      ),
    );
  }
}