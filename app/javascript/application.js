// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"



const questionContainer = document.getElementById("question-container");
    const timerCountdown = document.getElementById("timer-countdown");
    const submitAnswersButton = document.getElementById("submit-answers-button");
    const nextButton = document.getElementById("next-button");
    const textFields = document.querySelectorAll(".form-control");

    let currentQuestionIndex = 0;
    const questionElements = questionContainer.querySelectorAll(".qs-item");
    let timer;

    function startTimer(durationInSeconds) {
        let timerValue = durationInSeconds;
        updateTimerDisplay(timerValue);

        timer = setInterval(function() {
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
        for (let i = 0; i < questionElements.length; i++) {
            questionElements[i].style.display = "none";
        }
        questionElements[index].style.display = "block";
        currentQuestionIndex = index;
        nextButton.disabled = textFields[index].value === "";
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


// app/assets/javascripts/application.js

