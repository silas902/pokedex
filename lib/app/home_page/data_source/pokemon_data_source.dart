import 'package:dio/dio.dart';

import 'package:pokemon/app/core/result.dart';

abstract class IPokemonDataSource {
  Future<Result<Exception, Response>> getPokemons();
  Future<Result<Exception, Response>> getPokemonDetails({required String url});
  Future<Result<Exception, Response>> getGenderPokemon({required int id});
}

class PokemonDataSource extends IPokemonDataSource {
  late Dio _dio;
  PokemonDataSource({
    required Dio dio,
  }) {
    _dio = dio;
  }
  @override
  Future<Result<Exception, Response>> getPokemons() async {
    try {
      final Response responsePokemon = await _dio.get('https://pokeapi.co/api/v2/pokemon?limit=10&offset=0');
      return (
        null,
        responsePokemon
      );
    } catch (e) {
      return (
        Exception(),
        null
      );
    }
  }

  @override
  Future<Result<Exception, Response>> getPokemonDetails({required String url}) async {
    final responsePokemonDetails = await _dio.get(url);
    return (
      null,
      responsePokemonDetails
    );
  }

  @override
  Future<Result<Exception, Response>> getGenderPokemon({required int id}) async {
    try {
      final Response responseGenderPokemon = await _dio.get('https://pokeapi.co/api/v2/gender/$id/');
      return (
        null,
        responseGenderPokemon
      );
    } catch (e) {
      return (
        null,
        null
      );
    }
  }
}
