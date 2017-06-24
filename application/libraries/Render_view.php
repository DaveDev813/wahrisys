<?php

/**
 * Description of Render_view
 *
 * @author RoDave
 */
class Render_view {
    
    private $CI;
    
    private $userAccess = NULL;
    
    public function __construct() {
        
        $this->CI =& get_instance();
        
        if ($this->CI->session->has_userdata('ID')) {

            $this->userAccess = $this->CI->session->userdata('ID');        
        }
        
        $this->CI->load->helper('debugging');
    }
    
    public function page_render($page_name = null, $table_name = null, $addOutput = null) {
        
        $this->CI->load->library('grocery_CRUD');
        
        $isContent = $this->CI->input->post('isContent');

        $output = array();

        if ( !is_null($table_name) ) {

            $this->CI->grocery_crud->set_table($table_name);

            $output = (array) $this->CI->grocery_crud->render();
            
        }

        if (!is_null($addOutput)) {

            $output = array_merge($output, $addOutput);
        }

        $state = $this->CI->grocery_crud->getState();
        
        if ( $state == 'read' ){
            
            $state_info = $this->CI->grocery_crud->getStateInfo();
            
            $primary_key = $state_info->primary_key;
            
            $this->CI->load->library('wahrisys_AES');
            
//            $print_data = $table_name.'|'.$primary_key;
            $print_data = 'qwertyuiopasdfgh';
            
            $output = array_merge($output, array( 'print_data' => $this->CI->wahrisys_aes->encrypt($print_data) ));
            
        }
        
        func_write($output, 'CRUD_output');
        
        if (!$isContent) {
            $navData = $this->navData();
            $this->CI->load->view('template_main/head', $output);
            $this->CI->load->view('template_main/navbars', array('navData' => $navData));
            $this->CI->load->view('pages/' . $page_name, $output);
            $this->CI->load->view('template_main/footer', $output);
        } else {
            $this->CI->load->view('pages/' . $page_name, $output);
        }
    }
    
    private function navData() {
        
        /**
         * Dashboard
         */
        $count = 0;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Dashboard',
                'icon' => 'fa fa-dashboard fa-fw',
                'href' => 'home',
            );
        }
                
        /**
         * Profile
         */
        $count = 1;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Profile',
                'icon' => 'glyphicon glyphicon-user',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Employee 201 File',
                'icon' => '',
                'href' => 'Profile/employee',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Client',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][2] = array(
                'name' => 'Employer',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /**
         * Payments
         */
        $count = 2;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Payments',
                'icon' => 'fa fa-rouble',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Contributions',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0]['third_level'][0] = array(
                'name' => 'HDMF / Pag-Ibig',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0]['third_level'][1] = array(
                'name' => 'PHIC / PhilHealth',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Loans',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][0] = array(
                'name' => 'HDMF / Pag-Ibig',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /**
         * Payroll
         */
        $count = 3;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Payroll',
                'icon' => 'glyphicon glyphicon-tasks',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Transaction',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Settings',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][0] = array(
                'name' => 'Change Entry date',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][1] = array(
                'name' => 'Change Payroll Period',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /**
         * Reports Tab
         */
        $count = 4;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Reports',
                'icon' => 'glyphicon glyphicon-stats',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => '13th Month Pay',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Certificate of Income Tax',
                'icon' => '',
                'href' => '#',
            );
        }
        
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][2] = array(
                'name' => 'Home Devt. Mutaual Fund',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][3] = array(
                'name' => 'PhilHealth / Medicard',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][4] = array(
                'name' => 'Pre-Computed Tax Due',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][5] = array(
                'name' => 'Remittances Summary',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][6] = array(
                'name' => 'Social Security System (SSS)',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][4] = array(
                'name' => 'Withholding Tax',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /**
         * Billing and Collection
         */
        $count = 5;
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Billing and Collection',
                'icon' => 'glyphicon glyphicon-piggy-bank',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Billing Statement',
                'icon' => '',
                'href' => 'BillingAndCollection/statement',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Billing Summary',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][2] = array(
                'name' => 'Collection Monitoring',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /**
         * Administrator
         */
        $disallow = array();
        $count = 6;
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Admin',
                'icon' => 'glyphicon glyphicon-wrench',
                'href' => '#',
            );
        }
        
        $disallow = array();
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'System Calendar Settings',
                'icon' => '',
                'href' => '#',
            );
        }
        
        /*
         * For Developers
         */
        
        $count = 7;
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'System Tester',
                'icon' => 'fa fa-cog fa-fw',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Blank One',
                'icon' => '',
                'href' => 'Page/BlankOne',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Blank Two',
                'icon' => '',
                'href' => 'Page/BlankTwo',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][2] = array(
                'name' => 'Nav Tabs',
                'icon' => '',
                'href' => 'Page/navtabs',
            );
        }

        $count = 8;
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count] = array(
                'name' => 'Multi-level Dropdown',
                'icon' => 'fa fa-sitemap fa-fw',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][0] = array(
                'name' => 'Second Level Item 1',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1] = array(
                'name' => 'Second Level Item 2',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][0] = array(
                'name' => 'Third Level Item 1',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][1] = array(
                'name' => 'Third Level Item 2',
                'icon' => '',
                'href' => '#',
            );
        }
        
        $disallow = array(0,1,2,3,4);
        if (!in_array($this->userAccess, $disallow)){
            $nav[$count]['second_level'][1]['third_level'][2] = array(
                'name' => 'Third Level Item 3',
                'icon' => '',
                'href' => '#',
            );
        }
               
        return $nav;
    }
    
    
}
