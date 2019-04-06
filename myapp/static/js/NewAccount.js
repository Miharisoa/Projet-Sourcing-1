var app = angular.module('newAccountApp',[],function($httpProvider){
    $httpProvider.defaults.xsrfCookieName= 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
});


app.config(function ($interpolateProvider) {
    $interpolateProvider.startSymbol('[[').endSymbol(']]');
});

app.controller('newUserCtrl',function($scope,$http){
    $scope.nom="";
    $scope.prenom="";
    $scope.email="";
    $scope.mdp="";
    $scope.mdp2="";
    $scope.type=false;

    

    $scope.save=function(){
        var test = ($scope.type)?1:0;
        // alert('toto');
        if($scope.nom!="" && $scope.prenom!="" && $scope.email!="" && $scope.mdp!="" && $scope.mdp2!=""){
            if($scope.mdp!=$scope.mdp2) alert("Veuillez confirmer votre mot de passe");
            else{
                
                $http({
                    method: 'POST',
                    url: "newuser/",
                    data: $.param({'nom':$scope.nom,'prenom':$scope.prenom,'email':$scope.email,'mdp':$scope.mdp,'rec':test}) ,       
                    transformRequest: angular.identity, 
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
                })
                .then(function () {
                    $scope.nom="";
                    $scope.prenom="";
                    $scope.email="";
                    $scope.mdp="";
                    $scope.mdp2="";
                    $scope.type=false;
                    console.log("vitaa");
                    alert('registration finished');
                    // window.location.href = "/user/login"
                });
            }
        }
        else alert("Veuillez remplir tous les champs");
    }
});


app.controller('loginCtrl',function($scope,$http){

    $scope.mail="";
    $scope.password="";

    $scope.login = function(){
        if($scope.mail!="" && $scope.password!=""){
            $http({
                method: 'POST',
                url: "login/",
                data: $.param({'email':$scope.mail,'mdp':$scope.password,}) ,       
                transformRequest: angular.identity, 
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
            })
            .then(function(response) {
                console.log(response.data.reponse);
                if(response.data.reponse=="oui"){
                    if(response.data.estRec) {
                        alert('Connecté en tant que recruteur');
                        window.location.href = "/dashboard/recruteur";
                    }
                    else {
                        alert('connecté en tant que candidat');
                        window.location.href = "/dashboard/candidat";
                    }
                }
                else alert('accès refusé');  // tsy tafiditra              
            });
        }
        else alert('Veuillez remplir tous les champs');
    }


});