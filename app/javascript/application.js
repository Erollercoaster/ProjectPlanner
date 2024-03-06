// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.setFormMode("off")

// app/javascript/packs/application.js
document.addEventListener("DOMContentLoaded", () => {
  const openModalBtn = document.getElementById("open-modal-btn");
  const closeModalBtns = document.querySelectorAll(".close-modal-btn");
  const modal = document.getElementById("category-modal-form"); // Change this line

  openModalBtn.addEventListener("click", () => {
    modal.classList.remove("hidden");
  });

  closeModalBtns.forEach(btn => { 
    btn.addEventListener("click", () => {
      modal.classList.add("hidden");
    });
  });
});