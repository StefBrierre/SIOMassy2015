<?php

class Bulletin_notes extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
        $this->load->model('Bulletin_notes_m');
    }

    public function index() {
        $this->load->view('Bulletin_notes_v');
    }
}