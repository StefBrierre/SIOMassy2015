<?php
if ($_SERVER["REQUEST_METHOD"] == "GET") {
	demander();
}
else {
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
	// $filename = str_replace("\\", "/", $_FILES["stagiaires"]['tmp_name']);
	// print "emplacement : $filename";
	// print "<br/>";
	// $content = file_get_contents($filename);
	// print "<pre>$content</pre>";
	try {
		$db = getConnexion();
		// $sql = 
			// "LOAD DATA INFILE '$filename' 
			// INTO TABLE personne
			// FIELDS TERMINATED BY ';'
			// LINES TERMINATED BY '\r\n'
			// IGNORE 1 LINES;"; // ligne des noms de champs
    $sql = "SELECT * FROM personne";
		$count = $db->exec($sql);
		print "$count lignes affectées";
	}
	catch (PDOException $e) {
		print $e->getMessage();
	}
}	

/** Fournit une connection à la base test, en UTF-8 */
function getConnexion() {
	$dsn = 'mysql:dbname=db524752934;host=db524752934.db.1and1.com';
	$user = 'dbo524752934';
	$password = 'Greta2014';
	$bdd = new PDO($dsn, $user, $password);
	// Forcer la communication en utf-8
	$bdd->exec("SET character_set_client = 'utf8'");
	return $bdd;
}

?>