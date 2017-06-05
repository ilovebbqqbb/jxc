package com.github.jxc.pojo;

public class ConsumeDetail {
    private Integer consumeDetailId;

    private String consumeId;

    private Integer goodsId;

    private Integer goodsNum;

    private String remarks;

    public Integer getConsumeDetailId() {
        return consumeDetailId;
    }

    public void setConsumeDetailId(Integer consumeDetailId) {
        this.consumeDetailId = consumeDetailId;
    }

    public String getConsumeId() {
        return consumeId;
    }

    public void setConsumeId(String consumeId) {
        this.consumeId = consumeId == null ? null : consumeId.trim();
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}