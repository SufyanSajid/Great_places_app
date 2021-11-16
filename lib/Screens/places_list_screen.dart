import 'package:flutter/material.dart';
import 'package:greate_place_app/Provider/great_places.dart';
import 'package:greate_place_app/Screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapShot) =>
            snapShot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: Text('Got no Places Start Added Some'),
                    builder: (ctx, greatePlaes, ch) => greatePlaes.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatePlaes.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatePlaes.items[i].image),
                              ),
                              title: Text(greatePlaes.items[i].title),
                              onTap: () {},
                            ),
                          ),
                  ),
      ),
    );
  }
}
