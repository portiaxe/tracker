app.controller('LoginController',function($scope, $rootScope, $state, $stateParams, $location, LoginDataOp,Access,$window){
	    var vm = this;

	    vm.logUser = logUser;
	    vm.user;
	    vm.login_form = {};
	    $scope.user = {};
			vm.logMessage ='';
			vm.isLogin;

			$scope.logout = logout;
		
			
		test = btoa("jerico:123");
		console.log(test);
	    function logUser(){
		    	LoginDataOp.login(vm.user).then(function(response){
		    		//$rootScope.isLogin = true;
		        	//$window.sessionStorage['user_id'] = response.data.user_id;
		    		//$state.go("home");

						console.log(response);

						if(response.data.success == true){
							$state.go("home");

							Access.user(response.data);
						}else{
							vm.status = response.data.message;
							$rootScope.isLogin = false;
						}
		    	}).catch(function(error) {
		    		 console.log("erorr");
	          //      	vm.status = error.data.message;
						//
		    		// vm.login_form.$setDirty();
		        //     vm.login_form.$focusFirstError;
				});

	    }

			function logout(){
					LoginDataOp.logout().then(function(response){
							$rootScope.isLogin = false;
							Access.user(undefined);
							$state.go('login');
					}).catch(function(error) {
						 console.log("erorr");
						//      	vm.status = error.data.message;
						//
						// vm.login_form.$setDirty();
						//     vm.login_form.$focusFirstError;
				});

			}



	});
