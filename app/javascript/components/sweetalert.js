import swal from 'sweetalert';
function bindSweetAlertButtonDemo() {
  const sweetBtns = document.querySelectorAll('.sweet-alert-button');
  sweetBtns.forEach((btn) => {
    btn.addEventListener('click', () => {
    swal({
      title: "Il s'appel revient.",
      text: "Ton rendez-vous est confirmé!",
      icon: "success"
      })
    });
  });
}

export { bindSweetAlertButtonDemo };


