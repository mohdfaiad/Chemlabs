(function () {
    "use strict";
    angular
        .module("productManagement")
        .controller("adminCtrl",
                     ["$scope", "global", adminCtrl]);

    function adminCtrl($scope, global) {
        //Enable view essentials on view load.
        var setPreferences = {
            menuBar: 'true',
            menuActive: 'account',
        };        
        global.setViewPreferences(setPreferences);        
    }
}());
