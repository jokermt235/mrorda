package com.example.future;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class MainActivity extends AppCompatActivity {

    private Button startButton;
    private TextView resultText;
    private ExecutorService executorService;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        startButton = findViewById(R.id.startButton);
        resultText = findViewById(R.id.resultText);
        executorService = Executors.newSingleThreadExecutor();

        startButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startAsyncTask();
            }
        });
    }

    private void startAsyncTask() {
        final int[] numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

        Callable<String> task = new Callable<String>() {
            @Override
            public String call() throws Exception {
                try {
                    Random random = new Random();
                    int delay = random.nextInt(3) + 1;
                    Thread.sleep(delay * 1000);

                    if (random.nextInt(10) < 3) {
                        throw new RuntimeException("Ошибка! Случайный сбой выполнения.");
                    }

                    int sum = 0;
                    for (int number : numbers) {
                        sum += number;
                    }
                    return "Sum: " + sum;

                } catch (Exception e) {
                    return "Ошибка: " + e.getMessage();
                }
            }
        };

        Future<String> future = executorService.submit(task);

        final Handler handler = new Handler(Looper.getMainLooper());
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    final String result = future.get();
                    handler.post(new Runnable() {
                        @Override
                        public void run() {
                            resultText.setText(result);
                        }
                    });
                } catch (InterruptedException | ExecutionException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (executorService != null) {
            executorService.shutdown();
        }
    }
}
