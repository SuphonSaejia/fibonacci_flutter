import 'package:fibonacci_flutter/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeModel _model = HomeModel();
  ScrollController scrollControllerMain = ScrollController();
  ScrollController scrollControllerBottomSheet = ScrollController();

  List<ItemModel> get items => _model.items;
  List<ItemModel> get getItemsBySelectItem => _model.getItemsBySelectItem();
  ValueNotifier<ItemModel?> get selectItems => _model.selectItems;

  /// scroll ของ รายการหลัก
  void scrollMainToSelectItems() {
    int index = items.indexOf(selectItems.value!);
    double position = index * 56;
    scrollControllerMain.jumpTo(position);
  }

  /// scroll ของ BottomSheet
  void scrollBottomSheetToSelectItems() {
    int index = getItemsBySelectItem.indexOf(selectItems.value!);
    double position = index * 56;
    scrollControllerBottomSheet.jumpTo(position);
  }

  /// เลือกรายการ
  void onSelectItems(ItemModel item) {
    _model.onSelectItems(item);
  }

  ///ตรวจรายการว่าเลือกหรือยัง?
  bool isSelect(ItemModel item) {
    return _model.isSelect(item);
  }
}
