<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of page
 *
 * @author RoDave
 */
class Page extends KR_KaiRho {
    
    public function __construct() {
        parent::__construct();
    }

    public function index() {

        $this->render_view->page_render('dashboard');
    }

    /*
     * Tester
     */

    public function blankOne() {

        $this->grocery_crud->set_crud_url_path(site_url(__CLASS__ . '/' . __FUNCTION__));
        
        $this->render_view->page_render('blankOne', 'employees');
    }

    public function blankTwo() {
        
        $feilds = array();

        $form_structure = array(
            "Panel Header" => array(
                "bankcode", "bankname"
            )
        );

        foreach($form_structure as $feild){
            $feilds = array_merge($feilds, $feild);
        }

        $this->render_view->page_render('blankTwo', 'bank', array('form_structure' => json_encode(array_reverse($form_structure))));

    }
    
    public function navtabs(){
        
    }

    public function tester() {

        $this->load->library('wahrisys_AES');
        $enc = $this->wahrisys_aes->encrypt('burat');
        print_r(array(
            'encrypt' => $enc,
            'decrypt' => $this->wahrisys_aes->decrypt($enc),
        ));

    }
}
