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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFead2c6),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios), color: const Color(0xFF44544b),
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    alignLabelWithHint: true,
                contentPadding: EdgeInsets.only(left: 10),
                                border: OutlineInputBorder(),
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
          const SizedBox(height: 8,),const Text('Age',
          style: TextStyle(fontSize: 16,
          fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.left,),
          const SizedBox(height: 20,),
          TextFormField(
                  decoration: const InputDecoration(
                    filled: false,
                    fillColor: Colors.transparent,
                    hintText: "Type here",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4d302a)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),                   
                  ),
                ),
                const SizedBox(height: 30,),
                const Text('Date of birth',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,),
                        const SizedBox(height: 20,),
                        Card(
                      color: Colors.white,
                      
                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color(0xFF4d302a))
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
                      backgroundColor: const Color(0xFF44544b), 
                    ),
                    child: const Text('Pick Date', style: TextStyle(color: Colors.white),),
                  ),
                  )
                  
                ],
              ),),
              const SizedBox(height: 30,),
              const Text('Enter your symptoms, e.g., headache, fatigue, fever.',
              style: TextStyle(fontSize: 16,
              fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.left,),
              const SizedBox(height: 20,),
              TextFormField(
                      decoration: const InputDecoration(
                        filled: false,
                        fillColor: Colors.transparent,
                        hintText: "Type here",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4d302a)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),                   
                      ),
                    ),
                    const SizedBox(height: 30,),
                    const Text('How long have you been experencing these symptoms?.',
                    style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,),
                    const SizedBox(height: 20,),
                    TextFormField(
                            decoration: const InputDecoration(
                              filled: false,
                              fillColor: Colors.transparent,
                              hintText: "Type here",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF4d302a)),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),                   
                            ),
                          ),
                const SizedBox(height: 30,),
                const Text('List any current medications you are currently taking.',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,),
                  const SizedBox(height: 20,),
                  TextFormField(
                          decoration: const InputDecoration(
                            filled: false,
                            fillColor: Colors.transparent,
                            hintText: "Type here",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF4d302a)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),                   
                          ),
                        ),
                        const SizedBox(height: 30,),
                          const Text('Do you have any known allergies? If yes, please list them below.',
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.left,),
                            const SizedBox(height: 20,),
                            TextFormField(
                                    decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.transparent,
                                      hintText: "Type here",
                                      hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF4d302a)),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),                   
                                    ),
                                  ),
                                  const SizedBox(height: 30,),
                          const Text('Are you currently taking any medications? If yes, please provide the details.',
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.left,),
                            const SizedBox(height: 20,),
                            TextFormField(
                                    decoration: const InputDecoration(
                                      filled: false,
                                      fillColor: Colors.transparent,
                                      hintText: "Type here",
                                      hintStyle: TextStyle(fontWeight: FontWeight.bold,),
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF4d302a)),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF86b7a4), width: 2.0), 
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF4d302a), width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),                   
                                    ),
                                  ),
                                    const SizedBox(height: 30,),
                          const Text('Do you do any physical activity?',
                          textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(height: 20,),
                            SingleChildScrollView( child: DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      hintText: 'Physical activity',
                                      alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.only(left: 10),
                                                  border: OutlineInputBorder(),
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
                      backgroundColor: const Color(0xFF44544b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(300, 70),
                    ),
                    child: const Text('Submit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                ),
        ],
      ),
      ),
      ),
    );
  }
}