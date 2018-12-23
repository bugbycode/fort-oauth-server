package com.test;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.core.JsonProcessingException;

public class TestCode {
	
	private com.fasterxml.jackson.databind.ObjectMapper mapper = new com.fasterxml.jackson.databind.ObjectMapper();
	
	@Test
	public void testCode() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("json", "123");
		String json;
		try {
			json = mapper.writeValueAsString(map);
			System.out.println(json);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
