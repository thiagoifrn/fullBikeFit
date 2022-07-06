import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_bike_fit_pdf_gen_v01/models/setup_bike.dart';

class FormWidget extends StatefulWidget {
  final String titleForm;
  final ValueNotifier<SetupBike>? formNotifier;
  final ValueNotifier<dynamic>? formKeyValidate;
  const FormWidget(
      {Key? key,
      required this.titleForm,
      this.formNotifier,
      this.formKeyValidate})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController saddleHeight = TextEditingController();
  final TextEditingController saddleGap = TextEditingController();
  final TextEditingController saddleRecoil = TextEditingController();
  final TextEditingController saddleGapgAuntlets = TextEditingController();
  final TextEditingController saddleReachgAuntlets = TextEditingController();
  final TextEditingController reachgAuntlets = TextEditingController();
  final TextEditingController stackAuntlets = TextEditingController();
  var setupBike = SetupBike();

  SetupBike contructBike() {
    setupBike = setupBike.copyWith(
      saddleHeight: saddleHeight.text,
      saddleGap: saddleGap.text,
      saddleRecoil: saddleRecoil.text,
      saddleGapgAuntlets: saddleGapgAuntlets.text,
      saddleReachgAuntlets: saddleReachgAuntlets.text,
      reachgAuntlets: reachgAuntlets.text,
      stackAuntlets: stackAuntlets.text,
    );
    widget.formNotifier?.value = setupBike;
    widget.formKeyValidate?.value = formKey.currentState?.validate() ?? false;
    //widget.formNotifier?.notifyListeners();
    return setupBike;
  }

  @override
  void initState() {
    super.initState();
    saddleHeight.addListener(contructBike);
    saddleGap.addListener(contructBike);
    saddleRecoil.addListener(contructBike);
    saddleGapgAuntlets.addListener(contructBike);
    saddleReachgAuntlets.addListener(contructBike);
    reachgAuntlets.addListener(contructBike);
    stackAuntlets.addListener(contructBike);
  }

  @override
  void dispose() {
    super.dispose();
    saddleHeight.dispose();
    saddleGap.dispose();
    saddleRecoil.dispose();
    saddleGapgAuntlets.dispose();
    saddleReachgAuntlets.dispose();
    reachgAuntlets.dispose();
    stackAuntlets.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.titleForm,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Form(
          key: formKey,
          child: Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    TextFormField(
                      controller: saddleHeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "69,2 cm",
                        label: const Text(
                          'Altura do Selim',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      autofocus: false,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    TextFormField(
                      controller: saddleGap,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "43.2° ",
                        label: const Text(
                          'Desnível do Selim',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      autofocus: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  TextFormField(
                    controller: saddleRecoil,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "69,2 cm",
                      label: const Text(
                        'Recuo do Selim',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  TextFormField(
                    controller: saddleGapgAuntlets,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "43,2 cm",
                      label: const Text(
                        'Des. Selim/Manopla',
                        style: TextStyle(fontSize: 17),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  TextFormField(
                    controller: saddleReachgAuntlets,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "69,2 cm",
                      label: const Text(
                        'Alc. Selim/Manopla',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  TextFormField(
                    controller: reachgAuntlets,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "43,2 cm",
                      label: const Text(
                        'Reach Manopla',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  TextFormField(
                    controller: stackAuntlets,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "43,2 cm",
                      label: const Center(
                        child: Text(
                          'Reach Manopla',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    autofocus: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
