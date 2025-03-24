// Sélectionne le bouton et le body
const themeToggle = document.getElementById('theme-toggle');
const body = document.body;

// Vérifie si un thème est déjà enregistré dans le localStorage
const savedTheme = localStorage.getItem('theme');
if (savedTheme) {
    body.classList.add(savedTheme);
    updateButtonText();
}

// Ajoute un écouteur d'événement sur le bouton
themeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-theme');
    updateButtonText();
    // Sauvegarde le thème dans le localStorage
    const currentTheme = body.classList.contains('dark-theme') ? 'dark-theme' : '';
    localStorage.setItem('theme', currentTheme);
});

// Fonction pour mettre à jour le texte du bouton
function updateButtonText() {
    if (body.classList.contains('dark-theme')) {
        themeToggle.textContent = 'Mode Clair';
    } else {
        themeToggle.textContent = 'Mode Sombre';
    }
}






// Sélectionne le formulaire
const contactForm = document.querySelector('#contact form');

// Ajoute un écouteur d'événement pour la soumission du formulaire
contactForm.addEventListener('submit', (event) => {
    // Empêche la soumission par défaut du formulaire
    event.preventDefault();

    // Sélectionne les champs du formulaire
    const name = document.getElementById('name');
    const email = document.getElementById('email');
    const message = document.getElementById('message');

    // Vérifie si les champs sont vides
    if (name.value.trim() === '' || email.value.trim() === '' || message.value.trim() === '') {
        alert('Veuillez remplir tous les champs du formulaire.');
    } else {
        alert('Formulaire soumis avec succès !');
        // Réinitialise le formulaire après soumission
        contactForm.reset();
    }
});