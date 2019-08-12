package com.bitcamp.comm;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@MapperScan(basePackages = { "com.bitcamp.mapper" })
public class DBConfigration {
	@Bean(destroyMethod = "close")
	public HikariDataSource dbconf() {
		HikariConfig hikari = new HikariConfig();
		hikari.setDriverClassName("oracle.jdbc.OracleDriver");
		hikari.setJdbcUrl("jdbc:oracle:thin:@10.10.10.91:1521:orcl");
		hikari.setUsername("hr");
		hikari.setPassword("hr");
		return new HikariDataSource(hikari);
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		HikariDataSource ds2 = dbconf();
		factory.setDataSource(ds2);
		factory.setMapperLocations(resolver.getResources("classpath:mapper/*.xml"));
		return factory.getObject();
	}

	@Bean
	public SqlSessionTemplate sqlsessionTemplate() throws Exception {
		SqlSessionFactory sqlSessionFactory = sqlSessionFactory();
		SqlSessionTemplate sqlsession = new SqlSessionTemplate(sqlSessionFactory);
		return sqlsession;
	}

	@Bean(name = "transactionManager")
	public DataSourceTransactionManager transactionManager() {
		DataSourceTransactionManager manager = new DataSourceTransactionManager();
		manager.setDataSource(dbconf());
		return manager;
	}
}
