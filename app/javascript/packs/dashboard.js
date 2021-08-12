window.onload = (e) => {
  showAlert();
}
const alertContainer = document.querySelector("#alertContainer");

function showAlert() {

  if (alertContainer) {
    showFlash();
    setTimeout((function(e) {
      hideFlash();
    }), 3000);
  }
}


function showFlash() {
  alertContainer.classList.add("show-from-top");
  
  document.querySelector("#btnCloseFlash").onclick = function(e) {
   hideFlash();
  }

}
function hideFlash() {
  alertContainer.classList.remove("show-from-top");
}
