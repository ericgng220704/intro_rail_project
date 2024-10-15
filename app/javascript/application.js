// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
document.addEventListener("DOMContentLoaded", () => {
  const hamburger = document.getElementById('hamburger');
  const mobileNav = document.getElementById('mobile-nav');

  hamburger.addEventListener('click', () => {
    mobileNav.classList.toggle('hidden');
  });
});
