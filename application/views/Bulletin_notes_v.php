<html>
    <head>
        <link rel="stylesheet" type="text/css" href="items/css/allproject.css"/>
        <title>Affichage d'un bulletin de notes</title>
    </head>
    <body>
        <main>
            <section>
                <header id = "bulletin">
                    <a href = "index.php"><img alt="logo" src="items/images/banniere.jpg"/></a>
                    <h1 id = "diplome">Diplome préparé VARIABLE</h1>
                    <p id = "annee">Année : VARIABLE</p>
                    <p id = 'semestre'>Semestre : <input type = 'radio' name = 'semestre' value ="1"/>1er<input type = 'radio' name = 'semestre' value ="2"/>2nd</p>
                    <p id = "nom">Prénom Nom : VARIABLE</p>
                    <p id = "date">Date de naissance : VARIABLE</p>
                </header>
                <table id = "notes">
                    <thead>
                        <tr>
                            <th id = 'matiere' rowspan="2">Matières</th>
                            <th id = 'enseignant' rowspan="2">Nom des enseignants</th>
                            <th id = 'stagiaire' rowspan="2">Moyennes du stagiaire</th>
                            <th colspan="3">Moyennes du groupe</th>
                            <th id = 'commentaire' rowspan="2">Commentaires</th>
                        </tr>
                        <tr>
                            <th class = 'moyenne'> - < </th>
                            <th class = 'moyenne'>Moyenne</th>
                            <th class = 'moyenne'> > + </th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th colspan="2">Moyenne générale</th>
                            <th>VARIABLE</th>
                            <th></th>
                            <th>VARIABLE</th>
                            <th colspan="2"></th>
                        </tr>
                    </tfoot>
                    <tbody>

                        <!-- A partir de la, TR et TD générés automatiquement -->

                    </tbody>
                </table>
                <table id = "appréciation">
                    <thead>
                        <tr>
                            <th>Appréciation globale</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <table id = "signature">
                    <thead>
                        <tr>
                            <th>Cachet et signature du responsable d'établissement</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </body>
</html>

