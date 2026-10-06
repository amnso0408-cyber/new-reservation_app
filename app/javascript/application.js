// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

document.addEventListener('turbo:load', function () {
  const button = document.querySelector('.user-menu-button');
  const dropdown = document.querySelector('.user-menu-dropdown');

  button.addEventListener('click', function () {
    dropdown.classList.toggle('active');
  });
});
