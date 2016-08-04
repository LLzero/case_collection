package com.casecollection.backend.constants.enums;

/**
 * Created by zuodeng on 16/8/4.
 */
public enum StatusEnum {

    ENABLE(0,"启用"),
    DISABLE(1,"禁用"),
    ;

    private int value;

    private String message;

    StatusEnum(int value, String message) {
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
