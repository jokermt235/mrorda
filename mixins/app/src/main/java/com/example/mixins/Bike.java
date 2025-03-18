package com.example.mixins;

import com.example.mixins.mixins.Brakeable;
import com.example.mixins.mixins.Movable;

class Bike implements Movable, Brakeable {
    @Override
    public void move() {
        System.out.println("Велосипед едет.");
    }

    @Override
    public void brake() {
        System.out.println("Велосипед тормозит.");
    }
}
