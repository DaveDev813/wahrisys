<?php

if (!function_exists('func_logQueries')){

    function func_logQueries() {
        
        if(DEBUGGING == TRUE){
            
            $CI = & get_instance();

            $filepath = APPPATH . 'logs/Query-log-' . date('Y-m-d') . '.log'; 
            $handle = fopen($filepath, "a+");                        

            $times = $CI->db->query_times;
            foreach ($CI->db->queries as $key => $query) 
            { 
                $sql = $query . " \n Execution Time:" . $times[$key]; 

                fwrite($handle, $sql . "\n\n");    
            }

            fclose($handle);  
        }
    }
}

if (!function_exists('func_write')){
    
    function func_write( $value = null, $name = 'foo' ){
        
       if( DEBUGGING == TRUE and ! is_null($value) ){
            
            $filepath = APPPATH . 'logs/'.$name.'-' . date('Y-m-d') . '.log';
            
            $handle = fopen($filepath, "a+");
            
            if(is_array($value) || is_object($value)){
                
                $value = print_r($value, true);
            }
            
            fwrite($handle, $value . "\n\n"); 
            
            fclose($handle); 
        }
        
    }
    
}