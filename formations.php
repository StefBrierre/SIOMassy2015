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