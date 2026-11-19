import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент нижней панели навигации
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomBottomBar extends StatefulWidget {
  final int currentIndex; // Выбранный пункт: 0 Statistics, 1 Discover, 2 центр, 3 Chat, 4 Profile
  final ValueChanged<int> onChanged; // Вызывается при нажатии на пункт

  const CustomBottomBar({super.key, this.currentIndex = 2, required this.onChanged});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomBottomBar', 'Создание', 'Нижняя панель создана');
  }

  @override
  void dispose() {
    Logging().info('CustomBottomBar', 'Уничтожение', 'Нижняя панель уничтожена');
    super.dispose();
  }

  // Нажатие на пункт
  void _select(int index) {
    Logging().info('CustomBottomBar', 'Нажатие', 'Выбран пункт $index');
    widget.onChanged(index);
  }

  // Один пункт: иконка и подпись
  Widget _item(int index, String icon, double w, double h, String label) {
    final TextStyle style = widget.currentIndex == index ? poppins_bold : poppins_reg;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _select(index),
        child: Column(
          children: [
            SizedBox(
              height: 18,
              child: SvgPicture.asset(icon, width: w, height: h),
            ),
            SizedBox(height: 2),
            Text(label, style: style.copyWith(fontSize: 10, height: 1.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 105,
      child: Stack(
        children: [
          Positioned(
            top: 28,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(decoration: BoxDecoration(gradient: main_gradient)),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, gradient: main_gradient),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _item(0, 'assets/Statistics Icon.svg', 19, 17, 'Statistics'),
                _item(1, 'assets/Location_Pin.svg', 14, 18, 'Discover'),
                Expanded(child: SizedBox()),
                _item(3, 'assets/Chat.svg', 17, 16, 'Chat'),
                _item(4, 'assets/Profile.svg', 17, 17, 'Profile'),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _select(2),
                child: Container(
                  width: 61,
                  height: 61,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: main_gradient,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: SvgPicture.asset('assets/Schedule.svg', width: 26, height: 31),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
