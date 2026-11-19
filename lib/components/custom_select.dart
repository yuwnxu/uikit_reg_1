import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

import 'custom_bottomsheet.dart';

// Кастомный компонент выбора из списка
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomSelect extends StatefulWidget {
  final String label; // Подпись над значением
  final String current; // Начальное значение
  final List<String> items; // Варианты выбора
  final double width; // Ширина
  final ValueChanged<String>? onChanged; // Вызывается при выборе

  const CustomSelect({super.key, required this.label, required this.current, required this.items, required this.width, this.onChanged});

  @override
  State<CustomSelect> createState() => _CustomSelectState();
}

class _CustomSelectState extends State<CustomSelect> {
  late String _current; // Текущее значение

  @override
  void initState() {
    super.initState();
    _current = widget.current;
    Logging().info('CustomSelect', 'Создание', 'Селект создан');
  }

  @override
  void dispose() {
    Logging().info('CustomSelect', 'Уничтожение', 'Селект уничтожен');
    super.dispose();
  }

  void _openSheet() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        items: widget.items,
        selected: _current,
        onSelect: (String item) {
          setState(() {
            _current = item;
          });
          widget.onChanged?.call(item);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Logging().info('CustomSelect', 'Нажатие', 'Произошло нажатие на селект');
        _openSheet();
      },
      child: SizedBox(
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: poppins_reg.copyWith(fontSize: 8.fh, height: 12 / 8, color: pink),
            ),
            SizedBox(height: 10.fh),
            Row(
              children: [
                Expanded(
                  child: Text(_current, style: poppins_reg.copyWith(fontSize: 11.fh, height: 1.5)),
                ),
                Icon(Icons.keyboard_arrow_down, size: 20.fw, color: pink),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
