import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Function(int) onBarTap;
  final int tabIndex;
  const AnimatedBottomBar(
      {Key? key,
      required this.barItems,
      required this.tabIndex,
      required this.onBarTap})
      : super(key: key);

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  @override
  Widget build(BuildContext context) {
    bool largeScreen = MediaQuery.of(context).size.width > 800 ? true : false;
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 0),
        ],
      ),
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildBarItems(largeScreen),
      ),
    );
  }

  List<Widget> _buildBarItems(largeScreen) {
    List<Widget> bottombaritem = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = widget.tabIndex == i;
      bottombaritem.add(
        Expanded(
          child: MaterialButton(
            onPressed: () {
              // selectedBarIndex.value = i;
              widget.onBarTap(i);
              print(i);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.icon.isEmpty
                    ? const SizedBox(height: 15, width: 25)
                    : SvgPicture.asset(
                        isSelected ? item.selectedicon : item.icon,
                        color: Colors.black,
                        fit: BoxFit.fill,
                      ),
                const SizedBox(height: 8),
                item.text.isEmpty
                    ? const SizedBox(height: 0, width: 0)
                    : Text(
                        item.text,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                          color: Colors.black,
                          fontSize: i == 3 ? 9 : 10,
                        ),
                      )
              ],
            ),
          ),
        ),
      );
    }
    return bottombaritem;
  }
}

class BarItem {
  late String text, iconPath, icon, selectedicon;
  BarItem({
    required this.text,
    required this.icon,
    required this.selectedicon,
  });
}
