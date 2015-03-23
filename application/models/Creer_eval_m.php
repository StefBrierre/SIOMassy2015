<?php
class Creer_eval extends CI_Model{
    
    public function __construct() {
        parent::__construct();
        $this->load->database();
        
    }
    public function getSession($idModule) {
        $query = $this->db->query("SELECT id_session AS value, nom AS text FROM session");
        return $query->row_array();
        
    }
    
    public function getModule($idModule) {
        $query = $this->db->query("SELECT id_module AS value, nom AS text FROM module");
        return $query->row_array();
        
    }
    public function getFormateur($idPersonne) {
        $query = $this->db->query("SELECT f.id_personne AS value, nom AS text FROM personne p INNER JOIN formateur f ON p.id_personne = f.id_personne");
        return $query->row_array();
        
    }
    
    
}
