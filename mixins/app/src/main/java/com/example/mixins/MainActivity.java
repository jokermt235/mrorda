package com.example.mixins;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Car car = new Car();
        Bike bike = new Bike();

        // Вызов методов, полученных через миксины
        car.move();    // Машина едет
        car.honk();    // Машина сигналит
        car.brake();   // Машина тормозит

        bike.move();   // Велосипед едет
        bike.brake();  // Велосипед тормозит
    }
}
