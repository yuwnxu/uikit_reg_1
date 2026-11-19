import 'package:logger/logger.dart';

// Логирование событий различного уровня
// Дата создания: 16-11-2026
// Автор создания: 1

class Logging {
  var log = Logger();

  // Форматирование сообщений в консоль
  // Входные параметры: тег, событие, детали
  // Выходные данные: формат сообщения
  String _format(String tag, String event, String details) {
    return '[$tag]: $event — $details';
  }

  // Лог уровня debug
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void debug(String tag, String event, String details) {
    log.d(_format(tag, event, details));
  }

  // Лог уровня info
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void info(String tag, String event, String details) {
    log.i(_format(tag, event, details));
  }

  // Лог уровня error
  // Входные параметры: тег, событие, детали
  // Действие: лог в консоль
  void error(String tag, String event, String details, error) {
    log.e(_format(tag, event, details), error: error);
  }
}
