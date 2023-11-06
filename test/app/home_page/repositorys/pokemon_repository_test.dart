import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/app/home_page/data_source/pokemon_data_source.dart';
import 'package:pokemon/app/home_page/repository/pokemon_repository.dart';

void main() {
  final repository = PokemonRepositoryIMPL(dataSource: PokemonDataSource(dio: Dio()));

  test('description', () async {
    await repository.getPokemons();
  });
}
 