import 'package:flutter/material.dart';

class SymptomCheck extends StatefulWidget {
  const SymptomCheck({super.key});

  @override
  State<SymptomCheck> createState() => _SymptomCheckState();
}

class _SymptomCheckState extends State<SymptomCheck> {
  String? activityLevel;
  String? gender;
  DateTime? incidentDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != incidentDate) {
      setState(() {
        incidentDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Symptoms Checker',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: theme.colorScheme.primary),
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const Text("Let us know how you're feeling", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 4,),
          const Text('Describe your symptoms here', style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 20,),
          DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    alignLabelWithHint: true,
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),         
                              ),
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => gender = value,
                  validator: (value) => value == null ? 'Please select your gender' : null,
                ),
                const SizedBox(height: 20,),
          const SizedBox(height: 8,),const Text('Age',
          style: TextStyle(fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 112, 107, 107),
          ),
          textAlign: TextAlign.left,),
          const SizedBox(height: 20,),
          TextFormField(
                  decoration: const InputDecoration(
                    filled: false,
                    fillColor: Colors.transparent,
                    hintText: "Type here",
                    hintStyle: TextStyle(),
                    border:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),                   
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Date of birth',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 112, 107, 107),
                  ),
                  textAlign: TextAlign.left,),
                        const SizedBox(height: 20,),
                        Card(
                      color: Colors.white,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.grey)
                      ),
            child: Row(
                children: [
                  Padding(padding: const EdgeInsets.all(10),
                  child:   Text(
                    incidentDate == null
                        ? 'Select Date of Birth'
                        : 'Incident Date: ${incidentDate!.toLocal()}'.split(' ')[0],
                  ),),
                  const Spacer(),
                  Padding(padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Pick Date', style: TextStyle(color: Colors.white)),
                  ),
                  )
                  
                ],
              ),),
              const SizedBox(height: 30,),
              const Text('Enter your symptoms, e.g., headache, fatigue, fever.',
              style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 112, 107, 107)
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height: 20,),
              TextFormField(
                      decoration: const InputDecoration(
                        filled: false,
                        fillColor: Colors.transparent,
                        hintText: "Type here",
                        hintStyle: TextStyle(),
                        border:  OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),                   
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text('How long have you been experencing these symptoms?',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 112, 107, 107),
                    ),
                    textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Colors.transparent,
                              hintText: "Type here",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),                   
                            ),
                          ),
                const SizedBox(height: 30,),
                const Text('List any current medications you are currently taking.',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 112, 107, 107),
                  ),
                  textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  TextFormField(
                          decoration: const InputDecoration(
                            filled: false,
                            fillColor: Colors.transparent,
                            hintText: "Type here",
                            border:  OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),                   
                          ),
                        ),
                        const SizedBox(height: 30,),
                          const Text('Do you have any known allergies? If yes, please list them below.',
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 112, 107, 107),
                            ),
                            textAlign: TextAlign.center,),
                            const SizedBox(height: 20,),
                            TextFormField(
                                    decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.transparent,
                                      hintText: "Type here",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),                   
                                    ),
                                  ),
                                  const SizedBox(height: 30,),
                          const Text('Are you currently taking any medications? If yes, please provide the details.',
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 112, 107, 107),
                            ),
                            textAlign: TextAlign.center,),
                            const SizedBox(height: 20,),
                            TextFormField(
                                    decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.transparent,
                                      hintText: "Type here",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),                   
                                    ),
                                  ),
                                    const SizedBox(height: 30,),
                          const Text('Do you do any physical activity?',
                          textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 112, 107, 107),
                            ),),
                            const SizedBox(height: 20,),
                            SingleChildScrollView( child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                       border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                      focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                      enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),      
                                      hintText: 'Physical activity',
                                      alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.only(left: 10),
                                                ),
                                    items: [
                                      'Sedentary (Little or no exercise)',
                                      'Lightly Active',
                                      'Moderately Active',
                                      'Very Active',
                                      'Extremely Active',
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) => activityLevel = value,
                                    validator: (value) => value == null ? 'Please select your gender' : null,
                                  ),),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const Home() ));
              // ();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      ),
      ),
    );
  }
}