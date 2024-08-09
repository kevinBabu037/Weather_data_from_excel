part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoadingState extends LocationState {}

final class LocationSuccessStae extends LocationState {
 final  List<LocationModel> locations;

  LocationSuccessStae({required this.locations});
}

final class LocationEmptyState extends LocationState {}

final class LocationErrorState extends LocationState {}


