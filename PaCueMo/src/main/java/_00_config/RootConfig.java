package _00_config;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.google.gson.Gson;

import _00_initial_service.GlobalService;
import _10_Configs.StevenScanConfig;
import _9_21_club_model.ClubConfig;
import _9_23_league_model.LeagueConfig;

@Configuration
@ComponentScan({ "_9_41_member_model", "_00_initial_service" })
@Import({ ClubConfig.class, LeagueConfig.class, StevenScanConfig.class })
@EnableTransactionManagement
public class RootConfig
{

	@Bean
	@Profile("prod")
	public DataSource dataSource()
	{

		JndiObjectFactoryBean factoryBean = new JndiObjectFactoryBean();
		factoryBean.setJndiName(GlobalService.JNDI_DB_NAME);
		factoryBean.setResourceRef(true);
		factoryBean.setProxyInterface(javax.sql.DataSource.class);
		return (DataSource) factoryBean.getObject();
	}

	@Bean
	@Profile("default")
	public DataSource dataS()
	{

		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(GlobalService.DRIVER_NAME);
		ds.setUrl(GlobalService.DB_URL);
		ds.setUsername(GlobalService.USERID);
		ds.setPassword(GlobalService.PASSWORD);
		ds.setInitialSize(5);
		ds.setMaxTotal(10);
		return ds;
	}

	@Bean
	public DataSourceTransactionManager dataSourceTransactionManager(DataSource dataS)
	{
		return new DataSourceTransactionManager(dataS);
	}

	@Bean
	@Autowired
	public JdbcTemplate jdbcTemplate(DataSource dataSource)
	{
		return new JdbcTemplate(dataSource);
	}

	@Bean
	public Gson gson()
	{
		return new Gson();
	}

}
