part of 'general_imports.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  List<TabItem> items = [
    const TabItem(
      icon: FeatherIcons.home,
      // title: 'Home',
    ),
    const TabItem(
      icon: Icons.trip_origin,
      // title: 'Wishlist',
    ),
    const TabItem(
      icon: FeatherIcons.hash,
      // title: 'Cart',
    ),
    const TabItem(
      icon: FeatherIcons.user,
      // title: 'profile',
    ),
  ];
  int visit = 0;

  List<Widget> pages = [
    const Home(),
    // const Categories(),
    const Mytrip(),
    const More(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(visit),
      bottomNavigationBar: BottomBarCreative(
        items: items,
        backgroundColor: MyColors.primaryColor,
        color: MyColors.primaryColor.withOpacity(0.3),
        colorSelected: MyColors.secondaryColor,
        indexSelected: visit,
        highlightStyle: const HighlightStyle(
          isHexagon: true,
        ),
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
    );
  }
}
