import 'package:fibonacci_flutter/controller/home_controller.dart';
import 'package:fibonacci_flutter/view/home_view.dart';
import 'package:fibonacci_flutter/view/widget/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeView Widget Tests', () {
    late HomeController controller;

    setUp(() {
      // สร้าง controller mock
      controller = HomeController();
    });

    testWidgets('should render HomeView correctly', (WidgetTester tester) async {
      // เพิ่ม widget สำหรับทดสอบ
      await tester.pumpWidget(MaterialApp(home: HomeView(controller: controller)));

      // ตรวจสอบว่าชื่อ Fibonacci แสดงบน AppBar
      expect(find.text('Fibonacci'), findsOneWidget);

      // ตรวจสอบว่า ListItem ถูก render
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should open BottomSheet when tapping a ListItem', (WidgetTester tester) async {
      // เพิ่ม widget สำหรับทดสอบ
      await tester.pumpWidget(MaterialApp(home: HomeView(controller: controller)));

      // ตรวจสอบว่ามี ListItem
      expect(find.byType(ListItem), findsWidgets);

      // เลือกรายการแรก
      await tester.tap(find.byType(ListItem).first);
      await tester.pumpAndSettle();

      // ตรวจสอบว่า BottomSheet ถูกเปิด
      expect(find.byType(BottomSheet), findsOneWidget);
    });

    testWidgets('should scroll to selected item in BottomSheet', (WidgetTester tester) async {
      // Mock การเลือก item
      final selectedItem = controller.items[0];
      controller.onSelectItems(selectedItem);

      // เพิ่ม widget สำหรับทดสอบ
      await tester.pumpWidget(MaterialApp(home: HomeView(controller: controller)));

      // กดเลือก item
      await tester.tap(find.text('index:${selectedItem.index} , number: ${selectedItem.number}'));
      await tester.pumpAndSettle();

      // ตรวจสอบว่า BottomSheet เปิด
      expect(find.byType(BottomSheet), findsOneWidget);

      // Mock ScrollController เพื่อตรวจสอบว่าเลื่อนไปยังรายการที่เลือก
      final scrollOffset = controller.scrollControllerBottomSheet.offset;
      expect(scrollOffset, 0.0);
    });
  });
}
