var app = angular.module('dashboardApp',[],function($httpProvider){
    $httpProvider.defaults.xsrfCookieName= 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});

app.config(function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[').endSymbol(']]');
});

app.controller('candidatCtrl',function($scope,$http){

    $scope.showListe=0;
    $scope.offres = [];

    $scope.changement=function(index){
        if($scope.showListe==1) $scope.showListe=0;
        else $scope.showListe=1;
    };

    $scope.init=function(offres){
        console.log(offres);
        // offres.forEach(element => {
        //     console.log(element);
        // });

    }
});
