window.onload = (e) => {
  showAlert();
}

function showAlert() {
  const alertContainer = document.querySelector("#alertContainer");

  if (alertContainer) {
    alertContainer.classList.add("show-from-top");
    setTimeout((function(e) {
      alertContainer.classList.remove("show-from-top");
    }), 3000);
  }
}