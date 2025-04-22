 // Validation du formulaire
 const form = document.getElementById("contact-form");
 const successMessage = document.getElementById("success-message");

 form.addEventListener("submit", (e) => {
   e.preventDefault();

   const nom = document.getElementById("nom").value.trim();
   const email = document.getElementById("email").value.trim();
   const message = document.getElementById("message").value.trim();

   if (nom && email && message) {
     successMessage.classList.remove("hidden");
     form.reset();
   } else {
     alert("Veuillez remplir tous les champs.");
   }
 });

 
  const hamburgerMenu = document.getElementById('hamburgerMenu'); 
  const navigation = document.querySelector('.navigation');
  
  hamburgerMenu.addEventListener('click', () => {
    navigation.classList.toggle('active');
  });

