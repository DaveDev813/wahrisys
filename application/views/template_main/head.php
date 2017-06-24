<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<?php echo base_url()?>assets/images/favicon.png">
    <title>WAHRI-SYS</title>

    <!-- MetisMenu CSS -->
    <link href="<?php echo base_url()?>assets/css/library/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?php echo base_url()?>assets/css/library/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php echo base_url()?>assets/css/library/font-awesome.min.css" rel="stylesheet" type="text/css">
        
    <!-- Grocery Crud Assets -->
    
    <?php if(isset($css_files)): ?>
        <script> var crud_loader = "CRUD has loaded"; </script>
        <?php foreach ($css_files as $file): ?>
            <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
        <?php endforeach; ?>
    <?php endif;?>
            
    <!-- Bootstrap Core CSS -->
    <link href="<?php echo base_url()?>assets/css/library/bootstrap.min.css" rel="stylesheet">
            
    <!-- Custom Fonts -->
    <link href="<?php echo base_url()?>assets/css/main.css" rel="stylesheet" type="text/css">
    
    <script> 
        var base_url = "<?php echo base_url(); ?>"; 
    </script>
    
</head>

<body id="hrisys">

    <div id="wrapper">