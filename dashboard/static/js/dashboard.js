var app = angular.module('dashboardApp',[],function($httpProvider){
    $httpProvider.defaults.xsrfCookieName= 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});

app.config(function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[').endSymbol(']]');
});

app.controller('candidatCtrl',function($scope,$http){

    $scope.showListe=1;
    // $scope.page = 2;
    $scope.offres = [];
    $scope.currentElem = null;

    $scope.changement=function(index){
       $scope.showListe=index;
    };

    $scope.init=function(offres){
        $scope.offres = JSON.parse(offres);
        console.log($scope.offres);
        console.log('LISTING');
        $scope.offres.forEach(element => {
            console.log(element.offre.intutile);
            console.log(element.societe);
        });
    }

    $scope.voirPlus = function(index){
        $scope.currentElem = $scope.offres[index];
        $scope.currentElem.tab1 = $scope.currentElem.offre.description.split(',');
        $scope.currentElem.tab2 = $scope.currentElem.offre.mission.split(',');        
        $scope.showListe = 0;
    }
});
