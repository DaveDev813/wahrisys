<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=1263, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="assets/images/favicon.png">
        <title>Print | WAHRI-SYS</title>

        <!-- Bootstrap Core CSS -->
        <link href="<?php echo base_url() ?>assets/css/library/bootstrap.min.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="<?php echo base_url() ?>assets/css/main.css" rel="stylesheet" type="text/css">

        <!-- Grocery Crud Assets -->

        <script> var base_url = "<?php echo base_url(); ?>";</script>

        <style type="text/css" media="print">
            @page {
                size: auto; 
                margin: 0;
            }
        </style>

    </head>

    <body id="hrisys" class="printer">

        <div id="wrapper">

            <div class="row head">
                <div class="col-sm-12 text-center">
                    <h5 class="text-center print_header">
                        <strong><?php echo $company_name; ?></strong> <br/>
                        <?php echo $page_name; ?> <br/>
                        <small> <?php echo $date; ?> </small>
                    </h5> 
                </div>
            </div>