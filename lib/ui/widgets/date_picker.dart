part of 'common_widgets_imports.dart';

final selectedDateProvider = StateProvider.autoDispose<DateTime>((ref) {
  return DateTime.now();
});

Future<void> _selectDate(
    BuildContext context, WidgetRef ref, DateTime pickedDate) async {
  final newDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );

  if (newDate != null) {
    ref.read(selectedDateProvider.notifier).state = newDate;
  }
}

class DatePicker extends ConsumerWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectDate = ref.watch(selectedDateProvider);

    return TextFormField(
      decoration: InputDecoration(
        fillColor: MyColors.secondaryColor,
        filled: true,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Pick Date',
        helperText: "Select a Date",
        prefixIcon: const Icon(Icons.calendar_today),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MyColors.secondaryColor,
            ),
            borderRadius: BorderRadius.circular(20)),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
      controller: TextEditingController(
          text: DateFormat('yyyy-MM-dd').format(selectDate)),
      onTap: () async {
        _selectDate(context, ref, selectDate);
        // Handle picked date
      },
    );
  }
}
