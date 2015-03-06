<?php 
if ($_SERVER["REQUEST_METHOD"] == "GET") {
	demander();
}
else {
	traiter();
}

function demander() {
?>
<form method="post">
	<table border="1">
		<tr>
			<th>Nom</th>
			<th>Note</th>
		</tr>
<?php
// les lignes de la bd recuperees sont ecrites d'abord en dur
	$tabevaluation = array(
		array("id"=>"1","prenom"=>"Joel"),
		array("id"=>"2","prenom"=>"Marion"),
			array("id"=>"1","prenom"=>"Stephanie")
	);
	// marchera aussi avec les lignes issues de la bd
	foreach ($tabevaluation as $ligne) {
		$id = $ligne["id"];
		$prenom = $ligne["prenom"];
		echo "<tr>
				<td>$prenom</td>
				<td>
					<input type='number' name='notes[]'/>
					<input type='hidden' name='ids[]' value='$id'/>
					<input type='hidden' name='noms[]' value='$prenom'/>
				</td>
			</tr>";
	}
?>
			<tr>
			<!-- pour etaler la cellule sur 2 colonnes-->
				<td colspan="2" style="text-align: center;">
					<button type="submit">Valider</button>
				</td>
			</tr>
		</table>
	</form>
<?php
}

function traiter() {
?>
<table border = 1>
	<tr>
		<th>Nom</th>
		<th>Notes</th>
		<th>Observations</th>
	</tr>
<?php
	$ids = $_POST["ids"];
	$noms = $_POST["noms"];
	$notes = $_POST["notes"];
	$nb = count($ids);
	for ($i=0 ; $i < $nb ; $i++) {
		echo "
		<tr>
			<td>$noms[$i]</td>
			<td>$notes[$i]</td>
		</tr>
		";
	}
?>

</table>
<?php 
}
?>