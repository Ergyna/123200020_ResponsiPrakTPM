import 'package:flutter/material.dart';
import 'package:responsi1/controller/meal_source.dart';
import 'package:responsi1/model/list_meal.dart';
import 'package:responsi1/view/list_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/detail.dart';
import 'home.dart';

class DetailPage extends StatefulWidget {
  final MealList data;
  final int index;
  const DetailPage({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int no = widget.index;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Detail of ${widget.data.meals?[no].strMeal}".toTitleCase()),
        ),
      ),
      body: _buildDetailMeal(),
    );
  }

  Widget _buildDetailMeal() {
    debugPrint("${widget.data.meals?[no].idMeal}");
    return FutureBuilder(
        future: MealSource.instance
            .loadDetail(idMeal: "${widget.data.meals?[no].idMeal}"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            MealDetail mealdetail = MealDetail.fromJson(snapshot.data);
            return _buildSuccessSection(mealdetail);
          }
          return _buildLoadingSection();
        });
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildSuccessSection(MealDetail data) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDescription(data),
          ],
        ),
      ),
    );
  }


  Widget _buildDescription(MealDetail data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.deepOrangeAccent.withOpacity(0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                "${data.meals![0].strMeal}".toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    "${data.meals![0].strMealThumb}",
                    fit: BoxFit.fill,
                    width: 200.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Category : ${data.meals![0].strCategory}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 30),
              Text(
                "Area : ${data.meals![0].strArea}",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 30),

              Text(
                "${data.meals![0].strInstructions}",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () async {
                  var url = data.meals![0].strYoutube!;
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  'Youtube Video',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}