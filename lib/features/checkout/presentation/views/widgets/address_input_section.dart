import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.name = value!;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.address = value!;
                },
                hintText: 'العنوان',
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 16.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.city = value!;
                },
                hintText: 'المدينة',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.adressDetails =
                      value!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              CustomFormTextField(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.phoneNumber =
                      value!;
                },
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
