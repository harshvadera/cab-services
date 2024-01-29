part of 'widget_imports.dart';

class TripeTypeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const TripeTypeButton({
    super.key,
    required,
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 80.h,
        width: 120.w,
        decoration: BoxDecoration(
            color: MyColors.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: onTap, icon: const Icon(FeatherIcons.map)),
                title.text
                    .size(12.sp)
                    .fontWeight(FontWeight.w700)
                    .color(MyColors.whiteColor)
                    .make(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
