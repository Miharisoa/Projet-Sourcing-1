var app = angular.module('dashboardApp',[],function($httpProvider){
    $httpProvider.defaults.xsrfCookieName= 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});

app.config(function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[').endSymbol(']]');
});

app.controller('candidatCtrl',function($scope,$http){

    $scope.showListe=1;
    $scope.page = 1;
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

    $scope.fileNameChanged = function (selectedFile,type) {
        "use strict";
        alert(type);
        var formData = new FormData();        
        formData.append('the_file', selectedFile);
        formData.append('id_offre',$scope.currentElem.offre.id);
        formData.append('type',type)

        /*URL, Data-Object, Config-Object*/
        $http.post('/dashboard/upload/', formData, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        }).success(function () {
            alert('upload finished');
            // window.location.assign('/list_company');
        })
        .error(function () {
            alert('error sending.')
        });
    };

});
