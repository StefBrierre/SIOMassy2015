<?php

class Creation_bilan extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Menus_m');
        $this->load->model('bilan_m');
    }

    public function index() {
        if ($this->input->server('REQUEST_METHOD') == "GET") {
            $this->load->helper(array('form', 'url'));
            $data["sessions"] = $this->Menus_m->getSessionsEnCours();
            $this->load->view('Creation_bilan_v', $data);
        } else {
            // valider les données
            // Charge les outils pour les formulaires
            $this->load->helper('form');
            $this->load->library('form_validation');
            // Etablit les règles
            $this->form_validation->set_rules('sessions', 'ID session', 'required|integer');
            $this->form_validation->set_rules('datebilan', 'date', 'required');
            // Modifie la forme des messages d'erreur
            $this->form_validation->set_error_delimiters('<span class="error">', '</span>');

            if (!$this->form_validation->run()) {
                // Il y a des erreurs => réafficher le formulaire
                $this->load->helper(array('form', 'url'));
                $data["sessions"] = $this->Menus_m->getSessionsEnCours();
                $this->load->view('Creation_bilan_v', $data);
            } else {
                // Pas d'erreurs => suite du traitement
                $data['msg'] = "Choix enregistré";
                $this->load->view('Creation_bilan_v', $data);
                // si ok, inserer en base
            }
        }
    }

}
