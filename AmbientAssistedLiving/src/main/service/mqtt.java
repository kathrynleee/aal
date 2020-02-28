package main.service;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.MqttPersistenceException;
import org.eclipse.paho.client.mqttv3.MqttTopic;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;

public class mqtt implements MqttCallback {
	MqttClient client;
	
	private static mqtt mqttInstance = null; 
	public static mqtt getInstance() { 
        if (mqttInstance == null) 
        	mqttInstance = new mqtt(); 
        return mqttInstance; 
    }
	
	private mqtt() {
		try {
			this.runSmokeSensor();
		} catch (MqttException e) {
			System.out.println("Error when running Mqtt");
		}
	}
	
	public void runSmokeSensor() throws MqttException {
		client = new MqttClient("tcp://127.0.0.1:1883", MqttClient.generateClientId());
		client.connect();
		System.out.println("[MQTT Client] Connected");
		client.setCallback(this);
		client.subscribe("test");
		//simulateSmokeSensor(client);
	}
	
	private void simulateSmokeSensor(MqttClient client) {
		Timer t = new Timer();
		t.schedule(new TimerTask() {
		    @Override
		    public void run() {
		    	MqttMessage message = new MqttMessage();
		    	Boolean[] bool = new Boolean[] {true, false, false, false, false, false, false};
			    Random rd = new Random(); 
			    int index = rd.nextInt(bool.length);
			    if(bool[index]) 
			    	message.setPayload("Smoke detected".getBytes());
			    else
			    	message.setPayload("No smoke".getBytes());
			    try {
					client.publish("SmokeSensor", message);
				} catch (MqttPersistenceException e) {
					e.printStackTrace();
				} catch (MqttException e) {
					e.printStackTrace();
				}
		    }
		}, 0, 10000);
	}

	public void connectionLost(Throwable throwable) {
	    System.out.println("Connection to MQTT broker lost!");
	  }

	public void messageArrived(String topic, MqttMessage mqttMessage) throws Exception {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    System.out.println(formatter.format(calendar.getTime()) + " From topic: " + topic + " Message received: "+ new String(mqttMessage.getPayload()) );
	}

	public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
	}
}