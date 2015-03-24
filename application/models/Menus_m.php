<?php

/**
 * Modele fournissant les données pour des listes déroulantes
 */
class Menus_m extends CI_Model {

    /** Fonction de base fournissant une liste de données
     * sous forme d'un tableau associatif value => text
     * (ex : (1 => "BTS SIO", 2 => "BTS IRIS")
     */
    protected function getMap($sql) {
        $query = $this->db->query($sql);
        $rows = $query->result_array();
        $result = array();
        foreach ($rows as $row) {
            $result[$row["value"]] = $row["text"];
        }
        return $result;
    }

    /** Sessions en cours sous forme d'un tableau associatif value => nom.
     * PAS TERMINE : prend toutes les sessions !
     */
    public function getSessionsEnCours() {
        $sql = "SELECT id_session AS value, nom AS text FROM session";
        return $this->getMap($sql);
    }

    /** Stagiaires de la session de id $idSession */
    public function getStagiaires($idSession) {
        $sql = "select id_personne AS value, concat(prenom, ' ', nom) AS text
                from stagiaire
                WHERE id_session = $idSession ";
        return $this->getMap($sql);
    }

}
