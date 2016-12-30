(function () {
    "use strict";

    var app = angular.module("productManagement",
                            ["common.services", "ngRoute"]);

    app.config(function ($routeProvider) {
        $routeProvider
        .when("/", {
            templateUrl: "/Views/Authentication/Login.html",
            controller: "userCtrl",
            controllerAs: 'vm'
        })
        .when('/login', {            
            templateUrl: "~/Views/Authentication/Login.html",
            controller: 'userCtrl',
            controllerAs: 'vm'
        })
        .when("/register", {            
            controller: 'registerCtrl',
            templateUrl: "/Views/Authentication/registerView.html",
            controllerAs: 'vm'
        })
        .when("/forgot", {
            controller: 'forgotCtrl',
            templateUrl: "/Views/Authentication/forgotView.html",
            controllerAs: 'vm'
        })
        .when("/contact", {
            controller: 'contactCtrl',
            templateUrl: "/Views/Authentication/contactView.html",
            controllerAs: 'vm'
        })
        .when('/dashboard', {
            controller: 'productListCtrl',
            templateUrl: "/Views/Products/Dashboard/productListView.html",
            controllerAs: 'vm'
        })        
        .when("/view", {            
            controller: 'viewCtrl',
            templateUrl: "/Views/Products/Quotation/quotationDetailsView.html",
            controllerAs: 'vm'            
        })
        .when("/edit", {             
             controller: 'viewCtrl',
             templateUrl: "/Views/Products/Quotation/editView.html",
             controllerAs: 'vm'
        })
        .when("/create", {
            controller: 'createCtrl',
            templateUrl: "/Views/Products/Quotation/editView.html",
            controllerAs: 'vm'
        })
        .when("/account", {
            controller: 'adminCtrl',
            templateUrl: "/Views/Administration/accountView.html",
            controllerAs: 'vm'
        })
        .when("/password", {
            controller: 'adminCtrl',
            templateUrl: "/Views/Administration/changepwdView.html",
            controllerAs: 'vm'
        })
        .when("/changeemail", {
            controller: 'changeemail',
            templateUrl: "/Views/Administration/changeEmailView.html",
            controllerAs: 'vm'
        })


        .otherwise({ redirectTo: '/login' });                       
    });

    app.factory('global', function () {
        return {           
            setViewPreferences: function (obj) {
                for (var key in obj) {                    
                    switch (key) {
                        case "menuBar":                            
                            document.getElementById('menuBar').style = (obj[key] == 'true') ? 'display:block;' : 'display:none;'
                            document.getElementById('topMenu').style = 'display:block;'
                            document.getElementById('loginMenu').style = 'display:none;'
                            break;
                        case "menuActive":
                            $("#menu .list-group-item").removeClass("active");
                            $('#m' + obj[key]).addClass("active");
                            break;
                        default:
                            document.getElementById('menuBar').style = 'display:none;'
                            break;
                    }
                }
            }
        };
    });

    // Home controller
    app.controller('homeCtrl', function ($scope) {
        $scope.dashboardPath = "/Home.html#/dashboard";
        $scope.editViewPath = "/Home.html#/view";
        $scope.createViewPath = "/Home.html#/create";
        $scope.loginPath = "/Home.html#/";
        $scope.contactPath = "/Home.html#/contact";
        $scope.registerPath = "/Home.html#/register";
        $scope.accountPath = "/Home.html#/account";
    });

}());