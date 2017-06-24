/* global base_url, form_structure, flexgrid_init, crud_loader */

var core = core || {}; // Main Global Variable

/**
 * modular loader and execution
 */
(function () {

    "use strict";

    var modules = {}; // private record of module data

    /**
     * modules are functions with additional information
     * @param {string} name
     * @param {array} imports
     * @param {object} mod
     */
    core.module = function (name, imports, mod) {

        // record module information
        console.log('loading module ' + name);
        modules[name] = {name: name, imports: imports, mod: mod};

        // collect import dependencies
        var deps = [];
        for (var i in imports) {
            deps.push(modules[imports[i]].linked);
        }

        // execute module code, pass imports, record exports
        modules[name].linked = mod.apply(null, deps);
    };

})();

/**
 * Core system module
 */
core.module('system', [], function () {

    console.log('system has loaded');

    var
            protected = {}, // functions that are inherited
            private = {}, // functions that are only accessible within the module
            public = {}; // functions that are executed on window ready using func::exec

    protected.main = $('#hrisys');

    protected.base_url = base_url;

    protected.exec = function (object) {
        $(function () {
            for (var inits in object) {
                object[inits]();
            }
        });
    };

    protected.clean_array = function (actual) {
        var newArray = new Array();
        for (var i = 0; i < actual.length; i++) {
            if (actual[i]) {
                newArray.push(actual[i]);
            }
        }
        return newArray;
    };
    
    protected.countProperties = function(obj) { // for older vertions of browser and js
        try {
            return Object.keys(obj).length;
        }catch(error){
            console.log("ERROR: Compatibility Issue => "+ error);
            var count = 0;
            for (var prop in obj) {
                if (obj.hasOwnProperty(prop))
                    ++count;
            }
            return count;
        }
    };

    return protected;
});

/**
 * Authentication module
 * @param {obj} sys
 */
core.module('authentication', ['system'], function (sys) {

    console.log('authentication has loaded');

    var
            protected = {}, // functions that are inherited
            private = {}, // functions that are only accessible within the module
            public = {}; // functions that are executed on window ready using func::exec

    public.init = function () {
        if ($('#formLogin').length === 0) {
            sys.main.on('click', '#logout', private.logout);
        } else {
            $('body').addClass('loginPage');
        }
    };

    private.loginAuth = function () {
        var formData = {
            'username': $('input[name="username"]').val(),
            'password': $('input[name="password"]').val()
        };
        $.ajax({
            type: 'POST',
            url: 'authenticate',
            dataType: 'json',
            data: formData,
            encode: true,
            success: function (data) {
                if (data.result === true) {
                    window.location.href = base_url;
                } else if (data.result === false) {
                    alert('Username or Password is Invalid');
                }
            },
            error: function (e) {
                console.log('error');
                console.log(e);
                $('body').html(e.responseText);
            }
        });
    };

    public.login = function () {

        sys.main.on('click submit', '#btnLogin', private.loginAuth);

        sys.main.on('keypress', '#logIn', function (e) {
            if (e.keyCode === 13) {
                private.loginAuth();
            }
        });
    };

    private.logout = function ( ) {

        $.ajax({
            type: 'GET',
            url: sys.base_url + 'logout',
            dataType: 'json',
            encode: true,
            success: function (data) {
                console.log('success');
                console.log(data);
                if (data.result === true) {
                    window.location.href = sys.base_url + 'login';
                } else if (data.result === false) {
                    alert('Error');
                }
            },
            error: function (e) {
                console.log('error');
                console.log(e);
                $('body').html(e.responseText);
            }
        });
    };

    /**
     * Methods: Activity Checking
     * Activity Checking and session checking 
     * to test User if Idle 
     */

    private.max_idle_time = 1000 * 60 * 15; // 15 minutes

    public.check_session = function () {
        if ($('#formLogin').length <= 0) {
            setInterval(function () {
                $.ajax({
                    type: 'GET',
                    url: 'check_sess',
                    dataType: 'json',
                    encode: true,
                    success: function (data) {
                        console.log('success');
                        console.log(data);
                        if (data.result === false) {
                            private.logout();
                        }
                    },
                    error: function (e) {
                        console.log('error');
                        console.log(e);
                        $('body').html(e.responseText);
                    }
                });
            }, private.max_idle_time + 1000);
        }
    };

    private.resetActive = function () {
        $(document.body).attr('class', 'active');
        clearTimeout(core.activityTimeout);
        core.activityTimeout = setTimeout(private.logout, private.max_idle_time);
    };

    public.checkActivity = function () {

        if ($('#formLogin').length <= 0 && $('body.printer').length <= 0) {
            core.activityTimeout = setTimeout(private.logout, private.max_idle_time);
            $(document).on('mousemove', function () {
                private.resetActive();
            });
        }
    };
    // Activity Checking End

    sys.exec(public); // run all public function

    return protected;

});

/**
 * Interface / Display General
 * @param {obj} sys
 */
