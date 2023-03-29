import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/constants/global_verables.dart';
import 'package:amazon/features/admin/screens/admin_screens.dart';
import 'package:amazon/features/auth/screens/auth_screens.dart';
import 'package:amazon/features/auth/services/auth_service.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: const MyApp()));
  // runApp(const MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // ref.read(authServiceProvider.notifier).getUserData(context);
    fetchData();
  }

  void fetchData() async {
    await ref.read(authServiceProvider.notifier).getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    User? isLoading = ref.watch(authServiceProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
          // useMaterial3: true,
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        // home: ref.watch(userProvider)!.token.isNotEmpty
        //     ? ref.watch(userProvider)!.type == "user"
        //         ? const BottomBar()
        //         : const AdminScreen()
        //     : const AuthScreen());
        home: isLoading == null
            ? const Scaffold(
                body: Center(
                  child: const Loader(),
                ),
              )
            : ref.watch(userProviderFuture).when(
                  data: (data) {
                    return data!.token.isNotEmpty
                        ? data.type == 'user'
                            ? const BottomBar()
                            : const AdminScreen()
                        : const AuthScreen();
                  },
                  error: (error, stackTrace) => const Text('error'),
                  loading: () => const Loader(),
                ));
  }
}
