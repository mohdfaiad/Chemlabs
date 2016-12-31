(function () {
    "use strict";
    angular
        .module("productManagement")
        .controller("rptQuotationCtrl",
                     ["$scope", "global", rptQuotationCtrl]);

    function rptQuotationCtrl($scope, global) {
        //Enable view essentials on load.
        var setPreferences = {
            menuBar: 'true',
            menuActive: 'reports',
        };
        global.setViewPreferences(setPreferences);
    }
}());
