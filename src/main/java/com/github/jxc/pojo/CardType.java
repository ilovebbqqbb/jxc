package com.github.jxc.pojo;

public class CardType {
    private Integer cardTypeId;

    private String cardTypeName;

    private Integer discount;

    private Float pointRule;

    private Float defaultMoney;

    private Integer levelUp;

    public Integer getCardTypeId() {
        return cardTypeId;
    }

    public void setCardTypeId(Integer cardTypeId) {
        this.cardTypeId = cardTypeId;
    }

    public String getCardTypeName() {
        return cardTypeName;
    }

    public void setCardTypeName(String cardTypeName) {
        this.cardTypeName = cardTypeName == null ? null : cardTypeName.trim();
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Float getPointRule() {
        return pointRule;
    }

    public void setPointRule(Float pointRule) {
        this.pointRule = pointRule;
    }

    public Float getDefaultMoney() {
        return defaultMoney;
    }

    public void setDefaultMoney(Float defaultMoney) {
        this.defaultMoney = defaultMoney;
    }

    public Integer getLevelUp() {
        return levelUp;
    }

    public void setLevelUp(Integer levelUp) {
        this.levelUp = levelUp;
    }
}