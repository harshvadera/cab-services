part of 'widget_imports.dart';

class ToggleOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const ToggleOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey,
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: MyColors.whiteColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ToggleOptions extends ConsumerWidget {
  const ToggleOptions({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ToggleOption(
          label: 'One-way',
          isSelected: false,
          onPressed: () {},
        ),
        ToggleOption(
          label: 'Round Trip',
          isSelected: false,
          onPressed: () {},
        ),
      ],
    );
  }
}
