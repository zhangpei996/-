package com.school.enums;

/**
 * 分配状态枚举类
 */
public enum  StateStatus {
    //-2:未付款的订单 -1：用户取消 0:待发货 1:配送中 2:用户确认收货

    // -2:未付款的订单
    UNPAID(-2),
    // 用户取消
    CANCEL(-1),
    // 待发货
    NOSHIPPED(0),
    //配送中
    DELIVERIES(1),
    //用户确认收货
    OK(2);
    private Integer type;

    StateStatus(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
