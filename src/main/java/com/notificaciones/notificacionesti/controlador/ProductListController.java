/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.notificaciones.notificacionesti.controlador;

/**
 *
 * @author edgar
 */
import com.notificaciones.notificacionesti.modelo.Product;
import com.notificaciones.notificacionesti.modelo.ProductDAO;
import org.ocpsoft.rewrite.annotation.Join;
import org.ocpsoft.rewrite.annotation.RequestAction;
import org.ocpsoft.rewrite.el.ELBeanName;
import org.ocpsoft.rewrite.faces.annotation.Deferred;
import org.ocpsoft.rewrite.faces.annotation.IgnorePostback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;

@Scope (value = "session")
@Component (value = "productList")
@ELBeanName(value = "productList")
@Join(path = "/", to = "/product-list.jsf")
public class ProductListController {
    @Autowired
    private ProductDAO productRepository;

    private List<Product> products;

    @Deferred
    @RequestAction
    @IgnorePostback
    public void loadData() {
        products = productRepository.findAll();
    }

    public List<Product> getProducts() {
        return products;
    }
}