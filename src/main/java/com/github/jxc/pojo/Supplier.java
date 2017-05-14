package com.github.jxc.pojo;

public class Supplier {
    private Integer supplierid;

    private String suppliername;

    private String suppliertel;

    private String supplierfax;

    private String supplieradd;

    private String city;

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername == null ? null : suppliername.trim();
    }

    public String getSuppliertel() {
        return suppliertel;
    }

    public void setSuppliertel(String suppliertel) {
        this.suppliertel = suppliertel == null ? null : suppliertel.trim();
    }

    public String getSupplierfax() {
        return supplierfax;
    }

    public void setSupplierfax(String supplierfax) {
        this.supplierfax = supplierfax == null ? null : supplierfax.trim();
    }

    public String getSupplieradd() {
        return supplieradd;
    }

    public void setSupplieradd(String supplieradd) {
        this.supplieradd = supplieradd == null ? null : supplieradd.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }
}