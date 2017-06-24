<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of BillingAndCollection
 *
 * @author RoDave
 */
class BillingAndCollection extends KR_Kairho{
    
    public function __construct() {
        parent::__construct();
    }
    
    public function statement(){
        
        // Sample
        $this->grocery_crud->set_crud_url_path(site_url(__CLASS__ . '/' . __FUNCTION__));
        
        $this->render_view->page_render('blankOne', 'employees');
    }
}
