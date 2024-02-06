import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
 
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 226, 80, 128) )),
        
      
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 0;
  int weight = 15;
  int age = 3;
  bool isLightMode = true; // Add this variable to track the mode
  late Color femalecardColor;
  late Color malecardColor ;
  var gender = 'none';
  String comment = 'none';
  double bmi = 0;
  String detail = 'bmi not calculated yet';
  
  

  void addWeight() {
    setState(() {
      weight += 1;
    });
  }

  void removeWeight() {
    setState(() {
      weight -= 1;
    });
  }

  void addAge() {
    setState(() {
      age += 1;
    });
  }

  void removeAge() {
    setState(() {
      age -= 1;
    });
  }

  double calculateBMI() {
    bmi = weight / ((height / 100) * (height / 100));
    return bmi;
  }

  String getComment(double bmi) {
    if (bmi < 18.5) {
      return comment = "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return comment = "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return comment = "Overweight";
    } else if (bmi >= 30) {
      return comment = "Obese";
    } else {
      return comment = "Unknown";
    }
  }

  void toggleMode() {
    setState(() {
      isLightMode = !isLightMode;
    });
  }

  Color getMaleCardColor() {
    return gender == 'male'
        ? Color.fromARGB(255, 161, 199, 221)
        : (isLightMode ? Colors.white : Color.fromARGB(151, 32, 55, 68));
  }

  Color getFemaleCardColor() {
    return gender == 'female'
        ? Color.fromARGB(255, 231, 171, 191)
        : (isLightMode ? Colors.white : Color.fromARGB(151, 32, 55, 68));
  }

  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    malecardColor= getMaleCardColor();
    femalecardColor= getFemaleCardColor();

    return MaterialApp(
      theme: isLightMode ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: isLightMode ? Color.fromARGB(255, 241, 241, 240): Colors.black,

        appBar: AppBar(
          backgroundColor: isLightMode ? Color.fromARGB(189, 54, 149, 238):Color.fromARGB(232, 3, 25, 43),
          title:  Text(
            "BMI Calculator",
            style: TextStyle(color:  Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: toggleMode,
              icon: Icon(
                isLightMode ? Icons.nightlight_round : Icons.wb_sunny,
                color:  Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          
                          gender = 'male';
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.4,
                        child: Card(
                          color: malecardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: screenWidth * 0.2,
                                color: isLightMode ? Colors.black : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    color:  isLightMode ? Colors.black : Color.fromARGB(255, 160, 153, 153),
                                    fontSize: screenHeight * 0.018,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          femalecardColor = Color.fromARGB(255, 226, 80, 128);
                          malecardColor = isLightMode? Colors.white : Color.fromARGB(151, 32, 55, 68);
                          gender = 'female';
                        });
                      },
                      child: Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.4,
                        child: Card(
                          color: femalecardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female_outlined,
                                size: screenWidth * 0.2,
                                color:  isLightMode ? Colors.black : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  color: isLightMode ?Colors.black : Color.fromARGB(255, 160, 153, 153),
                                   fontSize: screenHeight * 0.018,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.20,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  color: isLightMode ? Colors.white : Color.fromARGB(151, 32, 55, 68),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text(
                      "Height (cm)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isLightMode ? Colors.black : Color.fromARGB(255, 160, 153, 153),),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "$height",
                      style: TextStyle(
                          color: isLightMode ?Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.035),
                    ),
                    Slider(
                      value: height,
                      label: height.toString(),
                      max: 200,
                      min: 0,
                      activeColor: Color.fromARGB(189, 54, 149, 238),
                      
                      divisions: 200,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.4,
                    child: Card(
                      color: isLightMode ? Colors.white : Color.fromARGB(151, 32, 55, 68),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Text(
                            "Weight (kg)",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isLightMode ?Colors.black : Color.fromARGB(255, 160, 153, 153),),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '$weight',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isLightMode ?Colors.black : Colors.white,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    removeWeight();
                                  },
                                  icon: Icon(
                                      Icons.remove_circle_outlined,
                                      size: screenWidth * 0.08,
                                      color: isLightMode? Colors.black : Color.fromARGB(255, 160, 153, 153))),
                              IconButton(
                                  onPressed: () {
                                    addWeight();
                                  },
                                  icon: Icon(
                                      Icons.add_circle_outlined,
                                      size: screenWidth * 0.08,
                                      color: isLightMode? Colors.black : Color.fromARGB(255, 160, 153, 153)))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.4,
                    child: Card(
                      color: isLightMode ? Colors.white : Color.fromARGB(151, 32, 55, 68),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isLightMode ?Colors.black : Color.fromARGB(255, 160, 153, 153),),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: isLightMode ?Colors.black : Colors.white,),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    removeAge();
                                  },
                                  icon: Icon(
                                      Icons.remove_circle_outlined,
                                      size: screenWidth * 0.08,
                                      color: isLightMode? Colors.black : Color.fromARGB(255, 160, 153, 153))),
                              IconButton(
                                  onPressed: () {
                                    addAge();
                                  },
                                  icon: Icon(
                                      Icons.add_circle_outlined,
                                      size: screenWidth * 0.08,
                                      color: isLightMode? Colors.black : Color.fromARGB(255, 160, 153, 153)))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                  getComment(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          elevation: 0,
                          backgroundColor: isLightMode
                              ? const Color.fromARGB(255, 49, 49, 49)
                              : const Color.fromARGB(255, 49, 49, 49),
                          content: Container(
                            height: screenHeight * 0.4,
                            width: screenWidth * 0.5,
                            color: isLightMode
                                ? const Color.fromARGB(255, 49, 49, 49)
                                : const Color.fromARGB(255, 49, 49, 49),
                            child: Column(
                              children: [
                                Text(
                                  "Your BMI",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.025,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: screenHeight * 0.07),
                                Text(
                                  comment,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 40, 152, 156),
                                      fontSize: screenHeight * 0.03),
                                ),
                                SizedBox(height: screenHeight * 0.03),
                                Text(
                                  bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.05),
                                ),
                                SizedBox(height: screenHeight * 0.04),
                                SizedBox(height: screenHeight * 0.05),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(screenWidth * 0.5, screenHeight * 0.06),
                                        backgroundColor: Color.fromARGB(189, 54, 149, 238),),
                                    child: Text(
                                      "close",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: screenHeight * 0.03,
                                          color: Colors.black),
                                    ))
                              ],
                            ),
                          ),
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                     backgroundColor: isLightMode ? Color.fromARGB(189, 54, 149, 238): const Color.fromARGB(255, 49, 49, 49),
                    fixedSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)) ),
                child: Text(
                  'Calculate',
                  style: TextStyle(color:  Colors.white, fontSize: screenHeight * 0.025),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
