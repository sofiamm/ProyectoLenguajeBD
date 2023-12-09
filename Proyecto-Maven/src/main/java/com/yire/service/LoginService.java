package com.yire.service;

import com.yire.dao.EmpleadoDao;
import com.yire.dao.EmpleadoPuestoDao;
import com.yire.domain.Empleado;
import com.yire.dao.PuestoDao;
import com.yire.domain.EmpleadoPuesto;
import com.yire.domain.Puesto;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class LoginService implements UserDetailsService {

    @Autowired
    private EmpleadoDao EmpleadoDao;

    @Autowired
    private EmpleadoPuestoDao EmpleadoPuestoDao;

    @Autowired
    private PuestoDao puestoDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Empleado us = EmpleadoDao.findByAlias(username);
        EmpleadoPuesto ep = EmpleadoPuestoDao.findByIdEmpleado(us.getIdEmpleado());
        Puesto puesto = puestoDao.findByIdPuesto(ep.getIdPuesto());
        System.out.println(puesto.getNombre());

        List<GrantedAuthority> roles = new ArrayList<>();

        if (puesto.getNombre().equals("ROLE_ADMIN")) {
            roles.add(new SimpleGrantedAuthority("ROLE_USER"));
        }
        roles.add(new SimpleGrantedAuthority(puesto.getNombre()));
        System.out.println(roles.toString());
        UserDetails userDet = new User(us.getAlias(), "{noop}" + us.getPassword(), roles);
        return userDet;
    }

}
