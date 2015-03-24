<?php

class Creation_bilan extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Creation_bilan_m');
    }

    public function index() {
        $this->load->helper(array('form', 'url'));
        $data["sessions"] = $this->Creation_bilan_m->getSessions();
        $this->load->view('Creation_bilan_v', $data);
    }

}
