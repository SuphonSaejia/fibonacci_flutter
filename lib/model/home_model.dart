import 'package:flutter/foundation.dart';

///ชนิดของ Fibonacci
enum FibonacciType { even, odd, prime }

///ข้อมูลของ Item Fibonacci
class ItemModel {
  final int index;
  final int number;
  final FibonacciType type;

  ItemModel({
    required this.number,
    required this.type,
    required this.index,
  });
}

/// ข้อมูลที่ใช้ในหน้า home
class HomeModel {
  late final List<ItemModel> items;
  late final ValueNotifier<ItemModel?> selectItems;

  factory HomeModel() => _instance;
  static final HomeModel _instance = HomeModel._internal();
  HomeModel._internal() {
    items = _generateFibonacci(40);
    selectItems = ValueNotifier<ItemModel?>(null);
  }

  ///สร้างรายการ Item Fibonacci
  List<ItemModel> _generateFibonacci(int count) {
    if (count <= 0) return [];
    if (count == 1) return [ItemModel(number: 0, index: 0, type: FibonacciType.even)];

    List<int> fibonacciList = [0, 1];
    List<ItemModel> itemList = [
      ItemModel(number: 0, index: 0, type: FibonacciType.even),
      ItemModel(number: 1, index: 1, type: FibonacciType.odd),
    ];

    for (int i = 2; i < count; i++) {
      int nextNumber = fibonacciList[i - 1] + fibonacciList[i - 2];
      fibonacciList.add(nextNumber);

      itemList.add(ItemModel(
        number: nextNumber,
        index: i,
        type: _classifyFibonacciType(nextNumber),
      ));
    }

    return itemList;
  }

  ///กำหนดชนิดของ Fibonacci
  FibonacciType _classifyFibonacciType(int number) {
    if (number % 2 == 0) {
      return FibonacciType.even;
    } else if (_isPrime(number)) {
      return FibonacciType.prime;
    } else {
      return FibonacciType.odd;
    }
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  /// get รายการ Item Fibonacci ตาม SelectItem
  List<ItemModel> getItemsBySelectItem() {
    return items.where((item) => item.type == selectItems.value!.type).toList();
  }

  /// กำหนด SelectItems
  void onSelectItems(ItemModel item) {
    selectItems.value = item;
  }

  /// ตรวจว่าใช่อันที่เลือกไหม?
  bool isSelect(ItemModel item) {
    return selectItems.value == item;
  }
}
