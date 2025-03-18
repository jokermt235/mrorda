package com.example.mixins;

import com.example.mixins.mixins.Brakeable;
import com.example.mixins.mixins.Honkable;
import com.example.mixins.mixins.Movable;

class Car implements Movable, Honkable, Brakeable {
    @Override
    public void move() {
        System.out.println("Машина едет.");
    }

    @Override
    public void honk() {
        System.out.println("Машина сигналит: Бип-бип!");
    }

    @Override
    public void brake() {
        System.out.println("Машина тормозит.");
    }
}
