import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';
import 'package:uikit/components/custom_button.dart';

// Кастомный компонент индикатора страниц с кнопкой Skip
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomPagination extends StatefulWidget {
  final int current; // Номер текущей страницы
  final ValueChanged<int> onChanged; // Вызывается, когда страница меняется (свайп или skip)
  final VoidCallback? onFinish; // Нажатие на кнопку на последней странице
  final String skipText; // Текст кнопки пропуска
  final String buttonText; // Текст кнопки на последней странице

  const CustomPagination({super.key, required this.current, required this.onChanged, this.onFinish, this.skipText = 'Skip', this.buttonText = 'Let’s Combat!'});

  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  final int _lastPage = 2;

  @override
  void initState() {
    super.initState();
    Logging().info('CustomPagination', 'Создание', 'Индикатор страниц создан');
  }

  @override
  void dispose() {
    Logging().info('CustomPagination', 'Уничтожение', 'Индикатор страниц уничтожен');
    super.dispose();
  }

  // Виджет для отображения одной точки индикатора
  Widget _dot(int index) {
    return Container(
      width: 10.fw,
      height: 10.fw,
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.current == index ? pink : pink.withOpacity(0.3)),
    );
  }

  // Свайп по строке с точками
  void _onSwipe(DragEndDetails details) {
    final double speed = details.primaryVelocity ?? 0;
    if (speed < 0 && widget.current < _lastPage) {
      widget.onChanged(widget.current + 1);
    } else if (speed > 0 && widget.current > 0) {
      widget.onChanged(widget.current - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLast = widget.current == _lastPage;

    return Column(
      children: [
        SizedBox(
          height: 58.fh,
          child: Center(
            child: isLast
                ? CustomButton(text: widget.buttonText, width: 210.fw, onTap: widget.onFinish)
                : GestureDetector(
                    onTap: () {
                      Logging().info('CustomPagination', 'Нажатие', 'Кнопка Skip, переход на последнюю страницу');
                      widget.onChanged(_lastPage);
                    },
                    child: Text(
                      widget.skipText,
                      style: poppins_bold.copyWith(fontSize: 14.fh, color: pink, decoration: TextDecoration.underline, decorationColor: pink),
                    ),
                  ),
          ),
        ),
        SizedBox(height: 20.fh),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: _onSwipe,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _dot(0),
              SizedBox(width: 10.fw),
              _dot(1),
              SizedBox(width: 10.fw),
              _dot(2),
            ],
          ),
        ),
      ],
    );
  }
}
