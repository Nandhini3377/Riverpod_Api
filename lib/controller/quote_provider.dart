import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_api/model/quote.dart';


class QuoteProvider{

Future<List<Quote>> fetchQuotes() async {
   final res= await http.get(Uri.parse("https://dummyjson.com/quotes"));
   if(res.statusCode==200){
    final List<dynamic> jsonList = json.decode(res.body)['quotes'];
    return jsonList.map((json) => Quote.fromJson(json)).toList();

   }
   else{
throw Exception('Failed to load data');
   }
}
}

final quoteController=Provider<QuoteProvider>((ref) => QuoteProvider());

final quotesProvider = FutureProvider<List<Quote>>((ref) async {
  return ref.read(quoteController).fetchQuotes();
});