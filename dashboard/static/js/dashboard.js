var app = angular.module('dashboardApp',[],function($httpProvider){
    $httpProvider.defaults.xsrfCookieName= 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});

app.config(function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[').endSymbol(']]');
});

app.controller('candidatCtrl',function($scope,$http){

    $scope.showListe=1;
    $scope.page = 6;
    $scope.currentElem = null;
    $scope.offres = [];
    $scope.offre_categories = [];
    $scope.mes_offres = [];


    $scope.changement=function(index){
       $scope.showListe=index;
    };

    $scope.init=function(offres,offre_categories){
        $scope.offres = JSON.parse(offres);
        $scope.mes_offres = JSON.parse(offres);
        liste_temp = JSON.parse(offre_categories);
        liste_temp.forEach(element=>{
            $scope.offre_categories.push(JSON.parse(element));
        });
        console.log("AFFICHAGE");
        console.log(liste_temp);
    }

    $scope.voirPlus = function(index){
        $scope.currentElem = $scope.offres[index];
        $scope.currentElem.tab1 = $scope.currentElem.offre.description.split(',');
        $scope.currentElem.tab2 = $scope.currentElem.offre.mission.split(',');        
        $scope.showListe = 0;
    }

    $scope.affichage_par_categorie = function(id){
        $scope.offres = $scope.offre_categories[id-1];
    }
});
