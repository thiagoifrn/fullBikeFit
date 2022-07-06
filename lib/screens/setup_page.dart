import 'package:flutter/material.dart';
import 'package:full_bike_fit_pdf_gen_v01/models/generated_pdf.dart';
import 'package:full_bike_fit_pdf_gen_v01/models/setup_bike.dart';
import 'package:full_bike_fit_pdf_gen_v01/screens/widgets/form_widget.dart';
import 'package:full_bike_fit_pdf_gen_v01/screens/widgets/header_widget.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({Key? key}) : super(key: key);

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int _currentStep = 0;
  int valueRadioButton = 0;
  var formKey;

  StepperType stepperType = StepperType.horizontal;
  final ValueNotifier<SetupBike> formPre =
      ValueNotifier<SetupBike>(SetupBike());
  final ValueNotifier<SetupBike> formPos =
      ValueNotifier<SetupBike>(SetupBike());
  late final ValueNotifier<dynamic> formPreValidade =
      ValueNotifier<dynamic>(dynamic);
  final ValueNotifier<dynamic> formPosValidade =
      ValueNotifier<dynamic>(dynamic);
  final GeneratedPDF generatedPDF = GeneratedPDF();

  @override
  void initState() {
    super.initState();
    formPre.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const HeaderWidget(),
                Expanded(
                  child: Stepper(
                    controlsBuilder: (context, continued) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            if (_currentStep != 0)
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                onPressed: () {
                                  _currentStep > 0
                                      ? setState(() => _currentStep -= 1)
                                      : null;
                                },
                                child: const Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text(
                                    'Voltar',
                                  ),
                                ),
                              ),
                            if (_currentStep != 2)
                              ElevatedButton(
                                onPressed: () {
                                  _currentStep < 2
                                      ? setState(() => _currentStep += 1)
                                      : null;
                                },
                                child: const Text(
                                  'Continue',
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                    type: stepperType,
                    physics: const ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: [
                      Step(
                        title: const Text('Pré-Fit'),
                        content: FormWidget(
                          titleForm: "Medidas Pré-Fit",
                          formNotifier: formPre,
                          formKeyValidate: formPreValidade,
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: const Text('Pós-Fit'),
                        content: FormWidget(
                          titleForm: "Medidas Pós-Fit",
                          formNotifier: formPos,
                        ),
                        isActive: _currentStep >= 1,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: const Text('Gerar relatório'),
                        content: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customRadioButton("MTB", 1),
                                    customRadioButton("Aero/Trials Bike", 2),
                                    customRadioButton("Road Bike ", 3)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: valueRadioButton == 0
                                    ? const Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 100.0, bottom: 100.0),
                                          child: Text(
                                            "Selecione um tipo de Bike",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Image.asset(
                                        'assets/bikes_images/${valueRadioButton.toString()}.png',
                                        width: 300,
                                        height: 300,
                                        fit: BoxFit.cover,
                                      ),
                              )
                            ],
                          ),
                        ),
                        isActive: _currentStep >= 2,
                        state: _currentStep >= 3
                            ? StepState.complete
                            : StepState.disabled,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: valueRadioButton != 0
              ? () {
                  generatedPDF.generatedPDFSetupBike(
                      param1: formPre.value, param2: formPos.value);
                }
              : null,
          backgroundColor: valueRadioButton != 0 ? Colors.red : Colors.grey,
          tooltip: 'Gerar PDF',
          child: const Icon(Icons.print),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          valueRadioButton = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: (valueRadioButton == index) ? Colors.red : Colors.black,
        ),
      ),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //borderSide: BorderSide(color: (value == index) ? Colors.green  : Colors.black),
    );
  }
}
