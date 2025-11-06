import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({super.key});

  @override
  State<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> with TickerProviderStateMixin {
  String? selectedGoal;
  final TextEditingController _customGoalController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<NutritionGoal> _goals = [
    NutritionGoal(
      title: 'Boost Immunity',
      description: 'Strengthen your immune system with nutrient-rich foods',
      icon: Icons.shield_outlined,
      color: const Color(0xFF4CAF50),
    ),
    NutritionGoal(
      title: 'Weight Management',
      description: 'Achieve and maintain your ideal weight',
      icon: Icons.monitor_weight_outlined,
      color: const Color(0xFF2196F3),
    ),
    NutritionGoal(
      title: 'Digestive Health',
      description: 'Improve gut health and digestion',
      icon: Icons.spa_outlined,
      color: const Color(0xFF9C27B0),
    ),
    NutritionGoal(
      title: 'Energy Boost',
      description: 'Enhance your daily energy and vitality',
      icon: Icons.bolt_outlined,
      color: const Color(0xFFFF9800),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _customGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Nutrition Plan',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: theme.colorScheme.primary),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(theme),
                const SizedBox(height: 32),
                _buildGoalSelection(theme),
                const SizedBox(height: 32),
                _buildCustomGoalSection(theme),
                const SizedBox(height: 40),
                _buildGenerateButton(theme),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary.withOpacity(0.1),
            theme.colorScheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.restaurant_menu,
              size: 32,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personalized Nutrition',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Get a customized meal plan tailored to your health goals',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalSelection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Goal',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Choose what you want to achieve with your nutrition plan',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 20),
        ...List.generate(
          _goals.length,
          (index) => _buildGoalCard(
            _goals[index],
            theme,
            index,
          ),
        ),
      ],
    );
  }

  Widget _buildGoalCard(NutritionGoal goal, ThemeData theme, int index) {
    final isSelected = selectedGoal == goal.title;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = goal.title;
          _customGoalController.clear();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? goal.color.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? goal.color : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: goal.color.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isSelected
                    ? goal.color.withOpacity(0.2)
                    : goal.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                goal.icon,
                size: 28,
                color: goal.color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goal.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? goal.color : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    goal.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isSelected
                  ? Icon(
                      Icons.check_circle,
                      color: goal.color,
                      size: 28,
                      key: const ValueKey('selected'),
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: Colors.grey[400],
                      size: 28,
                      key: const ValueKey('unselected'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomGoalSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Or Set a Custom Goal',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Tell us your specific nutrition goal',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _customGoalController.text.isNotEmpty
                  ? theme.colorScheme.primary
                  : Colors.grey[300]!,
              width: _customGoalController.text.isNotEmpty ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: _customGoalController,
            maxLines: 4,
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  selectedGoal = null;
                }
              });
            },
            decoration: InputDecoration(
              hintText: 'E.g., "Build muscle mass while staying lean" or "Manage diabetes through diet"',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(20),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(
                  Icons.edit_note,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
            ),
            style: theme.textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget _buildGenerateButton(ThemeData theme) {
    final hasSelection = selectedGoal != null || _customGoalController.text.isNotEmpty;
    
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: hasSelection
            ? () {
                // TODO: Handle generate plan
                final goal = selectedGoal ?? _customGoalController.text;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Generating plan for: $goal'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          elevation: hasSelection ? 6 : 0,
          shadowColor: theme.colorScheme.primary.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              color: hasSelection ? Colors.white : Colors.grey[500],
            ),
            const SizedBox(width: 12),
            Text(
              'Generate My Nutrition Plan',
              style: TextStyle(
                color: hasSelection ? Colors.white : Colors.grey[500],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionGoal {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  NutritionGoal({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
  