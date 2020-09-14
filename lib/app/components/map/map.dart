import 'package:calendr_todo/app/core/consts/colors_consts.dart';
import 'package:calendr_todo/app/core/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:mapbox_search/mapbox_search.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  LatLng _center = LatLng(-1.45557549, -48.491399);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maps",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: ColorsConst.textColor,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        child: new FlutterMap(
          options: new MapOptions(
            center: _center,
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/abraaoribeiro/ckf17dtht0jds19rd5rvq0ug2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJyYWFvcmliZWlybyIsImEiOiJja2N1eXc3cDMyZDh0MndsYjFzZ3RnZng3In0.CgbvvglsHPHkEN6-Mp6Pqw",
              additionalOptions: {
                'accessToken': apiKeyMapBox,
                'id': 'mapbox.streets'
              },
            ),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: _center,
                  builder: (ctx) => new Container(
                    child: new FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  List<MapBoxPlace> recentList = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String apiKey = apiKeyMapBox;
    Future placesSearch() async {
      var placesService = PlacesSearch(
        apiKey: apiKey,
        country: "BR",
        limit: 5,
      );
      if (query != '') {
        var places = await placesService.getPlaces(query);
        return places;
      }
    }

    return Container(
      child: FutureBuilder(
        future: placesSearch(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              break;
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              List<MapBoxPlace> suggestionList = [];
              break;
            case ConnectionState.done:
              List<MapBoxPlace> suggestionList = snapshot.data;
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      itemCount: suggestionList.length,
                      itemBuilder: (context, index) {
                        final MapBoxPlace place = suggestionList[index];
                        return ListTile(
                          title: Text(place.placeName),
                          leading: query.isEmpty
                              ? Icon(Icons.access_time)
                              : Icon(Icons.pin_drop),
                          onTap: () {
                            showResults(context);
                          },
                        );
                      },
                    );
              break;
          }
          return Center(child: Text('Not Empty'));
        },
      ),
    );
  }
}
