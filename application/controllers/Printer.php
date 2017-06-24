<?php

/**
 * NOTE: function name should be same as 
 * function name from Page Controller 
 * @author RoDave
 */
class Printer extends CI_Controller {
    
    public function __construct() {
        parent::__construct();
    }
    
    public function employee(){
        
        $test = $this->input->post();
        
        $this->load->library('wahrisys_AES');
    
        print_r(array(
            'data'  => $this->wahrisys_aes->decrypt($test['data_print']),
            'encrypted'   => $test['data_print']
        ));
        
    }
    
    
    private function page_render($page_name, $page_title, $data){
        
        $head = array (
            'company_name' => COMPANY_NAME,
            'page_name' => $page_title,
            'date' => date("F j, Y"),
        );
        
        $this->load->view('template_print/head', $head);
        $this->load->view('print/'.$page_name, $data);
        $this->load->view('template_print/footer'); 
    }
}
