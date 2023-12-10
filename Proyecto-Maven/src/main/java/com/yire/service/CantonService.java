/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.yire.service;

import com.yire.domain.Canton;
import java.util.List;

/**
 *
 * @author antho
 */
public interface CantonService {
    public List<Canton> getCantones();
    public List<List<Canton>> getCantones2();
}
