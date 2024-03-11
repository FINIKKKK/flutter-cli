import 'package:template/types/base.dart';

// -------------------------
// Actions
// -------------------------
class SetItems {
  final List<dynamic> value;

  SetItems(this.value);
}

class ChangeIsEnd {
  final bool value;

  ChangeIsEnd(this.value);
}

class ChangePage {
  final int value;

  ChangePage(this.value);
}

class ChangeIsLoading {
  final bool value;

  ChangeIsLoading(this.value);
}

class ChangeOrderBy {
  final String value;

  ChangeOrderBy(this.value);
}

class ChangeOrderSort {
  final String value;

  ChangeOrderSort(this.value);
}

class ChangeSearchValue {
  final String value;

  ChangeSearchValue(this.value);
}

class Clear {}

class ClearAll {}

class Finish {
  final List<dynamic> value;

  Finish(this.value);
}
