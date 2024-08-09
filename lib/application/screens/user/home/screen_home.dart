import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newtok/application/screens/user/home/bloc/location_bloc.dart';
import 'package:newtok/application/screens/user/home/cubit/theme.dart';
import 'package:newtok/application/screens/user/home/widget/location_tile.dart';
import 'package:newtok/application/widgets/error_ui_and_empty_ui_text.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationBloc>().add(FechLocations());
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return IconButton(
                icon: Icon(theme.brightness == Brightness.dark 
                    ? Icons.light_mode 
                    : Icons.dark_mode),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          )
        ],
        centerTitle: true,
        title: const Text('Locations'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LocationSuccessStae) {
            return LocationTileWidget(locations: state.locations,);
          } else if (state is LocationEmptyState) {
            return centerText('Empty List');
          }
          return centerText('Failed to fetch');
        },
      ),
    );
  }
}
