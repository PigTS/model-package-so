package com.so.model;

public class Interface {
    static{
        System.loadLibrary("ImageRecognitionEngine");
    }

    //init model
    public static native void initModel();
    //identify
    public static native String identify(String img_base64);
    //free model
    public static native void freeModel();
}
