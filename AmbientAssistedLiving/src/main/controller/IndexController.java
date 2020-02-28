package main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import main.service.mqtt;

@Controller
public class IndexController {
	mqtt instance =  mqtt.getInstance();
	
    @RequestMapping("/{target}")
    public ModelAndView direct(@PathVariable String target, HttpServletRequest request, HttpServletResponse response) {
//    	try {
//    		instance.runSmokeSensor();
//		} catch (MqttException e) {
//			System.out.println("Error when running Mqtt");
//		}
        return new ModelAndView(target);
    }
}
