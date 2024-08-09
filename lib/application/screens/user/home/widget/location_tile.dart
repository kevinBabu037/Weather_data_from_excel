
import 'package:flutter/material.dart';
import 'package:newtok/application/screens/user/home/widget/locatin_details_pupup.dart';
import 'package:newtok/application/utils/colors.dart';
import 'package:newtok/application/utils/height_width.dart';
import 'package:newtok/data/model/location_model.dart';

class LocationTileWidget extends StatelessWidget {
  const LocationTileWidget({
    super.key, required this.locations,
  });
  final List<LocationModel> locations;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final data = locations[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            onTap: () {
              showDetailsDialog(context,data);
            },
            contentPadding: const EdgeInsets.all(16),
            leading: const CircleAvatar(
              backgroundColor: kClrBlue,
              child: Icon(Icons.location_on, ),
            ),
            title: Text(
              data.country,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              '${data.state}, ${data.district}, ${data.city}',
              style: const TextStyle(
                color: kClrGrey,
              ),
            ),
           
          ),
        );
      },
      separatorBuilder: (context, index) => kHeight10,
      itemCount: locations.length,
    );
  }
}

