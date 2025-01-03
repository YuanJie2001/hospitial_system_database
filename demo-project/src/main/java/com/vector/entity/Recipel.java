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
@TableName("recipel")
public class Recipel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Integer id;

    /**
     * 数量
     */
    @TableField("count")
    private Integer count;

    /**
     * 医生编号
     */
    @TableField("doctor_id")
    private String doctorId;

    /**
     * 药品编号
     */
    @TableField("drug_id")
    private String drugId;

    /**
     * 病人姓名
     */
    @TableField("patient_name")
    private String patientName;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;
}
