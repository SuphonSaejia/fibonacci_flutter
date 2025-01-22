import 'package:flutter_test/flutter_test.dart';
import 'package:fibonacci_flutter/model/home_model.dart';

void main() {
  late HomeModel model;

  setUp(() {
    // กำหนด HomeModel ใหม่ก่อนทุก test
    model = HomeModel();
  });

  group('HomeModel Tests', () {
    test('should generate correct number of Fibonacci items', () {
      // ตรวจสอบว่า items ใน model มีจำนวนที่ถูกต้อง
      expect(model.items.length, 40); // ค่าที่คาดว่าจะถูกต้องคือ 40
    });

    test('should correctly classify Fibonacci numbers', () {
      // ตรวจสอบการจัดประเภทของ Fibonacci numbers (even, odd, prime)
      List<ItemModel> evenItems = model.items.where((item) => item.type == FibonacciType.even).toList();
      List<ItemModel> oddItems = model.items.where((item) => item.type == FibonacciType.odd).toList();
      List<ItemModel> primeItems = model.items.where((item) => item.type == FibonacciType.prime).toList();

      expect(evenItems.length, greaterThan(0)); // คาดว่า Fibonacci คู่น่าจะมี
      expect(oddItems.length, greaterThan(0)); // คาดว่า Fibonacci คี่น่าจะมี
      expect(primeItems.length, greaterThan(0)); // คาดว่า Fibonacci เฉพาะน่าจะมี
    });

    test('should select an item correctly', () {
      // สร้าง ItemModel สำหรับการทดสอบ
      final selectedItem = model.items[5]; // เลือก index 5

      // เรียก onSelectItems เพื่อลองเลือก item
      model.onSelectItems(selectedItem);

      // ตรวจสอบว่า selectItems มีค่าเป็น selectedItem ที่เราเลือก
      expect(model.selectItems.value, selectedItem);
    });

    test('should return correct filtered items by selected type', () {
      // เลือก item ที่มี type = even
      final selectedItem = model.items[0]; // เลือก item ที่เป็น even
      model.onSelectItems(selectedItem);

      // เรียกใช้ getItemsBySelectItem เพื่อกรองรายการ
      List<ItemModel> filteredItems = model.getItemsBySelectItem();

      // ตรวจสอบว่าทุก item ใน filteredItems เป็น FibonacciType.even
      expect(filteredItems.every((item) => item.type == FibonacciType.even), true);
    });
  });
}
