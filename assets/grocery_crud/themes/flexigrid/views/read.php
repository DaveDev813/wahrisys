<?php
    $this->set_css($this->default_theme_path . '/flexigrid/css/flexigrid.css');
    $this->set_js_lib($this->default_theme_path . '/flexigrid/js/jquery.form.js');
    $this->set_js_config($this->default_theme_path . '/flexigrid/js/flexigrid-edit.js');
    $this->set_js_lib($this->default_javascript_path . '/jquery_plugins/jquery.noty.js');
    $this->set_js_lib($this->default_javascript_path . '/jquery_plugins/config/jquery.noty.config.js');
?>

<div class="flexigrid crud-form read-data" style='width: 100%;' data-unique-hash="<?php echo $unique_hash; ?>">

    <div class="mDiv">
        <div class="ftitle">
            <div class='ftitle-left'>
                <?php //echo $this->l('list_record'); ?> <?php echo $subject ?>
            </div>
            <div class='clear'></div>
        </div>
        <!--        
        <div title="<?php //echo $this->l('minimize_maximize'); ?>" class="ptogtitle">
            <span></span>
        </div>
        -->
    </div>

    <div id='main-table-box'>

        <div class="tDiv">
            <div class="btn-group btn-group-sm pull-left" id="optionBtns" role="group" aria-label="...">
              <button type="button" class="btn btn-success">
                  <i class="fa fa-pencil"></i>&nbsp Work History
              </button>
            </div>
            <div class="btn-group btn-group-sm pull-right" id="actionBtns" role="group" aria-label="...">
              <button type="button" class="btn btn-default"><i class="fa fa-file-excel-o"></i>&nbsp Export</button>
              <button type="button" class="btn btn-default" id="print_read_btn"><i class="fa fa-print"></i>&nbsp Print</button>
              <button type="button" class="btn btn-default" id="expandForm"><i class="fa fa-expand"></i>&nbsp Expand</button>
              <button type="button" class="btn btn-default" id="compressForm"><i class="fa fa-compress"></i>&nbsp Compress</button>
            </div>
        </div>
        <div class="clear"></div>
        <?php echo form_open($read_url, 'method="post" id="crudForm"  enctype="multipart/form-data"'); ?>

        <div class='form-div'>
            
            <?php foreach ($fields as $field): ?>
                <div class='form-field-box' id="<?php echo $field->field_name; ?>_field_box">
                    <div class='form-display-as-box' id="<?php echo $field->field_name; ?>_display_as_box">
                        <?php echo $input_fields[$field->field_name]->display_as ?>
                        <?php echo ($input_fields[$field->field_name]->required) ? "<span class='required'>*</span> " : "" ?> :
                    </div>
                    <div class='form-input-box' id="<?php echo $field->field_name; ?>_input_box">
                        <?php echo $input_fields[$field->field_name]->input ?>
                    </div>
                    <div class='clear'></div>
                </div>
            <?php endforeach; ?>
            
            <?php if (!empty($hidden_fields)): ?>
                <!-- Start of hidden inputs -->
                <?php
                    foreach ($hidden_fields as $hidden_field) {
                        echo $hidden_field->input;
                    }
                ?>
                <!-- End of hidden inputs -->
            <?php endif; ?>
                
            <?php if ($is_ajax) { ?><input type="hidden" name="is_ajax" value="true" /><?php } ?>
            <div id='report-error' class='report-div error'></div>
            <div id='report-success' class='report-div success'></div>
        </div>
        <div class="pDiv">
            <div class='form-button-box'>
                <input type='button' value='<?php echo $this->l('form_back_to_list'); ?>' class="btn btn-large btn-warning back-to-list" id="cancel-button" />
            </div>
            <div class='form-button-box'>
                <div class='small-loading' id='FormLoading'><?php echo $this->l('form_update_loading'); ?></div>
            </div>
            <div class='clear'></div>
        </div>
        <?php echo form_close(); ?>
    </div>
</div>

<script>
    var validation_url = '<?php echo $validation_url ?>';
    var list_url = '<?php echo $list_url ?>';
    var message_alert_edit_form = "<?php echo $this->l('alert_edit_form') ?>";
    var message_update_error = "<?php echo $this->l('update_error') ?>";
</script>
