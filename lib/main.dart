import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/main_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MainProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage.provider(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static ChangeNotifierProvider provider() {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: const MyHomePage(),
    );
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<MainProvider>().getImageUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MainProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Image.network(
                      value.imgUrl,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.abc),
                    ),
                    IconButton(
                      onPressed: () {
                        value.getImageUrl();
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
