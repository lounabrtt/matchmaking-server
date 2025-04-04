<?php
// Connexion à la base de données
$host = 'localhost';
$dbname = 'matchmaking';
$user = 'root';
$password = ''; // Laisse vide si t’es en local avec XAMPP

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

// Vérifie si le pseudo a été envoyé
if (isset($_POST['pseudo']) && !empty($_POST['pseudo'])) {
    $pseudo = htmlspecialchars($_POST['pseudo']);

    // Insère le joueur dans la base
    $stmt = $pdo->prepare("INSERT INTO joueurs (pseudo) VALUES (:pseudo)");
    $stmt->execute(['pseudo' => $pseudo]);

    echo "Bienvenue $pseudo ! Tu es en file d’attente.";
} else {
    echo "Veuillez entrer un pseudo valide.";
}
?>
