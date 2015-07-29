$(".houses.index").ready() {
	$(){
		socket = new WebSocket("ws://" + window.location.host +"/houses");

		socket.onmessage = function (event){
		};

	};
};