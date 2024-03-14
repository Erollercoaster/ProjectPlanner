// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.setFormMode("off")

document.addEventListener("DOMContentLoaded", () => {
  const openModalBtn = document.getElementById("open-modal-btn");
  const closeModalBtns = document.querySelectorAll(".close-modal-btn");
  const modal = document.getElementById("category-modal-form");

  openModalBtn.addEventListener("click", () => {
    modal.classList.remove("hidden");
  });

  closeModalBtns.forEach(btn => { 
    btn.addEventListener("click", () => {
      modal.classList.add("hidden");
    });
  });
});

document.addEventListener('DOMContentLoaded', function() {
  let completedTasks = JSON.parse(localStorage.getItem('completedTasks')) || [];

  completedTasks.forEach(taskId => {
    const taskRow = document.querySelector(`#task-row-${taskId}`);
    if (taskRow) {
      taskRow.classList.add('completed');
    }
  });

  document.addEventListener('click', function(event) {
    if (event.target.matches('input[type="checkbox"]')) {
      const taskId = event.target.dataset.taskId;
      const taskRow = document.querySelector(`#task-row-${taskId}`);
      if (taskRow) {
        if (event.target.checked) {
          taskRow.classList.add('completed');
          if (!completedTasks.includes(taskId)) {
            completedTasks.push(taskId);
          }
        } else {
          taskRow.classList.remove('completed');
          const index = completedTasks.indexOf(taskId);
          if (index !== -1) {
            completedTasks.splice(index, 1);
          }
        }
      }
      localStorage.setItem('completedTasks', JSON.stringify(completedTasks));
    }
  });
});
