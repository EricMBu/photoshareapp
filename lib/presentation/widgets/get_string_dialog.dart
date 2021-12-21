import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';
import 'package:photoshare/application/common/typedefs.dart';

class GetStringDialog extends StatelessWidget {
  GetStringDialog({
    Key? key,
    required this.title,
    this.description,
    required this.onSubmit,
  }) : super(key: key);

  final String title;
  final String? description;
  final StringCallback onSubmit;

  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              const SizedBox(height: 8),
              FormBuilderTextField(
                name: 'input',
                controller: _textController,
                validator: FormBuilderValidators.required(context),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () => submit(),
                icon: const Icon(Icons.save),
                label: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState?.validate() ?? false) {
      onSubmit(_textController.text);
      Get.back();
    }
  }
}
