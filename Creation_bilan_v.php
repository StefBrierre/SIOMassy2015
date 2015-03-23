<?php 
    
    echo validation_errors();
    echo form_open('Creation_bilan_v');

?>

<html>
    
    <head>
        
        <link rel="stylesheet" type="text/css" href="../items/css/BeatPicker.min.css"/>
			
	<!--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script> -->
	
	<script type="text/javascript" src = "../items/js/jquery.1.8.3.js"></script>
	
	<script type="text/javascript" src="../items/js/BeatPicker.min.js"></script>
        
    </head>
    
    <body>
        
        <form id="liste_session" method="POST">
        
            <select>

                <option id = "session" value = ""></option>

            </select>    

            <input type="text" name="datebilan" placeholder="Date du bilan" data-beatpicker="true" data-beatpicker-position="['10','50']"  data-beatpicker-extra="customOptions" data-beatpicker-format="['YYYY','MM','DD'],separator:'/'" data-beatpicker-module="icon"/>

            <script type="text/javascript">
                customOptions = {
                        monthsFull : ["Janvier", "F\351vrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Ao\373t", "Septembre", "Octobre", "Novembre", "D\351cembre"],
                        daysSimple : ["Di", "Lu", "Ma", "Me", "Je", "Ve", "Sa"],
                }
            </script>

            <button type="submit">Valider</button>
            
        </form>
        
    </body>
    
</html>
