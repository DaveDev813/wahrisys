<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of Profile
 *
 * @author RoDave
 */
class Profile extends KR_Kairho {

    public function __construct() {
        parent::__construct();
    }

    public function employee() {

        $this->load->model('M_employee');

        if ($this->input->post('printer')) {
            
        } else {
            
            // Get Form Structure
            $data_feilds = $this->M_employee->form_structure();
            $form_structure = $data_feilds["form_structure"];
            
            // Set Feild Alias / Display As
            $this->M_employee->feild_alias();
            
            // RULES
            $this->grocery_crud
                ->set_rules('FNAME', 'First Name', 'required')
                ->set_rules('LNAME', 'Last Name', 'required');
            
            // Columns on Grid
            $this->grocery_crud     
                ->columns(array('EMPNO', 'FNAME', 'MNAME', 'LNAME'));
            
            // Set Relations
            $this->grocery_crud        
                ->set_primary_key('employerid', 'employer')
                ->set_relation('EMPLOYER', 'employer', 'employername')
                ->set_relation('CSCODE', 'civilstatus', 'CivilStatus');
            
            // Call Backs
            $this->grocery_crud
                    ->callback_before_insert(array($this, 'employee_before_send'));
            
            // Custom Insert Feilds
            $this->grocery_crud
                ->callback_add_field('Gender', function () {
                    return '<div class="radio">
                                <label><input type="radio" name="gender" value="male">Male</label>
                            </div>
                            <div class="radio">
                                <label><input type="radio" name="gender" value="female">Female</label>
                            </div>';
                })
                ->callback_add_field('Filipino', function () {
                    return '<input type="checkbox" name="isFilipino" id="isFilipino" value="1" checked>';
                })
                ->callback_add_field('pag-IBIG_Computed', function () {
                    return '<input type="checkbox" name="is_pag_ibig_computed" id="is_pag_ibig_computed" value="1">';
                })
                ->callback_add_field('with_Bond_Deposit', function () {
                    return '<input type="checkbox" name="is_with_bond_deposit" id="is_with_bond_deposit" value="1">';
                });
                    
            // Custom Edit Feilds
            $this->grocery_crud
                ->callback_edit_field('Filipino', function ($value, $primary_key) {

                    $this->load->model('Users');

                    $vaal = $this->Users->get_nationality($primary_key);

                    $checked = (!empty($vaal->FILIPINO) and $vaal->FILIPINO == 1) ? "checked" : "";

                    return '<input type="checkbox" name="isFilipino" id="isFilipino" data-value="' . $checked . '" value="' . $value . '" ' . $checked . '>';
                });

            // Additional View Data
            $data = array(
                'printer_url'       => base_url() . 'Printer/' . __FUNCTION__,
                'form_structure'    => json_encode(array_reverse($form_structure)),
//                'primary_key'       => $this->grocery_crud->get_primary_key()
            );
//            print_r($data); die;
            $this->render_view->page_render('employee', 'employees', $data);
        }
        
//        func_logQueries();
    }

    public function employee_before_send($post_array) {

        $gender = $post_array['gender'];

        if ($gender == "male") {
            
            $post_array['MALE'] = 1;
            
        } else if ($gender == "female") {
            
            $post_array['FEMALE'] = 1;
        }
        
        unset($post_array['gender']);

        return $post_array;
    }

}
