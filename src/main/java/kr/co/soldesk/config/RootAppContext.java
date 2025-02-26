package kr.co.soldesk.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.soldesk.beans.User;
import kr.co.soldesk.mapper.DepartmentMapper;
import kr.co.soldesk.mapper.InstructorMapper;
import kr.co.soldesk.mapper.LectureMapper;
import kr.co.soldesk.mapper.StudentMapper;
import kr.co.soldesk.mapper.UserMapper;

//프로젝트 작업시 사용할 bean을 정의하는 클래스, 웹과 관련 빈을 제외한 빈들을 관리 
@Configuration
@PropertySource("/WEB-INF/properties/db.properties")
@ComponentScan("kr.co.soldesk.dao")
@ComponentScan("kr.co.soldesk.service")
public class RootAppContext {

    @Value("${db.classname}")
    private String db_classname;
    
    @Value("${db.url}")
    private String db_url;
    
    @Value("${db.username}")
    private String db_username;
    
    @Value("${db.password}")
    private String db_password;
    
    @Bean(name = "loginUserBean")
    @SessionScope
    @Lazy
    public User loginUserBean() {
    	
    	return new User();
    }

    @Bean
    public BasicDataSource dataSource() {
        BasicDataSource source = new BasicDataSource();
        source.setDriverClassName(db_classname);
        source.setUrl(db_url);
        source.setUsername(db_username);
        source.setPassword(db_password);

        return source;
    }
    
    @Bean
    public SqlSessionFactoryBean sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource);
        return factoryBean;
    }
    
	@Bean
	public MapperFactoryBean<StudentMapper> getStudentMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<StudentMapper> factoryBean = new MapperFactoryBean<StudentMapper>(StudentMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<DepartmentMapper> getDepartmentMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<DepartmentMapper> factoryBean = new MapperFactoryBean<DepartmentMapper>(DepartmentMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<InstructorMapper> getInstructorMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<InstructorMapper> factoryBean = new MapperFactoryBean<InstructorMapper>(InstructorMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<LectureMapper> getLectureMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<LectureMapper> factoryBean = new MapperFactoryBean<LectureMapper>(LectureMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

}