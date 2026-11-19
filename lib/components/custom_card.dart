import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент карточки
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomCard extends StatefulWidget {
  final String title; // Заголовок карточки
  final String text; // Описание карточки
  final String image; // Путь к иллюстрации
  final double width; // Ширина карточки
  final VoidCallback? onTap; // Действие при нажатии

  const CustomCard({super.key, required this.title, required this.text, required this.image, required this.width, this.onTap});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomCard', 'Создание', 'Карточка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomCard', 'Уничтожение', 'Карточка уничтожена');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), gradient: main_gradient),
      child: Row(
        children: [
          Padding(
            padding: po(t: 30.fh, b: 20.fh, l: 24.fw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: caption_2_2.copyWith(fontSize: 12.fh, color: Colors.white, letterSpacing: -0.3, height: 0),
                ),
                SizedBox(height: 14.fh),
                SizedBox(
                  width: 165.fw,
                  child: Text(
                    widget.text,
                    style: caption_2_1.copyWith(fontSize: 10.fh, height: 0, color: Colors.white, letterSpacing: -0.3),
                  ),
                ),
                SizedBox(height: 42.fh),
                GestureDetector(
                  onTap: () {
                    Logging().info('CustomCard', 'Нажатие', 'Произошло нажатие на иконку в карточке');
                    widget.onTap?.call();
                  },
                  child: SvgPicture.asset('assets/arrow.svg'),
                ),
              ],
            ),
          ),
          Image.asset(widget.image, width: 112.fw, height: 107.fh),
        ],
      ),
    );
  }
}
