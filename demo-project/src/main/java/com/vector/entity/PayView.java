package com.vector.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
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
@TableName("pay_view")
public class PayView implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 病人编号
     */
    @TableField("patient_id")
    private String patientId;

    /**
     * 收费编号
     */
    @TableField("t_id")
    private String tId;

    /**
     * 价格
     */
    @TableField("price")
    private BigDecimal price;

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
