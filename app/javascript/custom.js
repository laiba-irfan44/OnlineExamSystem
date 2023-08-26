document.addEventListener('DOMContentLoaded', function() {
  // Your JavaScript code here
  $(document).on('change', '#question_type', function () {
    if ($(this).val() === 'text') {
      $('#text_question_form').show();
      $('#mcqs_question_form').hide();
    } else if ($(this).val() === 'mcq') {
      $('#text_question_form').hide();
      $('#mcqs_question_form').show();
    } else {
      console.log("Kuch ni bhae chlrha")
      $('#text_question_form').hide();
      $('#mcqs_question_form').hide();
    }
  });
});
