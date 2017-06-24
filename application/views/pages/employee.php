<script> var form_structure =<?php echo (isset($form_structure)) ? $form_structure : "{}"; ?> </script>
<div class="container-fluid" data-print-url="<?php echo (isset($print_data)) ? $print_data: ""; ?>">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Employee</h1>
        </div>
        <div class="col-lg-12">
            <?php echo $output; ?>
        </div>
    </div>
</div>
