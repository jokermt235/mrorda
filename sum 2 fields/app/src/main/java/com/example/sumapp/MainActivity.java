package com.example.sumapp;

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText input1, input2;
    private Button calculateButton;
    private TextView result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize the views
        input1 = findViewById(R.id.input1);
        input2 = findViewById(R.id.input2);
        calculateButton = findViewById(R.id.calculateButton);
        result = findViewById(R.id.result);

        // Set onClickListener for the button
        calculateButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Get the text from input fields
                String number1 = input1.getText().toString();
                String number2 = input2.getText().toString();

                // Check if inputs are not empty
                if (!number1.isEmpty() && !number2.isEmpty()) {
                    // Parse the numbers to doubles and calculate the sum
                    double num1 = Double.parseDouble(number1);
                    double num2 = Double.parseDouble(number2);
                    double sum = num1 + num2;

                    // Show the result
                    result.setText("Sum: " + sum);
                } else {
                    result.setText("Please enter both numbers.");
                }
            }
        });
    }
}
