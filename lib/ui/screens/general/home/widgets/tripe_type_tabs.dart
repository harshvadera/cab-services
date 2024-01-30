part of 'widget_imports.dart';

final tripTypeProvider = StateProvider<TripType>((ref) => TripType.outstation);

// Define an enum class for trip types
enum TripType {
  outstation,
  local,
  airportTransfer,
}

class TripTypeTabs extends ConsumerWidget {
  const TripTypeTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripType = ref.watch(tripTypeProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TripeTypeButton(
          title: 'Outstation Trip',
          isSelected: tripType.state == TripType.outstation,
          onTap: () {
            ref.read(tripTypeProvider.notifier).state = TripType.outstation;
          },
        ),
        TripeTypeButton(
          title: 'Local Trip',
          isSelected: tripType.state == TripType.local,
          onTap: () {
            ref.read(tripTypeProvider.notifier).state = TripType.local;
          },
        ),
        TripeTypeButton(
          title: 'Airport Transfer',
          isSelected: tripType.state == TripType.airportTransfer,
          onTap: () {
            ref.read(tripTypeProvider.notifier).state =
                TripType.airportTransfer;
          },
        ),
      ],
    );
  }
}
