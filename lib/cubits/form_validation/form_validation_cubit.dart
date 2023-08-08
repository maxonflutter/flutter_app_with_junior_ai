part 'form_validation_state.dart';

class FormValidationCubit extends Cubit<FormValidationState> {

  FormValidationCubit() : super(const FormValidationState());

  void validateFormField(String fieldName, String fieldValue) {
    try {
      // Validate the form field here
      // If validation fails, throw an error
      emit(state.copyWith(formFields: state.formFields..[fieldName] = fieldValue));
    } catch (e) {
      // Handle validation error
      emit(state.copyWith(formFields: state.formFields..remove(fieldName)));
    }
  }

  void validateForm() {
    try {
      // Validate the entire form here
      // If validation fails, throw an error
      emit(state.copyWith(isFormValid: true));
    } catch (e) {
      // Handle validation error
      emit(state.copyWith(isFormValid: false));
    }
  }

  void updateFormField(String fieldName, String fieldValue) {
    // Update the form field here
    emit(state.copyWith(formFields: state.formFields..[fieldName] = fieldValue));
  }

  void resetForm() {
    // Reset the form here
    emit(const FormValidationState());
  }
}