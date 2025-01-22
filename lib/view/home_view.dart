import 'package:fibonacci_flutter/controller/home_controller.dart';
import 'package:fibonacci_flutter/model/home_model.dart';
import 'package:fibonacci_flutter/view/widget/list_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final HomeController controller;

  const HomeView({super.key, required this.controller});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci"),
      ),
      body: SafeArea(
        child: ListView.builder(
          controller: widget.controller.scrollControllerMain,
          itemCount: widget.controller.items.length,
          itemBuilder: (_, indexItem) {
            ItemModel item = widget.controller.items[indexItem];
            int number = item.number;
            int index = item.index;
            FibonacciType type = item.type;

            return ValueListenableBuilder<ItemModel?>(
              valueListenable: widget.controller.selectItems,
              builder: (context, selectItems, child) {
                return ListItem(
                  type: type,
                  tileColor: Colors.red,
                  text: 'index:$index , number: $number',
                  isSelect: widget.controller.isSelect(item),
                  onTap: () {
                    widget.controller.onSelectItems(item);
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(Duration.zero, () {
                          widget.controller.scrollBottomSheetToSelectItems();
                        });
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            controller: widget.controller.scrollControllerBottomSheet,
                            itemCount: widget.controller.getItemsBySelectItem.length,
                            itemBuilder: (_, indexItem) {
                              ItemModel bottomSheetItem = widget.controller.getItemsBySelectItem[indexItem];
                              int number = bottomSheetItem.number;
                              int index = bottomSheetItem.index;
                              FibonacciType type = bottomSheetItem.type;

                              return ListItem(
                                type: type,
                                tileColor: Colors.green,
                                text: 'index:$index , number: $number',
                                isSelect: widget.controller.isSelect(bottomSheetItem),
                                onTap: () {
                                  if (!widget.controller.isSelect(bottomSheetItem)) {
                                    widget.controller.onSelectItems(bottomSheetItem);
                                    widget.controller.scrollMainToSelectItems();
                                  }
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
