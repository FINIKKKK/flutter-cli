import 'dart:async';

/*
  Хук для задержки ----------------
 */
class Debouncer {
  // Variables ----------------
  Timer? _timer;

  // Props ----------------
  Debouncer();

  // Функция задержки ----------------
  void run(void Function() action, int milliseconds) {
    _timer?.cancel(); // Отменяет существующий таймер, если он есть
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
