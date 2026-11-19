import 'package:flutter/material.dart';
import 'package:uikit/components/custom_button.dart';
import 'package:uikit/typography.dart';

import 'colors.dart';

import 'package:vize/vize.dart';

import 'components/custom_bottombar.dart';
import 'components/custom_card.dart';
import 'components/custom_checkbox.dart';
import 'components/custom_input.dart';
import 'components/custom_logout.dart';
import 'components/custom_pagination.dart';
import 'components/custom_select.dart';
import 'components/custom_timer.dart';

// Точка вход в приложение

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Vize.init(context, figmaHeight: 812, figmaWidth: 375);
    return MaterialApp(title: 'StoryBook', debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0; // Текущая страница индикатора
  bool _isTimerRunning = false; // Идёт ли таймер
  int _tab = 2; // Выбранный пункт нижней панели (по умолчанию центральный)

  // Виджет для отображения блока одного цвета
  Widget colors(String text, Color color, Color border) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 40.fw,
            height: 40.fw,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: border, width: 0.5.fw),
            ),
          ),
          SizedBox(height: 8.fh),
          Text(
            text,
            textAlign: TextAlign.center,
            style: roboto_reg.copyWith(fontSize: 14.fh, height: 16 / 14, color: black, letterSpacing: 0),
          ),
        ],
      ),
    );
  }

  // Виджет для отображения стиля текста
  Widget typography(String text, TextStyle style, double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom.fh),
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: ps(h: 16.fw, v: 16.fh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Цвета',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              SizedBox(height: 20.fh),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [colors('Accent', accent, accent), colors('Accent\ninactive', accentInactive, accentInactive), colors('Black', black, black), colors('White', white, Colors.black.withValues(alpha: 0.25))],
                  ),
                  SizedBox(height: 20.fh),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [colors('Error', error, error), colors('Success', success, success), colors('Инпут бг', input_bg, input_bg), colors('Инпут строк', input_stroke, input_stroke)]),
                  SizedBox(height: 20.fh),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [colors('Инпут иконки', input_icon, input_icon), colors('Плейсхолдер', placeholder, placeholder), colors('Дескрипшн', description, description), colors('Кард строк', card_stroke, card_stroke)],
                  ),
                ],
              ),
              SizedBox(height: 20.fh),
              Text(
                'Типографика',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              typography('Title 1 - Semibold', title1_1, 5),
              typography('Title 1 - ExtraBold', title1_2, 10),
              typography('Title 2 - Regular', title2_1, 5),
              typography('Title 2 - Semibold', title2_2, 5),
              typography('Title 2 - ExtraBold', title2_3, 10),
              typography('Title 3 - Regular', title3_1, 5),
              typography('Title 3 - Medium', title3_2, 5),
              typography('Title 3 - Semibold', title3_3, 10),
              typography('Headline - Regular', headline_1, 5),
              typography('Headline - Medium', headline_2, 10),
              typography('Text - Regular', text_1, 5),
              typography('Text - Medium', text_2, 10),
              typography('Caption - Regular', caption_1, 5),
              typography('Caption - Semibold', caption_2, 10),
              typography('Caption 2 - Regular', caption_2_1, 5),
              typography('Caption 2 - Bold', caption_2_2, 0),
              SizedBox(height: 20.fh),
              Text(
                'Button',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              Center(
                child: CustomButton(text: 'Let’s Combat!', width: 210.fw),
              ),
              SizedBox(height: 20.fh),
              Text(
                'Input',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              CustomInput(hint: 'Full Name', width: 263.fw),
              SizedBox(height: 20.fh),
              CustomInput(hint: 'Full Name', width: 263.fw, status: CustomInputStatus.error, errorText: 'Incorrect name'),
              SizedBox(height: 20.fh),
              Text(
                'Checkbox',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              Row(
                children: [
                  CustomCheckbox(isChecked: true),
                  SizedBox(width: 4.fw),
                  CustomCheckbox(),
                ],
              ),
              SizedBox(height: 20.fh),
              Text(
                'Logout',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              CustomLogout(text: 'Logout', onTap: () {}),
              SizedBox(height: 20.fh),
              Text(
                'Card',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              Center(
                child: CustomCard(title: 'Schedule', text: 'Easily schedule event/games\nthen find like minded players for\nbattle. You up for it?', image: 'assets/person_1.png', width: 315.fw),
              ),
              SizedBox(height: 20.fh),
              Text(
                'Pagination',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              CustomPagination(
                current: _page,
                onChanged: (int page) {
                  setState(() {
                    _page = page;
                  });
                },
                onFinish: () {},
              ),
              SizedBox(height: 20.fh),
              Text(
                'Timer',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              Center(
                child: CustomTimer(width: 295.fw, isRunning: _isTimerRunning),
              ),
              SizedBox(height: 10.fh),
              Center(
                child: CustomButton(text: _isTimerRunning ? 'Stop' : 'Start', width: 110.fw, onTap: () => setState(() => _isTimerRunning = !_isTimerRunning)),
              ),
              SizedBox(height: 20.fh),
              Text(
                'Select',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              CustomSelect(label: 'FROM', current: 'MON, NOV 4,2019', items: ['MON, NOV 4,2019', 'TUE, NOV 5,2019', 'WED, NOV 6,2019', 'THU, NOV 7,2019', 'FRI, NOV 8,2019', 'SAT, NOV 9,2019'], width: 150.fw),
              SizedBox(height: 20.fh),
              Text(
                'Bottom Bar',
                style: roboto_extra.copyWith(fontSize: 32.fh, height: 48 / 32, letterSpacing: 1),
              ),
              CustomBottomBar(currentIndex: _tab, onChanged: (int index) => setState(() => _tab = index)),
            ],
          ),
        ),
      ),
    );
  }
}
