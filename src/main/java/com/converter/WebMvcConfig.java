package com.converter;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ConversionServiceFactoryBean;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.converter.Converter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration 
public class WebMvcConfig extends WebMvcConfigurerAdapter { 
	/** * 配置全局日期转换器 */
	@Bean 
	@Autowired 
	public ConversionService getConversionService(StrToDateConverter strToDateConverter){ 
		
		ConversionServiceFactoryBean factoryBean = new 	ConversionServiceFactoryBean();
		Set<Converter> converters = new HashSet<Converter>();
		converters.add(strToDateConverter);
		factoryBean.setConverters(converters);
		return factoryBean.getObject();
	}
}

