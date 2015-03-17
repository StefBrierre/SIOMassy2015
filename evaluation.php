<doctype <!DOCTYPE html>
<html>
    <head>
	<title></title>
        <link rel="stylesheet"type="text/css" href="styles/saisi.css" />
        <style>

                body { 
                    text-align: center; padding: 250px;
                    background : #ffffff;
                    color : #000;
                    margin : 250px;
                    padding : 0;}
                table, td, a {
                    color : #000;
                    font : normal normal 20px Verdana, Geneva, Roboto, Helvetica, sans-serif;}
              button{
                    background-color : steelblue;
                    border : black solid 1px;
                    color : #ffffff;
                    border-radius : 5px;
                    width : 70px;
                    padding-top : 5px;
                    padding-bottom : 5px;
                    text-align : center;
                    margin-top : 15px;}
         </style>
    </head>
    <body>
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
                    <table border="4">
                            <tr>
                                    <th>Nom</th>
                                    <th>Note</th>
                                    <th>Observation</th>
                            </tr>
        <?php
        // les lignes de la bd recuperees sont ecrites d'abord en dur
                $tabevaluation = array(
                        array("id"=>"1","prenom"=>"Joel"),
                        array("id"=>"2","prenom"=>"Marion",),
                        array("id"=>"3","prenom"=>"Stephanie"),
                        array("id"=>"4","prenom"=>"Néant")
                );
                // marchera aussi avec les lignes issues de la bd
                foreach ($tabevaluation as $ligne) {
                        $id = $ligne["id"];
                        $prenom = $ligne["prenom"];
                        echo "<tr>
                                        <td>$prenom</td>
                                        <td>
                                                <input type='number' min='0' max='20' step='0.1'name='notes[]'/>
                                                <input type='hidden' name='ids[]' value='$id'/>
                                                <input type='hidden' name='noms[]' value='$prenom'/>
                                                <input type='hidden' name='observation[]'/>
                                        </td>
                                </tr>";
                }
        ?>
                                <tr>
                                <!-- pour etaler la cellule sur 2 colonnes-->
                                        <td colspan="3" style="text-align: center;">
                                                <button type="submit">Valider</button>
                                                <button type="submit">Effacer</button>
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
                            <th>Obsevation</th>
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
    </body>
</html>