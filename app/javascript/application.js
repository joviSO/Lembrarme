// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", () => {
    const checkboxes = document.querySelectorAll(".item-checkbox");

    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener("change", (event) => {
            const itemElement = event.target.closest(".item");
            const itemId = itemElement.dataset.id;
            const isChecked = event.target.checked;

            const description = itemElement.querySelector(".item-description");
            if (isChecked) {
                description.classList.add("checked");
            } else {
                description.classList.remove("checked");
            }

            fetch(`/items/${itemId}`, {
                method: "PATCH",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
                },
                body: JSON.stringify({ checked: isChecked }),
            }).then((response) => {
                if (!response.ok) {
                    console.error("Erro ao atualizar o item no servidor.");
                }
            });
        });
    });

    const flashMessage = document.getElementById("flash-message");

    if (flashMessage) {
        setTimeout(() => {
            flashMessage.style.transition = "opacity 0.5s ease-out";
            flashMessage.style.opacity = "0";

            setTimeout(() => flashMessage.remove(), 500);
        }, 2000);
    }
});