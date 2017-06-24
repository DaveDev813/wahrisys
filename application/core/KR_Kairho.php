<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * This is where all computations and business logic are set
 *
 * @author RoDave
 */
class KR_Kairho extends CI_Controller {
    
    protected $userAccess = FALSE;
    
    public function __construct() {
        parent::__construct(); 
        
        if (!$this->session->has_userdata('ID')) {

            redirect('login', 'refresh');
            
        }else{
            
            $this->userAccess = $this->session->userdata('ID');
        }
        
        $this->load->library('grocery_CRUD');
        $this->load->library('Render_view');
    }
    
    
}
