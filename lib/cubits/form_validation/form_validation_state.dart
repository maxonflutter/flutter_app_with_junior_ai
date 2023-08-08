part of 'form_validation_cubit.dart';

enum FormValidationStatus {
  valid,
  invalid,
}

class FormValidationState {
  const FormValidationState({
    this.formFields = const {},
    this.isFormValid = false,
  });

  final Map<String, String> formFields;
  final bool isFormValid;

  FormValidationState copyWith({
    Map<String, String>? formFields,
    bool? isFormValid,
  }) {
    return FormValidationState(
      formFields: formFields ?? this.formFields,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }

  @override
  List<Object?> get props => [formFields, isFormValid];
}