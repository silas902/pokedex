// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokemon/app/home_page/repository/pokemon_repository.dart';

class GetPokemonUserCase {
  late IPokemonRepository _repository;
  GetPokemonUserCase({
    required final IPokemonRepository repository,
  }) {
    _repository = repository;
  }
  call() async {
    try {
      final response = await _repository.getPokemons();
    } catch (e) {}
  }
}
