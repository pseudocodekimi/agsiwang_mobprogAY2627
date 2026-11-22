import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const AgsiwangFacebook());
}

class AgsiwangFacebook extends StatelessWidget {
  const AgsiwangFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facebook Replication',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1877F2)),
          scaffoldBackgroundColor: const Color(0xFFF7F4FA),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
