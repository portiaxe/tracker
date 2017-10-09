app.controller('ProfileController', function($rootScope, $scope, $state,
		ProfileDataOp) {

      $scope.profile = {};

      ProfileDataOp.getProfile()
                 .then(function(response){
									 $scope.profile = response.data[0];

	                   console.log(response.data[0]);
                 })
                 .catch(function(error){
                   console.log(error);
                 });
    });
