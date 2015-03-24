<?php

class Creer_eval extends CI_Controller {

  public function __construct() {
        parent::__construct();
        $this->load->model('Creer_eval_m');
    }
    
    public function Index() {
       $this->load->helper(array('form', 'url'));
       $data["sessions"] = $this->Creer_eval_m->getSessions();
       $this->load->view('Creer_eval_v', $data);
    }
    
    
    
}

     