package com.example.slider;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    private ImageView leftImageView, centerImageView, rightImageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Инициализация элементов ImageView
        leftImageView = findViewById(R.id.leftImageView);
        centerImageView = findViewById(R.id.centerImageView);
        rightImageView = findViewById(R.id.rightImageView);

        // Можно установить изображения (если нужно динамически менять их)
        leftImageView.setImageResource(R.drawable.image1);
        centerImageView.setImageResource(R.drawable.image2);
        rightImageView.setImageResource(R.drawable.image3);
    }
}
