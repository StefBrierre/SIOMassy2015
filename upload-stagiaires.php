<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    demander();
} else {
    traiter();
}

function demander() {
    ?>
    <h1>Import de stagiaires</h1>	
    <form enctype="multipart/form-data" action="" method="post">
        <!-- MAX_FILE_SIZE doit précéder le champ input de type file -->
        <input type="hidden" name="MAX_FILE_SIZE" value="30000" />
        <!-- Le nom de l'élément input détermine le nom dans le tableau $_FILES -->
        Fichier csv : <input name="stagiaires" type="file" />
        <input type="submit" value="Envoyer le fichier" />
    </form>
    <?php
}

function traiter() {
    $required = ['civilite', 'prenom', 'nom', 'adresse', 'code_postal', 'ville',
        'telephone', 'telephone2', 'email'];
    $autres = ["mot_passe", "date_inscription"];
    $filename = str_replace("\\", "/", $_FILES["stagiaires"]['tmp_name']);
    print "emplacement : $filename";

    if (($handle = fopen($filename, "r")) !== FALSE) {
        $fields = fgetcsv($handle, 0, ";");
    }

    for ($i = 0; $i < count($fields); $i++) {
        $fields[$i] = strtolower($fields[$i]);
    }

// Verifier que les requis sont la
    $manquants = array_diff($required, $fields);
    if (count($manquants) > 0) {
        die("Colonnes requises manquantes : " . join(", ", $manquants));
    }

//    // Ordre sql pour inserer
//    $cols = array_merge($required, $autres);
//    $params = $cols;
//    for ($i = 0; $i < count($params); $i++) {
//        $params[$i] = ":" . $params[$i];
//    }
//    $sCols = join(", ", $cols);
//    $sParams = join(", ", $params);
//    $sql = "INSERT INTO personne($sCols) VALUES ($sParams)";
//    die("<p>$sql</p>");

    $sql = "INSERT INTO personne(civilite, prenom, nom, adresse, code_postal, ville,
            telephone, telephone2, email, mot_passe, date_inscription)
            VALUES (:civilite, :prenom, :nom, :adresse, :code_postal, :ville,
            telephone, :telephone2, :email, :mot_passe, :date_inscription)";
    print "<p>$sql</p><ol>";
    
    while ($data = fgetcsv($handle, 0) !== FALSE) {
        print "<li>" . count($data) . "</li>";
    }
    fclose($handle);
    die();


    try {
        $db = getConnexion();



        ;
        // ligne des noms de champs
        $count = $db->exec($sql);
        print "$count lignes affectées";
    } catch (PDOException $e) {
        print $e->getMessage
                ();
    }
}

/** Fournit une connection à la base test, en UTF-8 */
function getConnexion() {
    $dsn = 'mysql:dbname=db524752934;host=127.0.0.1';
    $user = 'root';
    $password = '';
    $bdd = new PDO($dsn, $user, $password);
    // Forcer la communication en utf-8
    $bdd->exec("SET character_set_client = 'utf8'");
    return $bdd;
}
?>
