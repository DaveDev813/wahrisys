
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php if (isset($js_files)): ?>
        <?php foreach ($js_files as $file): ?>
            <script src="<?php echo $file; ?>"></script>
        <?php endforeach; ?>
    <?php else: ?>
        <!-- jQuery -->
        <script src="<?php echo base_url(); ?>assets/js/library/jquery.min.js"></script>    
    <?php endif; ?>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?php echo base_url(); ?>assets/js/library/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<?php echo base_url(); ?>assets/js/library/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<?php echo base_url(); ?>assets/js/library/sb-admin-2.min.js"></script>
    <!-- History JS -->
    <!--<script src="<?php echo base_url(); ?>assets/js/jquery.history.js"></script>-->
    <!-- HRISYS JS -->
    <script src="<?php echo base_url(); ?>assets/js/kairho_sys.js"></script>
</body>

</html>
