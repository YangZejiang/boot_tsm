package com.yzj.common.utils;

public class text {
    public static void main(String[] args) {
        String p = "T2019201";
        String type = p.substring(0,1);
        String semester = p.substring(1,6);
        String status = p.substring(6);
        String status2 = status.substring(1);
        System.out.println(type);
        System.out.println(semester);
        System.out.println(status2);
    }
}
