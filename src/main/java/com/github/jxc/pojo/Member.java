package com.github.jxc.pojo;

import java.util.Date;

public class Member {

	private Integer memberId;

    private String memberName;

    private String memberSex;

    private Date joinTime;

    private String memberTel;

    private String memberAdd;

    private String memberEmail;

    private Float memberMoney;

    private Integer memberType;

    private Integer memberPoint;

    private CardType cardType;
    
    public CardType getCardType() {
    	return cardType;
    }
    
    public void setCardType(CardType cardType) {
    	this.cardType = cardType;
    }
    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName == null ? null : memberName.trim();
    }

    public String getMemberSex() {
        return memberSex;
    }

    public void setMemberSex(String memberSex) {
        this.memberSex = memberSex == null ? null : memberSex.trim();
    }

    public Date getJoinTime() {
        return joinTime;
    }

    public void setJoinTime(Date joinTime) {
        this.joinTime = joinTime;
    }

    public String getMemberTel() {
        return memberTel;
    }

    public void setMemberTel(String memberTel) {
        this.memberTel = memberTel == null ? null : memberTel.trim();
    }

    public String getMemberAdd() {
        return memberAdd;
    }

    public void setMemberAdd(String memberAdd) {
        this.memberAdd = memberAdd == null ? null : memberAdd.trim();
    }

    public String getMemberEmail() {
        return memberEmail;
    }

    public void setMemberEmail(String memberEmail) {
        this.memberEmail = memberEmail == null ? null : memberEmail.trim();
    }

    public Float getMemberMoney() {
        return memberMoney;
    }

    public void setMemberMoney(Float memberMoney) {
        this.memberMoney = memberMoney;
    }

    public Integer getMemberType() {
        return memberType;
    }

    public void setMemberType(Integer memberType) {
        this.memberType = memberType;
    }

    public Integer getMemberPoint() {
        return memberPoint;
    }

    public void setMemberPoint(Integer memberPoint) {
        this.memberPoint = memberPoint;
    }
}