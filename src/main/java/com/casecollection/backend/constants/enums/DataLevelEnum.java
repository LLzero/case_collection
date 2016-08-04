package com.casecollection.backend.constants.enums;

/**
 * Created by zuodeng on 16/8/4.
 */
public enum DataLevelEnum {

    ADMIN(0 ,"管理员"),
    SUPER(1 ,"超级用户"),
    COMMON(2 ,"普通用户"),
            ;

    private int value;

    private String message;

    DataLevelEnum( int value, String message) {
        this.value = value;
        this.message = message;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
