import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент поля ввода
// Дата создания: 16-11-2026
// Автор создания: 1

// Состояние поля
enum CustomInputStatus { normal, error }

class CustomInput extends StatefulWidget {
  final String hint; // Текст подсказки
  final double width; // Ширина поля
  final CustomInputStatus status; // Состояние поля
  final String? errorText; // Текст ошибки
  final TextEditingController? controller; // Контроллер текста

  const CustomInput({super.key, required this.hint, required this.width, this.status = CustomInputStatus.normal, this.errorText, this.controller});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomInput', 'Создание', 'Поле ввода создано');
  }

  @override
  void dispose() {
    Logging().info('CustomInput', 'Уничтожение', 'Поле ввода уничтожено');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = widget.status == CustomInputStatus.error;

    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.controller,
            style: poppins_reg.copyWith(fontSize: 12.fh),
            decoration: InputDecoration.collapsed(
              hintText: widget.hint,
              hintStyle: poppins_reg.copyWith(fontSize: 12.fh),
            ),
            onTap: () => Logging().info('CustomInput', 'Нажатие', 'Произошло нажатие на поле'),
          ),
          SizedBox(height: 8.fh),
          Container(
            height: 1,
            decoration: BoxDecoration(color: hasError ? error : null, gradient: hasError ? null : main_gradient),
          ),
          if (hasError) SizedBox(height: 4.fh),
          if (hasError)
            Text(
              widget.errorText ?? '',
              style: poppins_reg.copyWith(fontSize: 10.fh, color: error),
            ),
        ],
      ),
    );
  }
}
