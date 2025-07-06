import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: TextStyle(
            color: Colors.grey
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding:EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          )
        )
      ),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}
