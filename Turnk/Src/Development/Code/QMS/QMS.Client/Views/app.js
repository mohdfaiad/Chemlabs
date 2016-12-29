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

        .otherwise({ redirectTo: '/login' });                       
    });

    app.factory('global', function () {
        return {
            appInit: function () {
                document.getElementById('menuBar').style = 'display:block;';
                $("#menu .list-group-item").removeClass("active");                
            },
            appMenuActive: function (menu) {                
                $('#'+menu).addClass("active");
            }        
        };
    });

}());