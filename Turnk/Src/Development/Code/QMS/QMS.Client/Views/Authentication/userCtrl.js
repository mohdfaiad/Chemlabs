(function () {
    "use strict";
    angular
        .module("productManagement")
        .controller("userCtrl",
                     ["userAccount", '$location', "global", userCtrl])
        .controller("registerCtrl",
                     ["userAccount", '$location', registerCtrl])
        .controller("forgotCtrl",
                     ["userAccount", '$location', forgotCtrl])
        .controller("contactCtrl",
                     ["userAccount", '$location', contactCtrl])

    function userCtrl(userAccount, $location, global) {
        var vm = this;
        vm.isLoggedIn = false;
        vm.message = '';
        vm.userData = {
            userName: '',
            password: '',
            email: '',
            confirmPassword:''
        };

        //Enable view essentials on view load.
        var setPreferences = {
            menuBar: 'false',
            //menuActive: 'dashboard',            
        };
        global.setViewPreferences(setPreferences);

        // user authentication. On success redirect to dashboard view.
        vm.login = function () {
            vm.userData.grant_type = "password";
            //vm.userData.userName = vm.userData.userName;
            vm.isLoggedIn = true;
            
            $location.path('/dashboard');
        }

        // user registration. On sucess redirect to login view.
        vm.registerUser = function () {
            $location.path('/register');
        }
        // user registration. On sucess redirect to login view.
        vm.forgot = function () {
            $location.path('/forgot');
        }
    }

    function registerCtrl(userAccount, $location) {
        var vm = this;
        vm.isLoggedIn = false;
        vm.message = '';
        vm.userData = {
            userName: '',
            email: '',
            password: '',
            confirmPassword: '',
            companyName: ''
        };
        // user registration. On sucess redirect to login view.
        vm.register = function () {
            vm.userData.confirmPassword = vm.userData.password;
            userAccount.registration.registerUser(vm.userData,
                function (data) {
                    vm.confirmPassword = "";
                    vm.message = "...Registration successful";
                    vm.login();
                });
        }

        vm.login = function () {
            $location.path('/login');
        }
    }

    function forgotCtrl(userAccount, $location) {
        alert('forgotCtrl');
    }
    function contactCtrl(userAccount, $location) {
        var vm = this;
        setTimeout(function () {
            //var theView = document.getElementById("anil")            
            //alert(theView);
        }, 100);
    }

}());
