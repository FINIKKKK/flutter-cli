import 'package:template/store/slices/items/actions.dart';
import 'package:template/types/base.dart';

// -------------------------
// State
// -------------------------
class ItemsState {
  List<dynamic> items;
  bool isEnd;
  int page;
  int limit;
  String orderBy;
  String orderSort;
  String searchValue;
  bool isLoading;

  ItemsState({
    this.items = const [],
    this.isEnd = false,
    this.page = 0,
    this.limit = 15,
    this.orderBy = 'created_at',
    this.orderSort = 'DESC',
    this.searchValue = '',
    this.isLoading = true,
  });
}
