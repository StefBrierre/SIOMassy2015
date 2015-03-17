<html>
    <head>

        <title>Création d'une évaluation</title>

        <link rel = "stylesheet" type = "text/css" href = "items/css/BeatPicker.min.css"/>

<!--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script> -->

        <script type="text/javascript" src = "items/js/jquery.1.8.3.js"></script>

        <script type = "text/javascript" src = "items/js/BeatPicker.min.js"></script>

    </head>

    <style>
        body { text-align: center; padding: 150px; }
    </style>
    <body>

        <h1>Création d'une évaluation</h1>

        <form method="post" action="">

            <div class="row">

                <?php
                require_once 'fw/DB.php';
                require_once 'fw/FormHelper.php';

                $sql = "SELECT id_session AS value, nom AS text FROM session";
                $session = DB::getMap($sql);
                ?>
                <form>
                    Session : <?= FormHelper::printSelect("id_session", $session) ?>

                </form>


            </div>

            <div class="row">
                <?php
                $sql = "SELECT id_module AS value, nom AS text FROM module";
                $module = DB::getMap($sql);
                ?>
                <form>
                    Module : <?= FormHelper::printSelect("id_module", $module) ?>

                </form>
            </div>

            <div class="row">
                <?php
                // A VERIFIER POUR AFFICHER LE FORMATEUR AVEC L'ID DE LA PERSONNE
                //$sql = "SELECT id_personne AS value, nom AS text FROM formateur";
                $sql = "SELECT f.id_personne AS value, nom AS text FROM personne p INNER JOIN formateur f ON p.id_personne = f.id_personne";
                $formateur = DB::getMap($sql);
                ?>
                <form>
                    Formateur : <?= FormHelper::printSelect("id_personne", $formateur) ?>

                </form>
            </div>

            <div class="row">

                <label> Date de l'évaluation</label>

                <input type="text" name="dateevaluation" placeholder="Date de l'évaluation" data-beatpicker="true" data-beatpicker-position="['10','50']"  data-beatpicker-extra="customOptions" data-beatpicker-format="['YYYY','MM','DD'],separator:'/'" data-beatpicker-module="icon">

                <script type="text/javascript">
                    customOptions = {
                        monthsFull: ["Janvier", "F\351vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao\373t", "Septembre", "Octobre", "Novembre", "D\351cembre"],
                        daysSimple: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
                    }
                </script>

            </div>

            <div class="row">

                <input type="submit" name="ok" value="Valider">
                <input type="reset" name="annulerSaisie" value="Annuler">

            </div>

        </form>

    </body>
</html>