core.module('interface', ['system'], function (sys) {

    console.log('interface has loaded');

    var
            protected = {}, // functions that are inherited
            private = {}, // functions that are only accessible within the module
            public = {}; // functions that are executed on window ready using func::exec

    public.init = function () {
        $(window).on("popstate", function () {
            location.reload();
        });
    };

    public.navEvents = function () {

        sys.main.on('click', '.sidebar li a', function (event) {
            var base_location = $(this).attr('data-base-location');
            if (base_location !== '#') {
                if (crud_loader === undefined) {
                    window.location.reload();
                }
                $.ajax({
                    type: 'POST',
                    url: $(this).attr('href'),
                    data: {isContent: 1},
                    encode: true,
                    success: function (data) {
                        private.pushState(base_location);
                        $('#page-wrapper').html(data);
                        if (typeof flexgrid_init !== 'undefined') {
                            flexgrid_init(); // re run flex grid library
                        }

                    },
                    error: function (e) {
                        console.log(e);
                        $('body').html(e.responseText);
                    }
                });
            }
            event.preventDefault();
        });
    };

    public.print_custom = function () {
        var print_url = $('.container-fluid').attr('data-print-url');
        if (print_url !== undefined && print_url.length > 0) {
            $('.print-anchor').attr('data-url', print_url);
        }

    };

    private.reloadScript = function () { // Unused
        $('script').each(function () {
            var old_src = $(this).attr('src');
            $(this).attr('src', '');
            $(this).attr('src', old_src);
        });
    };

    private.pushState = function (location, getParam) {
        history.pushState(base_url, {}, base_url + location);
    };

    public.restructure_form = function () {
        if (typeof form_structure !== 'undefined') {
            var ctr = 0, last = 0;
            last = sys.countProperties(form_structure);
            var isRead = $('.crud-form').hasClass('read-data');
            for (var index in form_structure) {
                ctr++;
                var exp = (ctr === last) || isRead === true ? "true" : "false";
                var isCollapse = (ctr === last) || isRead === true ? "in" : "";
                $('.form-div').prepend('<div class="row" data-prepend=' + ctr + '>\n\
                                            <div class="col-sm-12">\n\
                                                <div class="panel panel-default">\n\
                                                    <div class="panel-heading" data-toggle="collapse" data-target="#panel_'+ctr+'">' + index + '</div>\n\
                                                    <div class="panel-body collapse '+isCollapse+'" aria-expanded="'+exp+'" id="panel_'+ctr+'">\n\
                                                        <div class="row"></div>\n\
                                                    </div>\n\
                                                </div>\n\
                                            </div>\n\
                                        </div>'
                        );
                form_structure[index].forEach(function (a) {
                    var det = $('#' + a + '_field_box').detach();
                    det.appendTo('div[data-prepend="' + ctr + '"] .panel-body .row');
                });
            }
            
            $('.form-field-box').wrap('<div class="col-md-12"></div>');
            var counter = 0, prep = 1;
            $('.form-field-box').each(function () {
                if (isRead === true){
                    counter++;
                    var odd_even = (counter % 2 == 0) ? 'even' : 'odd';
                    $(this).addClass(odd_even);
                }
                if ($(this).parents('.panel.panel-default').length === 0) {
//                    $(this).offsetParent().remove();
                    var column = $(this).attr('id').split("_")[0];
                    form_structure[index].forEach(function (a) {
                        if (a == column) {
                            $(this).offsetParent().remove();
                        }
                    });
                }
            });
        }
    };
    
    public.expand_compress_form = function(){

        sys.main.on('click','#expandForm',function(){ 
            $('.panel-heading').each(function(){ 
                var body = $(this).next(); 
                if( ! body.hasClass('in')){ 
                    $(this).click();
                }
            });
        });
        
        sys.main.on('click','#compressForm',function(){
            $('.panel-heading').each(function(){ 
                var body = $(this).next(); 
                if( body.hasClass('in')){ 
                    $(this).click();
                }
            });
        });
        
    };
    
    public.checkBox = function(){
        
        $('#field-NATIONALITY').attr('disabled', 'true');
        
        sys.main.on('change', '#isFilipino', function(){
            if($(this).is(":checked")){
                $('#field-NATIONALITY').attr('disabled', 'true').val('');
            }else{
                $('#field-NATIONALITY').removeAttr('disabled').val('');
            }
        });  
        
        $('#field-bonddeposit').attr('disabled', 'true');
        
        sys.main.on('change', '#is_with_bond_deposit', function(){
            if($(this).is(":checked")){
                $('#field-bonddeposit').removeAttr('disabled').val('');
            }else{
                $('#field-bonddeposit').attr('disabled', 'true').val('');
            }
        }); 
        
        $('#field-EMPNO').attr('disabled',true);
    };
    
    public.printEmployee = function(){

        sys.main.on('click','#print_read_btn',function(){

            var data_printer = $('div[data-print-url]').attr('data-print-url');
            
            $.ajax({
                type: 'POST',
                url: sys.base_url+'testprint',
                data: {data_print: data_printer},
                encode: true,
                success: function (data) {
                    
                },
                error: function (e) {
                    console.log(e);
                    $('body').html(e.responseText);
                }
            });

        });
        
    };

    sys.exec(public); // run all public function

    return protected;

});