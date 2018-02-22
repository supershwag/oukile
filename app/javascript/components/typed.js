import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Mon doudou", "Les clés de ma maison", "Mon bâtard de chien", "Mes lunettes de vue"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
