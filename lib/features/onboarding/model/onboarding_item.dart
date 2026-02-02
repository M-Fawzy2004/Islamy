class OnboardingItem {
  final String title;
  final String? description;
  final String mainImagePath;
  // Note: The Header Logo (Islami) seems constant, so we might not need it in the model,
  // but if it changes, we can add it here. For now, it's consistent.

  OnboardingItem({
    required this.title,
    this.description,
    required this.mainImagePath,
  });
}
