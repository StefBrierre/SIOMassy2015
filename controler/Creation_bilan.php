<?php
require_once 'fw/DB.php';
require_once 'fw/FormHelper.php';

$sql = "SELECT id_session AS value, nom AS text FROM session ORDER BY nom ASC";
$session = DB::getMap($sql);
?>

<label id = "session"> Choisir la session concernée :</label> 
<?php FormHelper::printSelect("id_session", $session) ?> 

<label id = "date"> Choisir la date du bilan :</label> 
<input type="text" name="datebilan" placeholder="Date du bilan" data-beatpicker="true" data-beatpicker-position="['10','50']"  data-beatpicker-extra="customOptions" data-beatpicker-format="['YYYY','MM','DD'],separator:'/'" data-beatpicker-module="icon"/>

<script type="text/javascript">
    customOptions = {
        monthsFull: ["Janvier", "F\351vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao\373t", "Septembre", "Octobre", "Novembre", "D\351cembre"],
        daysSimple: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
    }
</script>

<button type="submit">Valider</button>

</form>

<?php
require_once 'fw/DB.php';
require_once 'fw/FormHelper.php';

if (!empty($_POST)) {
    $id_session = $_POST['id_session'];
    $date = $_POST['datebilan'];


    $db = DB::getConnection();
    $sql = "INSERT INTO bilan (id_bilan, date, id_session) values (null, '$date', '$id_session')";
    $stmt = $db->prepare($sql);
    $stmt->execute();
}
?>

</section>

</main>

</body>

</html>