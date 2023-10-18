/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.thiennl.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author PC
 */
public class CartObject implements Serializable {

    private Map<String, Integer> items;

    public Map<String, Integer> getItem() {
        return items;
    }

    public boolean addItemToCart(String itemID) {
        boolean result = false;
        //1. valid item id
        if (itemID == null) {
            // do nothing
        } else if (itemID.trim().isEmpty()) {
            //do nothing
        } else {
            //2. check existed items ?
            if (this.items == null) {
                this.items = new HashMap<>();
            }
            int quantity = 1;
            if (this.items.containsKey(itemID)) {
                quantity = this.items.get(itemID) + 1;
            }
            this.items.put(itemID, quantity);
            result = true;
        }
        return result;
    }

    public boolean removeItemfromCart(String itemID) {
        boolean result = false;
        //1. valid item id
        if (itemID == null) {
            // do nothing
        } else if (itemID.trim().isEmpty()) {
            //do nothing
        } else {
            if (this.items == null) {

            } else {
                if(this.items.containsKey(itemID)){
                    this.items.remove(itemID);
                    result = true;
                }               
            }
        }
        return result;
    }
}
