package com.hnt.dental.util;

public class PagingUtils {
    private PagingUtils() {
    }
    public static int getCurrentItem(int pageNumber, int pageSize) {
        return (pageNumber - 1) * pageSize;
    }
    public static int getTotalPage(int totalItem, int pageSize) {
        return (int) Math.ceil((double) totalItem / pageSize);
    }
}
