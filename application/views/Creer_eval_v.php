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
        <section>
            <header id = "creation_evaluation" method = "POST">
                <h1>Création d'une évaluation</h1>
            </header>
            
            <form method = "POST" id="formulaire_evaluation">
                <label id = "session"> Choisir la session concernée :</label>
                <?= form_dropdown('id_session', $sessions); ?>
                
                <label id="module">Choisir la session concernée</label>
                <?= form_dropdown('id_module', $module); ?>

                <label id = "date"> Choisir la date de l'évaluation :</label>
                <input type="text" name="dateevaluation" placeholder="Date de l'évaluation" data-beatpicker="true" data-beatpicker-position="['10','50']"  data-beatpicker-extra="customOptions" data-beatpicker-format="['YYYY','MM','DD'],separator:'/'" data-beatpicker-module="icon">

                    <script type="text/javascript">
                        customOptions = {
                            monthsFull: ["Janvier", "F\351vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao\373t", "Septembre", "Octobre", "Novembre", "D\351cembre"],
                            daysSimple: ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
                        }
                    </script>
                    
                    <input type="submit" name="ok" value="Valider">
                    <input type="reset" name="annulerSaisie" value="Annuler">
            </form>
        </section>


    </body>
</html>
