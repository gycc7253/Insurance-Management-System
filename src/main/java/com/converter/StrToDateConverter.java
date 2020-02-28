package com.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StrToDateConverter implements Converter<String, Date>{

	@Override
	public Date convert(String str) {
		SimpleDateFormat sif = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		
		try {
			date = sif.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	
}
