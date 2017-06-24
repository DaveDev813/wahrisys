<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of User
 *
 * @author RoDave
 */
class User extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
        if ($this->session->has_userdata('ID')) {

            redirect('home', 'refresh');
        }

        $this->load->view('template_main/head');
        $this->load->view('pages/login');
        $this->load->view('template_main/footer');
    }

    public function authenticate() {

        $return = array('result' => FALSE);

        $username = $this->input->post('username');
        $password = $this->input->post('password');

        if (!empty($username) and ! empty($password)) {
            $this->load->model('Users');
            $users = (array) $this->Users->get_user($username, $password);
            if ($users) {

                $this->session->set_userdata($users);

                $return['result'] = TRUE;
                $return['rawData'] = $users;
            }
        }

        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($return));
    }

    public function logout() {

        $this->session->sess_destroy();

        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode(array('result' => TRUE)));
    }

    public function check_session() {

        if ($this->session->has_userdata('ID')) {
            $return = true;
        } else {
            $return = false;
        }
        
        $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode(array('result' => $return)));
    }

}
