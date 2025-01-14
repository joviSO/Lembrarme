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

    const switchToSignup = document.getElementById("switchToSignup");
    const switchToLogin = document.getElementById("switchToLogin");
    const modalContent = document.getElementById("authModalContent");

    switchToSignup.addEventListener("click", (e) => {
        e.preventDefault();
        modalContent.style.transform = "translateX(-50%)";
    });

    switchToLogin.addEventListener("click", (e) => {
        e.preventDefault();
        modalContent.style.transform = "translateX(0)";
    });

    function toggleChecked(itemId, currentChecked) {
        fetch(`/items/${itemId}/toggle_checked`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ checked: !currentChecked }) // Inverte o estado
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const itemDiv = document.querySelector(`[data-id="${itemId}"]`);
                    const button = itemDiv.querySelector("button");
                    const span = itemDiv.querySelector("span");

                    button.textContent = data.checked ? "Desmarcar" : "Marcar";
                    button.className = data.checked ? "btn btn-sm ms-2 btn-secondary" : "btn btn-sm ms-2 btn-primary";

                    if (data.checked) {
                        span.classList.add("text-decoration-line-through", "text-muted");
                    } else {
                        span.classList.remove("text-decoration-line-through", "text-muted");
                    }
                } else {
                    alert("Não foi possível atualizar o item.");
                }
            })
            .catch(err => console.error("Erro ao alterar o estado do item:", err));
    }
});