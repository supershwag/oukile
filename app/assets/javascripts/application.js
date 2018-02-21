//= require rails-ujs
//= require_tree .

const meetingButtonClick = document.getElementById("set-meeting")
const launchMeeting = meetingButtonClick.addEventListener("click", (event) => {
    event.currentTarget.innerText = "Bingo!";
    event.currentTarget.classList.add("disabled");
    audio.play();
  });
