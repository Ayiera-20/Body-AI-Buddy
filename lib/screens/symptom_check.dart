import 'package:flutter/material.dart';

class SymptomCheck extends StatefulWidget {
  const SymptomCheck({super.key});

  @override
  State<SymptomCheck> createState() => _SymptomCheckState();
}

class _SymptomCheckState extends State<SymptomCheck> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  String? activityLevel;
  String? gender;
  DateTime? dateOfBirth;
  
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _currentMedicationsController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

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
    _ageController.dispose();
    _symptomsController.dispose();
    _durationController.dispose();
    _medicationsController.dispose();
    _allergiesController.dispose();
    _currentMedicationsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        dateOfBirth = picked;
      });
    }
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
          'Symptom Checker',
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(theme),
                  const SizedBox(height: 32),
                  _buildSection(
                    theme: theme,
                    title: 'Personal Information',
                    icon: Icons.person_outline,
                    children: [
                      _buildDropdownField(
                        theme: theme,
                        label: 'Gender',
                        icon: Icons.wc,
                        value: gender,
                        items: ['Male', 'Female', 'Other'],
                        onChanged: (value) => setState(() => gender = value),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        theme: theme,
                        controller: _ageController,
                        label: 'Age',
                        icon: Icons.calendar_today,
                        hint: 'Enter your age',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      _buildDateField(theme),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSection(
                    theme: theme,
                    title: 'Symptom Details',
                    icon: Icons.medical_services_outlined,
                    children: [
                      _buildTextField(
                        theme: theme,
                        controller: _symptomsController,
                        label: 'Your Symptoms',
                        icon: Icons.sick_outlined,
                        hint: 'e.g., headache, fatigue, fever',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        theme: theme,
                        controller: _durationController,
                        label: 'Duration',
                        icon: Icons.access_time,
                        hint: 'How long have you experienced these symptoms?',
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSection(
                    theme: theme,
                    title: 'Medical History',
                    icon: Icons.history_edu_outlined,
                    children: [
                      _buildTextField(
                        theme: theme,
                        controller: _medicationsController,
                        label: 'Current Medications',
                        icon: Icons.medication_outlined,
                        hint: 'List any medications you are taking',
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        theme: theme,
                        controller: _allergiesController,
                        label: 'Known Allergies',
                        icon: Icons.warning_amber_outlined,
                        hint: 'List any allergies (if none, write "None")',
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSection(
                    theme: theme,
                    title: 'Lifestyle',
                    icon: Icons.fitness_center_outlined,
                    children: [
                      _buildDropdownField(
                        theme: theme,
                        label: 'Physical Activity Level',
                        icon: Icons.directions_run,
                        value: activityLevel,
                        items: [
                          'Sedentary (Little or no exercise)',
                          'Lightly Active',
                          'Moderately Active',
                          'Very Active',
                          'Extremely Active',
                        ],
                        onChanged: (value) => setState(() => activityLevel = value),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildSubmitButton(theme),
                  const SizedBox(height: 24),
                ],
              ),
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
              Icons.healing,
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
                  "Let us know how you're feeling",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Describe your symptoms to get personalized health insights',
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

  Widget _buildSection({
    required ThemeData theme,
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  Widget _buildTextField({
    required ThemeData theme,
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(icon, color: theme.colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required ThemeData theme,
    required String label,
    required IconData icon,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: theme.colorScheme.primary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
            hint: Text(
              'Select $label',
              style: TextStyle(color: Colors.grey[400]),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: dateOfBirth != null
                  ? theme.colorScheme.primary
                  : Colors.grey[300]!,
              width: dateOfBirth != null ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.cake_outlined,
              color: theme.colorScheme.primary,
            ),
            title: Text(
              dateOfBirth == null
                  ? 'Select Date of Birth'
                  : '${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}',
              style: TextStyle(
                color: dateOfBirth == null ? Colors.grey[400] : Colors.black87,
                fontWeight: dateOfBirth != null ? FontWeight.w600 : null,
              ),
            ),
            trailing: ElevatedButton.icon(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_month, size: 18),
              label: const Text('Pick Date'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // TODO: Handle submit
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Analyzing your symptoms...'),
                behavior: SnackBarBehavior.floating,
                backgroundColor: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: theme.colorScheme.primary.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.analytics_outlined),
            const SizedBox(width: 12),
            Text(
              'Analyze My Symptoms',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}