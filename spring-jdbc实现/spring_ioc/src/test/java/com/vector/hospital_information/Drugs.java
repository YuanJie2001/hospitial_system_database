package com.vector.hospital_information;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;


public class Drugs {
    private String drug_id;
    private String drug_name;
    private BigDecimal drug_price;
    private String drug_quantity;
    private String drug_storage;
    private LocalDateTime drug_date;
    private LocalDateTime usefull_life;

    public Drugs() {
    }

    @Override
    public String toString() {
        return "Drugs{" +
                "drug_id='" + drug_id + '\'' +
                ", drug_name='" + drug_name + '\'' +
                ", drug_price=" + drug_price +
                ", drug_quantity='" + drug_quantity + '\'' +
                ", drug_storage='" + drug_storage + '\'' +
                ", drug_date=" + drug_date +
                ", usefull_life=" + usefull_life +
                '}';
    }

    public String getDrug_id() {
        return drug_id;
    }

    public void setDrug_id(String drug_id) {
        this.drug_id = drug_id;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public BigDecimal getDrug_price() {
        return drug_price;
    }

    public void setDrug_price(BigDecimal drug_price) {
        this.drug_price = drug_price;
    }

    public String getDrug_quantity() {
        return drug_quantity;
    }

    public void setDrug_quantity(String drug_quantity) {
        this.drug_quantity = drug_quantity;
    }

    public String getDrug_storage() {
        return drug_storage;
    }

    public void setDrug_storage(String drug_storage) {
        this.drug_storage = drug_storage;
    }

    public LocalDateTime getDrug_date() {
        return drug_date;
    }

    public void setDrug_date(LocalDateTime drug_date) {
        this.drug_date = drug_date;
    }

    public LocalDateTime getUsefull_life() {
        return usefull_life;
    }

    public void setUsefull_life(LocalDateTime usefull_life) {
        this.usefull_life = usefull_life;
    }
}
