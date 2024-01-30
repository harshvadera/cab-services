part of 'widget_imports.dart';

class DropCity extends ConsumerWidget {
  const DropCity({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citiesAsyncValue = ref.watch(citiesProvider);
    return citiesAsyncValue.when(
      data: (cities) {
        return DropdownButtonFormField<CityModel>(
          decoration: InputDecoration(
            fillColor: MyColors.secondaryColor,
            filled: true,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Drop City',
            helperText: "Select a city",
            prefixIcon: const Icon(Icons.location_on),
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
          onChanged: (CityModel? newValue) {
            // Handle the selected city
          },
          items: cities.map<DropdownMenuItem<CityModel>>((CityModel city) {
            return DropdownMenuItem<CityModel>(
              value: city,
              child: Text(city.name),
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}

class OneWayTripForm extends ConsumerWidget {
  const OneWayTripForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    addCitiesToHive();
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.590,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.whiteColor),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PickupCity(),
          10.h.heightBox,
          const DropCity(),
          10.h.heightBox,
          const DatePicker(),
          10.h.heightBox,
          const TimePickerFormField(),
          20.h.heightBox,
          PrimaryButton(text: "Explore Cabs", onPressed: () {}).centered()
        ],
      ),
    );
  }
}

class PickupCity extends ConsumerWidget {
  const PickupCity({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final citiesAsyncValue = ref.watch(citiesProvider);
    return citiesAsyncValue.when(
      data: (cities) {
        return DropdownButtonFormField<CityModel>(
          decoration: InputDecoration(
            fillColor: MyColors.secondaryColor,
            filled: true,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Pick-up City',
            helperText: "Select a city",
            prefixIcon: const Icon(Icons.location_on),
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
          onChanged: (CityModel? newValue) {
            // Handle the selected city
          },
          items: cities.map<DropdownMenuItem<CityModel>>((CityModel city) {
            return DropdownMenuItem<CityModel>(
              value: city,
              child: Text(city.name),
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
