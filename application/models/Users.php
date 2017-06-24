<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Description of Users
 *
 * @author RoDave
 */
class Users extends CI_Model{
    
    public function get_user($username, $password){
        
        $query = $this->db->select('ID, username, userlevel')
                    ->where('username',$username)
                    ->where('password', $password)
                    ->from('users')
                    ->get()
                    ->row();
        return $query;
    }
    
    public function get_nationality( $id ){
        
        return $this->db
                ->from('employees')
                ->select('FILIPINO')
                ->where('EMPNO',$id)
                ->get()->row();
    }
}
