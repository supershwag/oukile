function showTab(event) {

  const tabs = document.querySelectorAll('.tab');
  const body = document.querySelector('user-show-details')

  function changeClass(event) {
    const targetDetails = this.dataset.section;
    const activeTab = document.querySelector('.tabs .active');
    const makeActiveDetails = document.querySelector(`.user-show-details[data-section="${targetDetails}"]`);
    const makeHiddenDetails = document.querySelector(`.user-show-details[data-section="${activeTab.dataset.section}"]`);
    this.classList.toggle("active");
    activeTab.classList.toggle("active");
    makeActiveDetails.classList.toggle("hidden");
    makeHiddenDetails.classList.toggle("hidden");
  };

  tabs.forEach(tab => tab.addEventListener("click", changeClass));
};

export { showTab }
