import 'package:flutter/material.dart';
import 'package:new_app/restaurant.dart';
import 'package:new_app/detail_page.dart';
import 'package:new_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: RestaurantsListPage.routeName,
      // routes: {
        initialRoute: SplashScreenPage.routeName,
        routes: {
        SplashScreenPage.routeName: (context) => SplashScreenPage(),
        RestaurantsListPage.routeName: (context) => RestaurantsListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
      },
    );
  }
}

class RestaurantsListPage extends StatelessWidget{
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants App'),
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString('/restaurants.json'),
          builder: (context, snapshot){
            final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildArticleItem(context, restaurants[index]);
              },
            );
          }
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: Image.network(
      restaurant.pictureId,
      width: 100,
    ),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.city),
    onTap: (){
      Navigator.pushNamed(context, RestaurantDetailPage.routeName,
          arguments: restaurant);
    },
  );
}