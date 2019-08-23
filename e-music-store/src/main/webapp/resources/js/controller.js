var cartApp = angular.module('cartApp', []);

cartApp.controller('cartCtrl', function($scope, $http) {
	
	$scope.refreshCart = function() {
		$http.get('/e-music-store/api/cart/' + $scope.cartId).success(function(data) {
			$scope.cart = data;
		});
	};
	
	$scope.clearCart = function() {
		$http.delete('/e-music-store/api/cart/' + $scope.cartId).success($scope.refreshCart());
		alert("All the products from the cart are deleted!");
	};
	
	$scope.initCartId = function(cartId) {
		$scope.cartId = cartId;
		$scope.refreshCart(cartId);
	}
	
	$scope.addToCart = function(productId) {
		$http.put('/e-music-store/api/cart/add/' + productId).success(function() {
			alert("Product successfully added to the cart!");
		});
	};
	
	$scope.removeFromCart = function(productId) {
		console.log("id : " + productId);
		$http.put('/e-music-store/api/cart/remove/' + productId).success(function(data) {
			$scope.refreshCart();
		});
	};
	
	$scope.calGrandTotal = function() {
		var grandTotal = 0;
		for(var i = 0; i < $scope.cart.cartItems.length; i++) {
			grandTotal += $scope.cart.cartItems[i].totalPrice;
		}
		
		return grandTotal;
	};
});