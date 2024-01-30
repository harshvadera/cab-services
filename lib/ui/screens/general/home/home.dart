part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Consumer(builder: (context, ref, _) {
            final tripType = ref.watch(tripTypeProvider);
            final oneway = ref.watch(oneWayToggleProvider);
            final isVisible = ref.watch(toggleOptionVisible);

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.assetsImagesRideLogo,
                      width: 200.w,
                      height: 74.h,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active,
                        size: 35,
                        color: MyColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                10.h.heightBox,
                "India’s Leading One Way Inter-City Cab Service Provider"
                    .text
                    .xl
                    .maxLines(2)
                    .fontWeight(FontWeight.w700)
                    .color(MyColors.whiteColor)
                    .make(),
                10.h.heightBox,
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        Assets.assetsImagesBanner1,
                        width: 400.w,
                        height: 150.h,
                      ),
                      // 10.h.heightBox,
                      SmoothPageIndicator(
                          controller:
                              homeViewModel.bannerController, // PageController
                          count: 3,
                          effect: const WormEffect(
                              activeDotColor: MyColors.secondaryColor,
                              dotHeight: 12.0,
                              dotWidth: 12.0), // your preferred effect
                          onDotClicked: (index) {}),
                    ],
                  ),
                ),
                20.h.heightBox,
                const VxScrollHorizontal(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [TripTypeTabs()],
                  ),
                ),
                10.h.heightBox,
                // ToggleOptions and Trip Forms based on trip type
                if (tripType == TripType.outstation)
                  ToggleOptions(
                    isVisible: !isVisible,
                    label1: "one-way",
                    label2: "Round Trip",
                  ),
                10.h.heightBox,
                // Show appropriate form based on trip type and oneWay toggle
                if (tripType == TripType.outstation)
                  oneway ? const OneWayTripForm() : const RoundTripFormFields(),
                if (tripType == TripType.local) // Add your Local Trip form here
                  Container(),
                // Add handling for other trip types similarly
              ],
            );
          }),
        ),
      ),
    );
  }
}
