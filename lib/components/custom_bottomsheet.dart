import 'package:flutter/material.dart';
import 'package:vize/vize.dart';
import 'package:uikit/colors.dart';
import 'package:uikit/typography.dart';
import 'package:uikit/logg.dart';

// Кастомный компонент нижней шторки с выбором
// Дата создания: 17-11-2026
// Автор создания: 1

class CustomBottomSheet extends StatefulWidget {
  final List<String> items; // Список вариантов
  final String selected; // Выбранный сейчас вариант
  final ValueChanged<String> onSelect; // Вызывается при выборе пункта

  const CustomBottomSheet({super.key, required this.items, required this.selected, required this.onSelect});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void initState() {
    super.initState();
    Logging().info('CustomBottomSheet', 'Создание', 'Шторка создана');
  }

  @override
  void dispose() {
    Logging().info('CustomBottomSheet', 'Уничтожение', 'Шторка уничтожена');
    super.dispose();
  }

  Widget _item(String item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Logging().info('CustomBottomSheet', 'Нажатие', 'Выбран пункт: $item');
        widget.onSelect(item);
      },
      child: Padding(
        padding: ps(h: 24.fw, v: 12.fh),
        child: Text(
          item,
          style: poppins_reg.copyWith(fontSize: 14.fh, color: item == widget.selected ? pink : black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          padding: po(t: 16.fh, b: 16.fh),
          itemCount: widget.items.length,
          itemBuilder: (context, index) => _item(widget.items[index]),
        ),
      ),
    );
  }
}
