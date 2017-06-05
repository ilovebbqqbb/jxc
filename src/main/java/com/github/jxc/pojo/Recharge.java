package com.github.jxc.pojo;

import java.util.Date;

public class Recharge {
    private Integer rechargeId;

    private Integer memberId;

    private Float rechargeNum;

    private Date rechargeTime;

    public Integer getRechargeId() {
        return rechargeId;
    }

    public void setRechargeId(Integer rechargeId) {
        this.rechargeId = rechargeId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Float getRechargeNum() {
        return rechargeNum;
    }

    public void setRechargeNum(Float rechargeNum) {
        this.rechargeNum = rechargeNum;
    }

    public Date getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(Date rechargeTime) {
        this.rechargeTime = rechargeTime;
    }
}