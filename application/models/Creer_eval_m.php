<?php
class Creer_eval_m extends CI_Model{
    
    public function __construct() {
        parent::__construct();
        $this->load->database();
        
    }
    public function getSessions() {
        $result = array();
        $query = $this->db->query('SELECT id_session, nom FROM session ORDER BY nom ASC');
        foreach ($query->result_array() as $row) {
            $result[$row["id_session"]] = $row["nom"];
        }
        return $result;
    }
}
    
//    public function getSession() {
//        $query = $this->db->query("SELECT id_session AS value, nom AS text FROM session");
//        return $query->row_array();
//        
//    }
//    public function getModule($idSession) {
//        $query = $this->db->query("SELECT id_module AS value, nom AS text FROM module");
//        return $query->row_array();
//        
//    }
//    public function getFormateur($idPersonne) {
//        $query = $this->db->query("SELECT f.id_personne AS value, nom AS text FROM personne p INNER JOIN formateur f ON p.id_personne = f.id_personne");
//        return $query->row_array();
//        
//    }
//    
    

