(function () {
    "use strict";
    angular
        .module("productManagement")
        .controller("productListCtrl",
                     ["productResource", "$scope", "$location","global", productListCtrl]);

    function productListCtrl(productResource, $scope, $location, global) {

        //Enable view essentials on view load.
        var setPreferences = {
            menuBar: 'true',
            menuActive: 'dashboard',
            //viewPath:'/home.htm#/dashboard',
        };
        global.setViewPreferences(setPreferences);

        var vm = this;
        productResource.query(function (data) {
            vm.products = data;
        });

        $scope.DoSearch = function (mySearch) {
            vm.searchCriteria = mySearch;
            productResource.query({ search: vm.searchCriteria, quoteid:'' }, function (data) {
                vm.products = data;
            });
        }       

        $scope.viewProduct = function (productCode) {
            vm.viewCode = productCode;
            //$location.href('#/view/' + 1234);
            $location.path('/view');            
        }

        $scope.editProduct = function (productCode) {
            vm.viewCode = productCode;            
            $location.path('/edit');
        }
    }
}());
