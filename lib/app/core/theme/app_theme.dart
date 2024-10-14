import 'package:breeds/app/core/constans/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData ligth() => ThemeData(
        fontFamily: "Poppins",
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.secondary, // Color del cursor
          selectionHandleColor:
              AppColors.secondary, // Color de los handles de selección
          selectionColor: AppColors.secondary, // Color del texto seleccionado
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.tertary,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.secondary,
              width: 2,
            ), // Borde cuando el campo está enfocado
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ), // Borde cuando el campo no está enfocado
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
            ), // Borde predeterminado
          ),
          labelStyle: const TextStyle(
            color: AppColors
                .secondary, // Color de la etiqueta cuando está enfocada
          ),
          hintStyle: const TextStyle(
            color:
                AppColors.onSecondary, // Color del hint (texto de sugerencia)
          ),
          prefixIconColor: AppColors.secondary,
          suffixIconColor: AppColors.secondary,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: AppColors.primary,
          onSurface: AppColors.onPrimary,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w500),
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500),
        ),
      );
}
