import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}
final countProvider = StateProvider<int>((ref)=>0);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int counter = ref.watch(countProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Counter App"),
      ),
      body: Center(
        child: Text("$counter"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(countProvider.notifier).state++;
      }),
    );
  }
}


