import 'package:getx_structure_template/localization/app_strings.dart';
import 'package:getx_structure_template/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, FAVORITE, SETTINGS }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem() {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: AppStrings.bottomNavHome,
          iconSvgName: "ic_home.svg",
          menuCode: MenuCode.HOME,
        );
      case MenuCode.FAVORITE:
        return BottomNavItem(
            navTitle: AppStrings.bottomNavFavorite,
            iconSvgName: "ic_favorite.svg",
            menuCode: MenuCode.FAVORITE);
      case MenuCode.SETTINGS:
        return BottomNavItem(
            navTitle: AppStrings.bottomNavSettings,
            iconSvgName: "ic_settings.svg",
            menuCode: MenuCode.SETTINGS);
    }
  }
}
