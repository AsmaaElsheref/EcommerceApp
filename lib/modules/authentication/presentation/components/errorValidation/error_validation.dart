import 'package:flutter/material.dart';
import '../../../../../core/utils/color_resource/color_resource.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class ErrorValidation extends StatelessWidget {
  const ErrorValidation({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline,color: ColorResources.red,size: 15,),
          AppConstants.gapW5,
          CustomText(text: errorText,color: ColorResources.red,txtSize: 12,),
        ],
      ),
    );
  }
}
