// Your JavaScript code

document.addEventListener("DOMContentLoaded", function () {
  const questionContainer = document.getElementById("question-container");
  const timerCountdown = document.getElementById("timer-countdown");
  const submitAnswersButton = document.getElementById("submit-answers-button");
  const nextButton = document.getElementById("next-button");
  const textFields = document.querySelectorAll(".form-control");

  let currentQuestionIndex = 0;
  const questionElements = document.querySelectorAll(".qs-item");
  let timer;

  function startTimer(durationInSeconds) {
    let timerValue = durationInSeconds;
    updateTimerDisplay(timerValue);

    timer = setInterval(function () {
      timerValue--;
      updateTimerDisplay(timerValue);

      if (timerValue <= 0) {
        clearInterval(timer);
        showNextQuestion();
      }
    }, 1000);
  }

  function updateTimerDisplay(seconds) {
    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = seconds % 60;
    timerCountdown.textContent = `${minutes}:${remainingSeconds < 10 ? "0" : ""}${remainingSeconds}`;
  }

  function showQuestion(index) {
    questionElements.forEach((element, i) => {
      if (i === index) {
        element.classList.remove("hidden"); // Remove the "hidden" class
      } else {
        element.classList.add("hidden"); // Add the "hidden" class to hide others
      }
    });
    currentQuestionIndex = index;
    nextButton.disabled = textFields[currentQuestionIndex].value === "";
  }

  function showNextQuestion() {
    if (currentQuestionIndex < questionElements.length - 1) {
      showQuestion(currentQuestionIndex + 1);
      startTimer(600);
    } else {
      clearInterval(timer);
      submitAnswersButton.click();
    }
  }

  function handleInput() {
    nextButton.disabled = textFields[currentQuestionIndex].value === "";
  }

  startTimer(600);
  nextButton.addEventListener("click", showNextQuestion);
  textFields[currentQuestionIndex].addEventListener("input", handleInput);
  showQuestion(currentQuestionIndex);
});
