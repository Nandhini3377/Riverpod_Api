import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/controller/quote_provider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(quotesProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: Text('Amazing Quotes',style: TextStyle(color: Colors.white),),
        ),
        body: data.when(
            data: (quote) {
              return ListView.builder(
                  itemCount: quote.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Material(
                        elevation: 3,
                        color: Colors.blue.shade100,
                        child: ListTile(
                          title: Text(quote[index].quote),
                          subtitle: Text("- " + quote[index].author),
                        ),
                      ),
                    );
                  });
            },
            error: (error, s) => Text("Error:$error"),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
