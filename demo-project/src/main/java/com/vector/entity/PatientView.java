package com.vector.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * VIEW
 * </p>
 *
 * @author YuanJie
 * @since 2025-01-03
 */
@Getter
@Setter
@TableName("patient_view")
public class PatientView implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 病人身份证号
     */
    @TableField("p_atient_id")
    private String pAtientId;

    /**
     * 病人姓名
     */
    @TableField("p_name")
    private String pName;

    /**
     * 病人年龄
     */
    @TableField("p_age")
    private Integer pAge;

    /**
     * 病人性别
     */
    @TableField("p_sex")
    private String pSex;

    /**
     * 病人电话
     */
    @TableField("p_tel")
    private String pTel;

    /**
     * 病例
     */
    @TableField("p_inf")
    private String pInf;

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
