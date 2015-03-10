<html>
    <head>
        
        <title>Création d'une évaluation</title>
        
        <link rel = "stylesheet" type = "text/css" href = "items/css/BeatPicker.min.css"/>
        
        <!--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script> -->
        
        <script type="text/javascript" src = "items/js/jquery.1.8.3.js"></script>
		
        <script type = "text/javascript" src = "items/js/BeatPicker.min.js"></script>
        
    </head>
    <body>
        <h1>Création d'une évaluation</h1>

        <form method="post" action="">

            <div class="row">

                <label>Session</label>

                <select name="session">
                    <option value="sioSlam1415">BTS SIO SLAM 2014-2015</option>
                    <option value="sioSisr1415">BTS SIO SISR 2014-2015</option>
                    <option value="blabla">BLA BLA BLA</option>
                    <option value="bloblo">BLO BLO BLO</option>
                </select> 
            </div>

            <div class="row">
                <label>Module</label>

                <select name="module">
                    <option value="mathematiques">Mathématiques</option>
                    <option value="Francais">Français</option>
                    <option value="lalala">La la la</option>
                    <option value="lololo">Lo lo lo</option>
                </select> 
            </div>

            <div class="row">
                <label>Formateur</label>

                <select name="formateur">
                    <option value="mr_martin">Mr Martin</option>
                    <option value="mme_martine">Mme Martine</option>
                    <option value="mlle_durant">Mlle Durant</option>
                    <option value="mr_dupont">Mr Dupont</option>
                </select> 
            </div>

            <div class="row">

                <label> Date de l'évaluation</label>
                
                <input type="text" name="dateevaluation" placeholder="Date de l'évaluation" data-beatpicker="true" data-beatpicker-position="['10','50']"  data-beatpicker-extra="customOptions" data-beatpicker-format="['YYYY','MM','DD'],separator:'/'" data-beatpicker-module="icon">
                
                <script type="text/javascript">
			customOptions = {
				monthsFull : ["Janvier", "F\351vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao\373t", "Septembre", "Octobre", "Novembre", "D\351cembre"],
				daysSimple : ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
			}
		</script>

            </div>

            <div class="row">

                <input type="submit" name="ok" value="Valider">

            </div>

        </form>

    </body>
</html>
