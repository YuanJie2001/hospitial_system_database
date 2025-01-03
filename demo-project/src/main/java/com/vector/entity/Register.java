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
@TableName("register")
public class Register implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 挂号编号
     */
    @TableId(value = "r_num", type = IdType.ASSIGN_ID)
    private Integer rNum;

    /**
     * 病人身份证号
     */
    @TableField("r_patient_id")
    private String rPatientId;

    /**
     * 病人姓名
     */
    @TableField("r_P_name")
    private String rPName;

    /**
     * 性别
     */
    @TableField("r_sex")
    private String rSex;

    /**
     * 挂号科室
     */
    @TableField("r_dept")
    private String rDept;

    /**
     * 医生姓名
     */
    @TableField("r_name")
    private String rName;

    /**
     * 0为未删除 1为已删除
     */
    @TableField("is_delete")
    private Integer isDelete;

    /**
     * 创建字段的时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 修改字段的时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;
}
