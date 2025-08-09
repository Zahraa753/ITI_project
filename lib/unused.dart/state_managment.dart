// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_application_1/controller/counter_cubit/cubit/counter_cubit.dart';

// class state_management extends StatefulWidget {
//   const state_management({super.key});

//   @override
//   State<state_management> createState() => _state_managementState();
// }

// class _state_managementState extends State<state_management> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CounterCubit(),
//       child: BlocBuilder<CounterCubit, CounterState>(
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//               title: const Text('State Management'),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: 200),
//                   const Text('You have pushed the button this many times:'),
//                   BlocBuilder<CounterCubit, CounterState>(
//                     builder: (context, state) {
//                       return Text(
//                         state.counter.toString(),
//                         style: Theme.of(context).textTheme.headlineMedium,
//                       );
//                     },
//                   ),
//                   SizedBox(height: 250),
//                   FloatingActionButton(
//                     onPressed: () {
//                       context.read<CounterCubit>().decrement();
//                     },
//                     tooltip: 'Decrement',
//                     child: const Icon(Icons.remove),
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 context.read<CounterCubit>().increment();
//               },
//               tooltip: 'Increment',
//               child: const Icon(Icons.add),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
