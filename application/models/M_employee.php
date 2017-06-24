<?php defined('BASEPATH') OR exit('No direct script access allowed');

class M_employee extends CI_Model {

    public function form_structure() {
        
        $feilds = array();

        $form_structure = array(
            
            "Employee Information" => array(
                "EMPNO","FNAME", "MNAME", "LNAME",
                "CITYADDRESS", "CITY", "ZIPCODE1",
                "PROVINCE", "PROVADDRESS", "ZIPCODE2",
                "TELNO", "BDATE", "BPLACE", "Gender",
                "HEIGHT", "WEIGHT", "Filipino", "NATIONALITY", "RELCODE",
                "CSCODE", "SPOUSE", "SOCCUPATION"
            ),
            
            "Dependents" => array(
                "DEPENDENT1", "bdate1",
                "DEPENDENT2", "bdate2",
                "DEPENDENT3", "bdate3",
                "DEPENDENT4", "bdate4"
            ),
            
            "Parents" => array(
                "father", "foccupation",
                "mother", "moccupation"
            ),
            
            "Education" => array(
                "TERTIARY", "GRADUATED1", "COURSE1",
                "VOCATIONAL", "GRADUATED2", "COURSE2",
                "SECONDARY", "GRADUATED3",
                "PRIMARY", "GRADUATED4",
                "SKILLS"
            ),
            
            "Work Experience" => array(
                "INCLUSIVE1", "POSITION1", "COMPANY1",
                "INCLUSIVE2", "POSITION2", "COMPANY2",
                "INCLUSIVE3", "POSITION3", "COMPANY3",
            ),
            
            "Refference" => array(
                "NAME1","CCOMPANY1","TITLE1",
                "NAME2","CCOMPANY2","TITLE2",
                "NAME3","CCOMPANY3","TITLE3",
            ),
            
            "Numbers And Other Information" => array(
                "datehired", "dateend", "totalbond", "pag-IBIG_Computed", "with_Bond_Deposit", "bonddeposit", "TAXSTATUS",
                "SSNO", "TIN", "PHICNo", "NBI", "atmaccountno", "PAGIBIGNO","initialbond","bondclaimed"
            )
        );

        foreach ($form_structure as $feild) {
            
            $feilds = array_merge($feilds, $feild);
        }
        
        $this->grocery_crud->fields($feilds);
        
        $this->grocery_crud->unset_fields(
            'MALE','FEMALE','FILIPINO','Companyid','Deptcode','Poscode',
            'from','to','Contractrate','Salaryrate','WORKHISTORYNO','Allowance','gender',
            'deptcode','poscode','contractrate','salaryrate','allowance','supervisor','title','EMPLOYER',
            'lastupdated','BANKCODE','withtax','monthly','colaexcluded','WORKINGDAYS','minimumwageearner','updatedby',
            'pagibigcomputed','withbonddeposit','companyid'
        );
        
        return array(
            "form_structure"            => $form_structure,
            "feilds"                    => $feilds
        );
    }
    
    public function feild_alias(){
        
        $columns = array (
            'bondclaimed'   => "Bond Claimed",
            'initialbond'   => "Initial Bond",
            'FNAME'         => 'First Name',
            'MNAME'         => 'Middle Name',
            'LNAME'         => 'Last Name',
            'EMPNO'         => 'Employee No.',
            'EMPLOYER'      => 'Employer',
            'PAGIBIGNO'     => 'Pag-IBIG No.',
            'SSNO'          => 'SSS No.',
            'TIN'           => 'Tin No.',
            'CITYADDRESS'   => 'Address',
            'CITY'          => 'City',
            'BDATE'         => 'Birth Date',
            'BPLACE'        => 'Birth Place',
            'HEIGHT'        => 'Height',
            'WEIGHT'        => 'Weight',
            'ZIPCODE1'      => 'Zip Code',
            'PROVADDRESS'   => 'Province Address',
            'PROVINCE'      => 'Province',
            'ZIPCODE2'      => 'Province Zip Code',
            'TELNO'         => 'Contact Number',
            'FILIPINO'      => 'Filipino',
            'NATIONALITY'   => 'Nationality',
            'SPOUSE'        => 'Name of Spouse',
            'SOCCUPATION'   => 'Spouse Occupation',
            'MALE'          => 'Male',
            'FEMALE'        => 'Female',
            'CSCODE'        => 'Civil Status',
            'DEPENDENT1'    => '1st Dependent',
            'DEPENDENT2'    => '2nd Dependent',
            'DEPENDENT3'    => '3rd Dependent',
            'DEPENDENT4'    => '4th Dependent',
            'bdate1'        => 'Birth Date',
            'bdate2'        => 'Birth Date',
            'bdate3'        => 'Birth Date',
            'bdate4'        => 'Birth Date',
            'foccupation'   => 'Occupation',
            'moccupation'   => 'Occupation',
            'father'        => 'Name of Father',
            'mother'        => 'Name of Mother',
            'datehired'     => 'Date Hired',
            'dateend'       => 'Date End',
            'totalbond'     => 'Total Bond',
            'pagibigcomputed' => 'Pag-IBIG Computed',
            'bonddeposit'   => 'Bond Deposit',
            'TAXSTATUS'     => 'Tax Status',
            'atmaccountno'  => 'ATM Account #',
            'RELCODE'       => 'Relation'
        );
        
        foreach($columns as $index => $column){
            
            $this->grocery_crud->display_as( $index, $column );
        }
    }
    
    public function test(){
        
        return $this->db->field_data('employees');

    }

}
