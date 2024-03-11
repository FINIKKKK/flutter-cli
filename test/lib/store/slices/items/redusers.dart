import 'package:template/store/slices/items/actions.dart';
import 'package:template/store/slices/items/state.dart';

// -------------------------
// Reducers
// -------------------------
ItemsState itemsReducers(ItemsState state, action) {
  switch (action.runtimeType) {
    case SetItems:
      state.items = action.value;
      return state;

    case ChangeIsEnd:
      state.isEnd = action.value;
      return state;

    case ChangePage:
      state.page = action.value;
      return state;

    case ChangeIsLoading:
      state.isLoading = action.value;
      return state;

    case ChangeOrderBy:
      state.orderBy = action.value;
      return state;

    case ChangeSearchValue:
      state.searchValue = action.value;
      return state;

    case ChangeOrderSort:
      state.orderSort = action.value;
      return state;

    case Clear:
      state.isEnd = false;
      state.page = 0;
      state.isLoading = true;
      return state;

    case ClearAll:
      state.items = [];
      state.isEnd = false;
      state.page = 0;
      state.limit = 15;
      state.orderBy = 'id';
      state.orderSort = 'DESC';
      state.searchValue = '';
      state.isLoading = true;
      return state;

    default:
      return state;
  }
}
