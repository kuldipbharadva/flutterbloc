
import 'package:flutter_bloc_demo/blocs/models/your_model.dart';

class YourEachApiProvider {
//  Manage your api call and handle response using your model class,
//  You can manage your response like you managed in retrofit for each call using Model, ex.: Response<Model>

// Reference : https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1

  Future<YourModel> getYourData() async {
    print("entered");
    // final response = await get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    // print(response.body.toString());
    // if (response.statusCode == 200) {
    //   // If the call to the server was successful, parse the JSON
    //   return ItemModel.fromJson(json.decode(response.body));
    // } else {
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }
  }
}