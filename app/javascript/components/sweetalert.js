import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.querySelector('.sweet-alert-button').addEventListener('click', () => {
    swal({
      title: "A nice alert",
      text: "This is a great alert, isn't it?",
      icon: "success"
    })
  });
}

export { bindSweetAlertButtonDemo };
