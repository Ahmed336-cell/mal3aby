import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/presentation/manager/data_fetch_cubit.dart';
import 'package:mal3aby/features/home/presentation/manager/pitchs_list_cubit.dart';
import 'package:mal3aby/features/home/presentation/manager/user_data_fetch_cubit.dart';

import 'core/utils/app_router.dart';
import 'features/auth/manager/auth_cubit/auth_cubit.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Mal3abyApp());
}

class Mal3abyApp extends StatelessWidget {
  const Mal3abyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthenticationCubit()),
        BlocProvider(create: (context)=>DataFetchingPitchsCubit()),
        BlocProvider(create: (context)=>DataFetchingCubit()),
        BlocProvider(create: (context)=>UserDataFetchCubit())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black54
        ),
      ),
    );
  }
}

