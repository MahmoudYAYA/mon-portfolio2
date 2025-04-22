<?php
require 'index.php, inscriptions.php';
try {
    $dbco = new PDO('mysql:host=localhost;formulaires', 'root', 'root');
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Préparez la requête SQL
    $sth = $dbco->prepare("INSERT INTO users(nom, prenom) VALUES(:nom, :prenom)");
    $sth->bindParam(':nom', $name);
    $sth->bindParam(':prenom', $prenom);
    $sth->execute();
}
catch(PDOException $e) {
    echo 'Erreur : ' . $e->getMessage();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['user_name'];
    $email = $_POST['user_prenom'];
    echo "Nom : $name <br>";
    echo "prenom : $prenom <br>";
}
?>