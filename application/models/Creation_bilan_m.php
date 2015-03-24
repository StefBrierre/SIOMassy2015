<?php

class creation_bilan_m extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    /** Liste des sessions */
    public function getSessions() {
        $result = array();
        $query = $this->db->query('SELECT id_session, nom FROM session ORDER BY nom ASC');
        foreach ($query->result_array() as $row) {
            $result[$row["id_session"]] = $row["nom"];
        }
        return $result;
    }

    public function creation_bilan() {
        
    }

}
