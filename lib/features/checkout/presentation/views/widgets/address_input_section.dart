import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24.0),
          CustomFormTextField(
            hintText: 'الاسم كامل',
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 16.0),
          CustomFormTextField(
            hintText: 'البريد الإلكتروني',
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.0),
          CustomFormTextField(
            hintText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
          ),
          SizedBox(height: 16.0),
          CustomFormTextField(
            hintText: 'المدينة',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 16.0),
          CustomFormTextField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          CustomFormTextField(
            hintText: 'رقم الهاتف',
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
