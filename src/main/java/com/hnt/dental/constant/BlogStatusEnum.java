package com.hnt.dental.constant;

import com.hnt.dental.entities.BlogStatus;

import java.util.ArrayList;
import java.util.List;

public enum BlogStatusEnum {
    PENDING, CANCEL, CONFIRM, ASSIGNED, DONE, REJECT;

    public static BlogStatusEnum getBookingStatusEnum(String status) {
        switch (status.toUpperCase()) {
            case "PENDING":
                return BlogStatusEnum.PENDING;
            case "CANCEL":
                return BlogStatusEnum.CANCEL;
            case "CONFIRM":
                return BlogStatusEnum.CONFIRM;
            case "ASSIGNED":
                return BlogStatusEnum.ASSIGNED;
            case "DONE":
                return BlogStatusEnum.DONE;
            case "REJECT":
                return BlogStatusEnum.REJECT;
            default:
                return null;
        }
    }

    public static String getBlogStatusString(int status) {
        switch (status) {
            case 0:
                return "PENDING";
            case 1:
                return "CANCEL";
            case 2:
                return "CONFIRM";
            case 3:
                return "ASSIGNED";
            case 4:
                return "DONE";
            case 5:
                return "REJECT";
            default:
                return null;
        }
    }

    public static List<BlogStatus> getAllBlogStatus() {
        List<BlogStatus> blogStatusList = new ArrayList<>();
        for (BlogStatusEnum blogStatusEnum : BlogStatusEnum.values()) {
            BlogStatus blogStatus = new BlogStatus();
            blogStatus.setId((blogStatusEnum.ordinal()) + "");
            blogStatus.setName(blogStatusEnum.name());
            blogStatusList.add(blogStatus);
        }
        return blogStatusList;
    }
}
