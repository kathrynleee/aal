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
    host = "192.168.43.79";
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
	console.log("onConnect");
	var topic = "HeartRate";
	var topic1 = "Step";
	var topic2 = "Glucose";
	var topic3 = "Movement";
    document.getElementById("messages").innerHTML += '<span>Subscribed to: ' + topic + '</span><br/>';
    document.getElementById("messages").innerHTML += '<span>Subscribed to: ' + topic1 + '</span><br/>';
    document.getElementById("messages").innerHTML += '<span>Subscribed to: ' + topic2 + '</span><br/>';
    document.getElementById("messages").innerHTML += '<span>Subscribed to: ' + topic3 + '</span><br/>';

    // Subscribe to the requested topic
    client.subscribe(topic);
    client.subscribe(topic1);
    client.subscribe(topic2);
    client.subscribe(topic3);
}

// Called when the client loses its connection
function onConnectionLost(responseObject) {
    document.getElementById("messages").innerHTML += '<span>ERROR: Connection lost</span><br/>';
    if (responseObject.errorCode !== 0) {
        document.getElementById("messages").innerHTML += '<span>ERROR: ' + responseObject.errorMessage + '</span><br/>';
    }
}

// Called when a message arrives
function onMessageArrived(message) {
	var d = new Date();
    console.log(d.toLocaleString() + " Message: " + message.payloadString);
    document.getElementById("messages").innerHTML += d.toLocaleString() + "&nbsp;&nbsp;&nbsp;from " + message.destinationName + ":&nbsp;&nbsp;&nbsp"  + message.payloadString + '<br/>';
    
    if(message.destinationName == "Step") {
    	var step = document.getElementById("Step");
    	step.innerHTML = Number(step.innerHTML) + Number(message.payloadString); 
    } else if(message.destinationName == "HeartRate"){
    	var heartRate = document.getElementById("HeartRate");
    	heartRate.innerHTML = message.payloadString; 
    } else if(message.destinationName == "Glucose"){
    	var glucose = document.getElementById("Glucose");
    	glucose.innerHTML += message.payloadString + "&nbsp;&nbsp;";
    } else {
    	var movement = document.getElementById("Movement");
    	movement.innerHTML = message.payloadString; 
    }
    updateScroll();
}

// Called when the disconnection button is pressed
function startDisconnect() {
	if(client!=null)
		client.disconnect();
    //document.getElementById("messages").innerHTML += '<span>Disconnected</span><br/>';
}