package com.entity;

import java.sql.Date ;
import java.io.Serializable;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2019-01-26 09:01:18
 */
public class User implements Serializable {
    private static final long serialVersionUID = 992035439653409930L;
    
    private Integer id;
    
    private String name;
    
    private String oldname;
    
    private String sex;
    
    private Date  birth;

    private Integer fatherid;

    private Integer motherid;

    private String fathername;

    private String mothername;
    //头像路径
    private String img;
    
    private String text;
    
    private String temp1;
    
    private String temp2;
    
    private String temp3;
    
    private String temp4;

    public String getFathername() {
        return fathername;
    }

    public void setFathername(String fathername) {
        this.fathername = fathername;
    }

    public String getMothername() {
        return mothername;
    }

    public void setMothername(String mothername) {
        this.mothername = mothername;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOldname() {
        return oldname;
    }

    public void setOldname(String oldname) {
        this.oldname = oldname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date  getBirth() {
        return birth;
    }

    public void setBirth(Date  birth) {
        this.birth = birth;
    }

    public Integer getFatherid() {
        return fatherid;
    }

    public void setFatherid(Integer fatherid) {
        this.fatherid = fatherid;
    }

    public Integer getMotherid() {
        return motherid;
    }

    public void setMotherid(Integer motherid) {
        this.motherid = motherid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getTemp1() {
        return temp1;
    }

    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }

    public String getTemp2() {
        return temp2;
    }

    public void setTemp2(String temp2) {
        this.temp2 = temp2;
    }

    public String getTemp3() {
        return temp3;
    }

    public void setTemp3(String temp3) {
        this.temp3 = temp3;
    }

    public String getTemp4() {
        return temp4;
    }

    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }

}