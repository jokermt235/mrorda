package com.example.slider;


import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    private ImageView imageView;
    private Button nextButton, prevButton;
    private int currentImageIndex = 0;

    private int[] imageArray = {
            R.drawable.image1, // Индекс 0
            R.drawable.image2, // Индекс 1
            R.drawable.image3  // Индекс 2
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Инициализация элементов
        imageView = findViewById(R.id.imageView);
        nextButton = findViewById(R.id.nextButton);
        prevButton = findViewById(R.id.prevButton);

        // Обработчик для кнопки "Next"
        nextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Переход к следующему изображению
                currentImageIndex++;
                if (currentImageIndex >= imageArray.length) {
                    currentImageIndex = 0; // Зацикливаем на первое изображение
                }
                imageView.setImageResource(imageArray[currentImageIndex]);
            }
        });

        // Обработчик для кнопки "Previous"
        prevButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Переход к предыдущему изображению
                currentImageIndex--;
                if (currentImageIndex < 0) {
                    currentImageIndex = imageArray.length - 1; // Зацикливаем на последнее изображение
                }
                imageView.setImageResource(imageArray[currentImageIndex]);
            }
        });
    }
}
