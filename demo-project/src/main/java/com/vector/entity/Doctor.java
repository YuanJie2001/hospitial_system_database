package com.vector.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author YuanJie
 * @since 2025-01-03
 */
@Getter
@Setter
@TableName("doctor")
public class Doctor implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 医生编号
     */
    @TableId(value = "d_octor_id", type = IdType.ASSIGN_ID)
    private Integer dOctorId;

    /**
     * 医生姓名
     */
    @TableField("d_name")
    private String dName;

    /**
     * 医生性别
     */
    @TableField("d_sex")
    private String dSex;

    /**
     * 医生年龄
     */
    @TableField("d_age")
    private Integer dAge;

    /**
     * 科室
     */
    @TableField("d_dept")
    private String dDept;

    /**
     * 电话
     */
    @TableField("d_tel")
    private String dTel;

    /**
     * 0为医生不在岗
     */
    @TableField("is_jobing")
    private Integer isJobing;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;
}
