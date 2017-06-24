/* global base_url, crud_loader, form_structure, flexgrid_init */

/**
 * Main Module
 * @type type
 */
var core = core || {};

(function (public) {

    public.hrisys = $('#hrisys');

    "use strict";

    var private = private || {};

    public.init = function () {
        for (var inits in public) {
            if (inits !== 'init' && public[inits].init !== undefined) {
                public[inits].init();
            }
        }
    };

    public.exec = function (object) {
        for (var inits in object) {
            if (inits !== 'init') {
                object[inits]();
            }
        }
    };
    
    public.clean_array = function (actual) {
        var newArray = new Array();
        for (var i = 0; i < actual.length; i++) {
            if (actual[i]) {
                newArray.push(actual[i]);
            }
        }
        return newArray;
    };
    

}(core)); $(core.init);

/**
 * Authentication
 * @type type.auth
 */
core.auth = core.auth || {};

(function (public) {

    var system = core.hrisys;

    var private = private || {};

    public.init = function () {
        core.exec(public);
        if ($('#formLogin').length === 0) {
            system.on('click', '#logout', private.logout);
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
                console.log('error'); console.log(e);
                $('body').html(e.responseText);
            }
        });
    };
    
    public.login = function () {
        
        system.on('click submit', '#btnLogin', private.loginAuth);
        
        system.on('keypress', '#logIn', function(e){
            if(e.keyCode === 13){
                private.loginAuth();
            }
        });
    };

    private.logout = function ( ) {

        $.ajax({
            type: 'GET',
            url: base_url + 'logout',
            dataType: 'json',
            encode: true,
            success: function (data) {
                console.log('success');
                console.log(data);
                if (data.result === true) {
                    window.location.href = base_url + 'login';
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

}(core.auth));

/**
 *  Views / Display General
 */

core.view = core.view || {};

(function (public) {

    var system = core.hrisys;

    var private = private || {};

    public.init = function () {
        core.exec(public);
        $(window).on("popstate", function () {
            location.reload();
        });
    };

    public.navEvents = function () {

        system.on('click', '.sidebar li a', function (event) {
            var base_location = $(this).attr('data-base-location');
            if (base_location !== '#') {
                if (crud_loader === undefined){
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
                        if(typeof flexgrid_init !== 'undefined'){
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
        if(print_url !== undefined && print_url.length > 0){
            $('.print-anchor').attr('data-url',print_url);
        }
        
    };
    
    private.reloadScript = function(){ // Unused
        $('script').each(function() {
            var old_src = $(this).attr('src');
            $(this).attr('src', '');
            $(this).attr('src', old_src);
        });
    };

    private.pushState = function (location, getParam) {
        history.pushState(base_url, {}, base_url+location);
    };
    
    public.restructure_form = function () {
        if (typeof form_structure !== 'undefined') {
            var ctr = 0;
            for (var x in form_structure) { ctr ++;
                
                $('.form-div').prepend('<div class="row" data-prepend='+ctr+'>\n\
                                            <div class="col-sm-12">\n\
                                                <div class="panel panel-default">\n\
                                                    <div class="panel-heading">'+x+'</div>\n\
                                                    <div class="panel-body">\n\
                                                        <div class="row"></div>\n\
                                                    </div>\n\
                                                </div>\n\
                                            </div>\n\
                                        </div>'
                );
                form_structure[x].forEach(function (a) {
                    var det = $('#'+a+'_field_box').detach();
                    det.appendTo('div[data-prepend="'+ctr+'"] .panel-body .row');
                });
            }
            $('.form-field-box').wrap('<div class="col-md-6"></div>');
        }
    };

}(core.view));


