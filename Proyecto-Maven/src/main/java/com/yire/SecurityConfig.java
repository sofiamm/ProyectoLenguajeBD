package com.yire;

import com.yire.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    LoginService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);    
    }
    @Override    
    protected void configure(HttpSecurity http)throws Exception {
        http.authorizeRequests()
                //IMPORTANTE: Todos los roles en la base de datos necesitan estar en mayusculas completamente
                //Si uno de los roles se llama "cocinero", en la base de datos se necesita llamar "ROLE_COCINERO"
                //ASD es un rol temporal, creado con la intension de probar la funcionalidad del WebSecurityConfigurerAdapter
                //
                //Para cada una de las vistas, como por ejemplo "/" para index, es necesario configurar los roles que los pueden ver
                //Si un grupo de vistas comparten el mismo set de permisos requeridos, se pueden juntar en un solo andMatchers
                //
                //Si varios roles pueden acceder una vista especifica, se pueden añadir dentro del mismo hasAnyRole,
                //luego del antMatchers que contenga a la vista en cuestion
                .antMatchers(//mappings like "/articulo/nuevo",          "/articulo/guardar",
                             "/")
                       .hasRole("ASD")
                .antMatchers("/articulo/listado",        "/cliente/listado",
                             "/categoria/listado")
                       .hasAnyRole("ADMIN", "VENDEDOR")
                .antMatchers(//"/"
                        "/articulo/listado"
                )
                       .hasAnyRole("ADMIN", "VENDEDOR", "USER")
                .and()
                    .formLogin()
                    .loginPage("/login")
                .and()
                    .exceptionHandling().accessDeniedPage("/errores/403");
    }
}