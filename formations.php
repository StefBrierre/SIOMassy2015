<?php
require_once 'fw/DB.php';
require_once 'fw/FormHelper.php';

$sql = "SELECT id_formation AS value, nom AS text FROM formation";
$formations = DB::getMap($sql);
?>
<form>
  Formation : <?= FormHelper::printSelect("id_formation", $formations) ?>
  <button type="submit">Valider</button>
</form>

<table border=1" cellpadding="2" cellspacing="0">
  <caption>Formations</caption>
  <tr>
    <th>Id</th>
    <th>Nom</th>
  </tr>
  <?php
  foreach ($formations as $formation) {
    print "<tr><td>$formation[value]</td><td>$formation[text]</td></tr>";
  }
  ?>
</table>