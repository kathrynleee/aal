//https://www.thomaslaurenson.com/blog/2018/07/10/mqtt-web-application-using-javascript-and-websockets/#mqtt-over-websockets

function updateScroll() {
    document.getElementById("messages").scrollTop = document.getElementById("messages").scrollHeight;
}

function onConnectionLost(){
    document.getElementById("messages").innerHTML ="Connection Lost";
    connected_flag=0;
}

function startConnect() {
    // Generate a random client ID
    clientID = "clientID_" + parseInt(Math.random() * 100);

    // Fetch the hostname IP address and port number from the form
    host = "192.168.43.106";
    port = "1884";

    // Print output for the user in the messages div
    document.getElementById("messages").innerHTML += '<span>Connected to: ' + host + ' on port: ' + port + '</span><br/>';
    //document.getElementById("messages").innerHTML += '<span>Using the following client value: ' + clientID + '</span><br/>';

    // Initialize new Paho client connection
    client = new Paho.MQTT.Client(host, Number(port), clientID);

    // Set callback handlers
    client.onConnectionLost = onConnectionLost;
    client.onMessageArrived = onMessageArrived;

    // Connect the client, if successful, call onConnect function
    client.connect({ 
        onSuccess: onConnect,
    });
}

// Called when the client connects
function onConnect() {
	var topic = "SmokeSensor";
    document.getElementById("messages").innerHTML += '<span>Subscribed to: ' + topic + '</span><br/>';

    // Subscribe to the requested topic
    client.subscribe(topic);
}

// Called when the client loses its connection
function onConnectionLost(responseObject) {
    document.getElementById("messages").innerHTML += '<span>ERROR: Connection lost</span><br/>';
    if (responseObject.errorCode !== 0) {
        document.getElementById("messages").innerHTML += '<span>ERROR: ' + + responseObject.errorMessage + '</span><br/>';
    }
}

// Called when a message arrives
function onMessageArrived(message) {
	var d = new Date();
    //console.log(d.toLocaleString() + " Message: " + message.payloadString);
    document.getElementById("messages").innerHTML += d.toLocaleString() + "&nbsp;&nbsp;&nbsp;" + message.payloadString + '<br/>';
    if(message.payloadString == "Smoke detected") {
    	alert("Run!");
    }
    updateScroll();
}

// Called when the disconnection button is pressed
function startDisconnect() {
	if(client!=null)
		client.disconnect();
    //document.getElementById("messages").innerHTML += '<span>Disconnected</span><br/>';
}