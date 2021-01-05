import 'package:xiflutter/main/model/AppModel.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/AppBarScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/DrawerWidgets/SimpleDrawerScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/DrawerWidgets/CustomDrawerScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/SliverAppBarWidgets/ListViewSliverAppBar.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/SliverAppBarWidgets/ParallaxSliverAppBar.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/TabBarWidgets/SimpleTabBar.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/TabBarWidgets/IconTabBar.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/BottomNavigationWidgets/IconLabelBottomNav.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/BottomNavigationWidgets/CustomImageBottomNav.dart';
import 'package:xiflutter/widgets/materialWidgets/AppStrucutreWidgets/BottomNavigationWidgets/ShiftingLabelBottomNav.dart';
import 'package:xiflutter/widgets/materialWidgets/ButtonWidgets/DropDownButtonScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/ButtonWidgets/FlatButtonScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/ButtonWidgets/MaterialButtonScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/DialogAlertPanelWidgets/AlertDialogScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/DialogAlertPanelWidgets/BottomSheetScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/DialogAlertPanelWidgets/SnackBarScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/DialogAlertPanelWidgets/ToastScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InformationDisplayWidgets/CardScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InformationDisplayWidgets/GridViewScreen.dart';

import 'package:xiflutter/widgets/materialWidgets/InformationDisplayWidgets/ListViewWidget/VListView.dart';
import 'package:xiflutter/widgets/materialWidgets/InformationDisplayWidgets/ListViewWidget/HorizontalListView.dart';
import 'package:xiflutter/widgets/materialWidgets/InformationDisplayWidgets/RichTextScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/CheckboxScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/DatetimePickerScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/RadioScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/SliderScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/SwitchScreen.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/TextFieldWidgets/SimpleTextField.dart';
import 'package:xiflutter/widgets/materialWidgets/InputSelectionWidgets/TextFieldWidgets/RBTextField.dart';
import 'package:xiflutter/widgets/materialWidgets/LayoutWidgtes/ListTileScreen.dart';

Future<AppTheme> getAllAppsAndThemes() async {
  AppTheme appTheme = AppTheme();

  appTheme.widgets = getWidgets();

  return appTheme;
}

XITheme getWidgets() {
  List<XITheme> list = List();

  list.add(XITheme(
      name: 'Material Widgets',
      type: 'New',
      show_cover: false,
      sub_kits: getMaterialWidgets(),
      darkThemeSupported: true));

  return XITheme(
      name: 'Widgets',
      title_name: 'Widgets',
      type: 'New',
      show_cover: false,
      sub_kits: list);
}

List<XITheme> getMaterialWidgets() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'App Structure',
      show_cover: false,
      type: '',
      sub_kits: getAppStructure(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Layout',
      show_cover: false,
      type: '',
      sub_kits: getLayout(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Information Display',
      show_cover: false,
      type: '',
      sub_kits: getInformationDisplay(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Dialogs, Alerts & Panels',
      show_cover: false,
      type: '',
      sub_kits: getDialogs(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Input & Selection',
      show_cover: false,
      type: '',
      sub_kits: getInputSelection(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Buttons',
      show_cover: false,
      type: '',
      sub_kits: getButtons(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Registration',
      show_cover: false,
      type: '',
      sub_kits: null,
      darkThemeSupported: true));

  return list;
}

List<XITheme> getAppStructure() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'AppBar',
      show_cover: false,
      type: '',
      widget: AppBarScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Bottom Navigation Bar',
      show_cover: false,
      type: '',
      sub_kits: getBottomNavigationBar(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Drawer',
      show_cover: false,
      type: '',
      sub_kits: getDrawer(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'SliverAppBar',
      show_cover: false,
      type: '',
      sub_kits: getSliverAppBar(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'TabBar',
      show_cover: false,
      type: '',
      sub_kits: getTabBar(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getBottomNavigationBar() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Icon and Label',
      show_cover: false,
      type: '',
      widget: IconLabelBottomNav(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Custom Image',
      show_cover: false,
      type: '',
      widget: CustomImageBottomNav(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Shifting Label',
      show_cover: false,
      type: '',
      widget: ShiftingLabelBottomNav(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getDrawer() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Simple',
      show_cover: false,
      type: '',
      widget: SimpleDrawerScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Custom',
      show_cover: false,
      type: '',
      widget: CustomDrawerScreen(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getSliverAppBar() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Sliver AppBar with ListView',
      show_cover: false,
      type: '',
      widget: ListViewSliverAppBar(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Parallax Sliver AppBar',
      show_cover: false,
      type: '',
      widget: ParallaxSliverAppBar(),
      darkThemeSupported: true));

  return list;
}

List<XITheme> getTabBar() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Simple TabBar',
      show_cover: false,
      type: '',
      widget: SimpleTabBar(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'TabBar with Title and Icon',
      show_cover: false,
      type: '',
      widget: IconTabBar(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getButtons() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'DropDownButton',
      show_cover: false,
      type: '',
      widget: DropDownButtonScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'MaterialButton',
      show_cover: false,
      type: '',
      widget: MaterialButtonScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'FlatButton',
      show_cover: false,
      type: '',
      widget: FlatButtonScreen(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getInputSelection() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Checkbox',
      show_cover: false,
      type: '',
      widget: CheckboxScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Datetime Picker',
      show_cover: false,
      type: '',
      widget: DatetimePickerScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Radio',
      show_cover: false,
      type: '',
      widget: RadioScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Slider',
      show_cover: false,
      type: '',
      widget: SliderScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Switch',
      show_cover: false,
      type: '',
      widget: SwitchScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'TextField',
      show_cover: false,
      type: '',
      sub_kits: getTextField(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getTextField() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Simple TextField ',
      show_cover: false,
      type: '',
      widget: SimpleTextField(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Rounded Border TextField ',
      show_cover: false,
      type: '',
      widget: RBTextField(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getDialogs() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'AlertDialog',
      show_cover: false,
      type: '',
      widget: AlertDialogScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'BottomSheet',
      show_cover: false,
      type: '',
      widget: BottomSheetScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'SnackBar',
      show_cover: false,
      type: '',
      widget: SnackBarScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Toast',
      show_cover: false,
      type: '',
      widget: ToastScreen(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getInformationDisplay() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Card',
      show_cover: false,
      type: '',
      widget: CardScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Rich Text',
      show_cover: false,
      type: '',
      widget: RichTextScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Grid',
      show_cover: false,
      type: '',
      widget: GridViewScreen(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'List',
      show_cover: false,
      type: '',
      sub_kits: getListView(),
      darkThemeSupported: true));

  return list;
}

List<XITheme> getListView() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'Simple List View',
      show_cover: false,
      type: '',
      widget: VListView(),
      darkThemeSupported: true));
  list.add(XITheme(
      name: 'Horizontal List View',
      show_cover: false,
      type: '',
      widget: HorizontalListView(),
      darkThemeSupported: true));
  return list;
}

List<XITheme> getLayout() {
  List<XITheme> list = List();
  list.add(XITheme(
      name: 'ListTile',
      show_cover: false,
      type: '',
      widget: ListTileScreen(),
      darkThemeSupported: true));
  return list;
}
//endregion
