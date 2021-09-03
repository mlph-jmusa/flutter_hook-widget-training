import 'package:exercise_hook_widget/apps/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Generic method for HomeViewModel listener
T useChangeNotifierListener<T extends ChangeNotifier>(T data) {
  final state = useState<T>(data);
  return useListenable(state.value);
}

// Display the UI for HomeViewModel data
class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeViewModel listener instance
    final homeChangeNotifier = useChangeNotifierListener(HomeChangeNotifier());

   return Scaffold(
     appBar: AppBar(title: const Text('Home')),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(
             'You have pushed the button this many times:',
           ),
           Text(
             // Get current data of the counter from HomeViewModel
             '${homeChangeNotifier.increment}',
             style: Theme.of(context).textTheme.headline4,
           ),
         ],
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: () async {
         // Execute incrementing method from HomeViewModel with listener
         _incrementCounter(homeChangeNotifier);
       },
       tooltip: 'Increment',
       child: Icon(Icons.add),
     ),
   );
  }

  // Method to call the increment method for incrementing counter
  Future<void> _incrementCounter(HomeChangeNotifier homeChangeNotifier) async {
    homeChangeNotifier.reloadState();
  }
}