import 'package:flutter/material.dart';
import 'package:getx_structure_template/app/core/base/base_widget_mixin.dart';
import 'package:getx_structure_template/app/core/widget/asset_image_view.dart';
import 'package:get/get.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/main/controllers/bottom_nav_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/model/menu_item.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

class BottomNavBar extends StatelessWidget with BaseWidgetMixin {
  BottomNavBar({
    super.key,
    required this.onItemSelected,
  });

  final OnBottomNavItemSelected onItemSelected;
  final navController = BottomNavController();
  final Key bottomNavKey = GlobalKey();
  final Color unselectedItemColor = Colors.grey;

  @override
  Widget body(BuildContext context) {
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: _navItemBuilder(context,navItems),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).textTheme.bodySmall?.color,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onItemSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _navItemBuilder(BuildContext context,List<BottomNavItem> navItems) {
    return navItems
        .map(
          (BottomNavItem navItem) => _getBottomNavigationBarItem(
            context,
            navItem,
            navItems.indexOf(navItem) == navController.selectedIndex,
          ),
        )
        .toList();
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
    BuildContext context,
    BottomNavItem navItem,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: AssetImageView(
        fileName: navItem.iconSvgName,
        height: AppValues.iconDefaultSize,
        width: AppValues.iconDefaultSize,
        color: isSelected ? Theme.of(context).textTheme.bodySmall?.color : unselectedItemColor,
      ),
      label: navItem.navTitle,
      tooltip: navItem.navTitle,
    );
  }

  List<BottomNavItem> _getNavItems() {
    return MenuCode.values
        .map((e) => e.toBottomNavItem())
        .toList();
  }
}
