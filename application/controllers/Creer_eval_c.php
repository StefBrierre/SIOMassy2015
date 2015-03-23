<?php
class Creer_eval_c extends CI_Controller {

    function get($id) {
        $this->load->model("Creer_eval_m");
        
        $data = $this->Creer_eval_m->get($id);
        
        $this->load->view("Creer_eval_v", $data);
                    
    }
    
    
    function do_post() {
    // Charge les outils pour les formulaires
    $this->load->helper('form');
    $this->load->library('form_validation');
    // Etablit les règles
    $this->form_validation->set_rules('id', 'Id', 'required|integer');
    // Modifie la forme des messages d'erreur
    $this->form_validation->set_error_delimiters('<span class="error">',
            '</span>');
    if (!$this->form_validation->run()) {
      // Il y a des erreurs => réafficher le formulaire
      $this->load->view('Creer_eval_v');
    } else {
      // Pas d'erreurs => suite du traitement
      $data['msg'] = "Choix enregistré";
      $this->load->view('Creer_eval_v', $data);
    }
  }
}

