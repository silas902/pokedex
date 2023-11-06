import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/app/home_page/data_source/pokemon_data_source.dart';

void main() {
  test('description', () async {
    final dataSource = PokemonDataSource(dio: Dio());
    final response = await dataSource.getPokemons();
    final Map<String, dynamic> data = response.$2!.data;
    print(data.toString());
  });
}
