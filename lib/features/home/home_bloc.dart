import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<FetchImages>(_onFetchImages);
  }

  Future<void> _onFetchImages(FetchImages event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));
    try {
      final response = await http.get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=10'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final images = data.map<Map<String, dynamic>>((img) => {
          'url': img['download_url'],
          'title': img['author'],
          'width': img['width'],
          'height': img['height'],
        }).toList();
        emit(state.copyWith(images: images, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false, error: 'Failed to fetch images'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
