import 'dart:convert';
import 'package:covid_apicalling_project/api_sample.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      title: 'Api calling',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ));

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Countries> countriesdata = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.toString()),
      ),
      body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 260,
                  color: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Countries : ${countriesdata[index].country}"),
                    Text(" cases : ${countriesdata[index].cases}"),
                    Text("deaths : ${countriesdata[index].deaths}"),
                    Text("recovered : ${countriesdata[index].recovered}"),
                    Text("active : ${countriesdata[index].active}"),
                    Text("critical : ${countriesdata[index].critical}"),
                    Text("todayCases : ${countriesdata[index].todayCases}"),
                    Text("todayRecovered : ${countriesdata[index].todayRecovered}"),
                    Text("todayDeaths : ${countriesdata[index].todayDeaths}"),
                    Text("tests : ${countriesdata[index].tests}"),
                    Text("population : ${countriesdata[index].population}"),
                    
                    ],
                  ),
                );
              });
            } else {

              return Center(child: CircularProgressIndicator(),);
            }
          }),
    );
  }

  Future<List<Countries>> getdata() async {
    final responce =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));

    if (responce.statusCode == 200) {

        List<dynamic> data = jsonDecode(responce.body);

      for (Map<String, dynamic> index in data) {

      countriesdata.add(Countries.fromJson(index));
      }
      return countriesdata;
    } else {
      return countriesdata;
    }
  }
}


class Countries {
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int active;
  final int critical;
  final int todayCases;
  final int todayRecovered;
  final int todayDeaths;
  final int tests;
  final int population;

  Countries({
    required this.country,
    required this.cases,
    required this.deaths,
    required this.recovered,
    required this.active,
    required this.critical,
    required this.todayCases,
    required this.todayRecovered,
    required this.todayDeaths,
    required this.tests,
    required this.population,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        country: json['country'] as String,
        cases: json['cases'] as int,
        deaths: json['deaths'] as int,
        recovered: json['recovered'] as int,
        active: json['active'] as int,
        critical: json['critical'] as int,
        todayCases: json['todayCases'] as int,
        todayRecovered: json['todayRecovered'] as int,
        todayDeaths: json['todayDeaths'] as int,
        tests: json['tests'] as int,
        population: json['population'] as int,
      );
}






