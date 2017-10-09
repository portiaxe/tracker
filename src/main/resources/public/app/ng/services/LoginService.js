app.factory('LoginDataOp', ['$http', function($http){

	    var vm = this;

	    var LoginDataOp = {};
	    vm.user = {};

	    LoginDataOp.login = function(user){
	        return $http({
	            method: 'POST',
	            url: '/Tracker/authenticate',
				dataType: 'json',
				data: user,
				headers: { 'Content-Type': 'application/json; charset=UTF-8' }
	        })
	    }	
	    
	
	    return LoginDataOp;

	}]);
