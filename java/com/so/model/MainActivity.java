package com.so.model;

import androidx.appcompat.app.AppCompatActivity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import java.io.ByteArrayOutputStream;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "ImageRecognitionEngine:";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Bitmap bitmap = BitmapFactory.decodeStream(getClass().getResourceAsStream("/assets/test.jpg"));
        Interface.initModel();
        int count = 0;
        while(count < 100){
            String res = Interface.identify(bitmapToBase64((bitmap)));
            String[] res_split = res.split(" ");
            String cls = res_split[0];
            String value = res_split[1];
            Log.i(TAG, String.format("[so]--->predicted class: %s, predicted value: %s", cls, value));
            count ++;
        }
        Interface.freeModel();
    }

    private String bitmapToBase64(Bitmap bitmap){
        //将Bitmap转换成Base64字符串
        String str = null;
        ByteArrayOutputStream bStream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG,100, bStream);
        byte[] bytes = bStream.toByteArray();
        str = Base64.encodeToString(bytes, Base64.NO_WRAP);
        return str;
    }
}
