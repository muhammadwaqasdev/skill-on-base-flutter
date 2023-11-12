# skill_on_base

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


ColorScheme(
brightness: Brightness.light,
primary: AppColors.primary,
onPrimary: AppColors.white,
primaryContainer: ,
onPrimaryContainer: ,
secondary: AppColors.secondary,
onSecondary: AppColors.white,
secondaryContainer: ,
onSecondaryContainer: ,
tertiary: ,
onTertiary: ,
tertiaryContainer: ,
onTertiaryContainer: ,
error: AppColors.red,
onError: AppColors.white,
errorContainer: ,
onErrorContainer: ,
background: AppColors.white,
onBackground: AppColors.white,
surface: AppColors.white,
onSurface: AppColors.primary,
surfaceVariant: ,
onSurfaceVariant: ,
outline: ,
shadow: ,
inverseSurface: ,
onInverseSurface: ,
inversePrimary: ,
surfaceTint: ,
)


flutter pub run easy_localization:generate -S "assets/translations" -O "lib/generated"
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/generated" -o "local_keys.g.dart" -f keys