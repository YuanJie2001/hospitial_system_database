package com.vector.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
@TableName("drug_view")
public class DrugView implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 药品编号
     */
    @TableField(value = "drug_id")
    private String drugId;

    /**
     * 药品名称
     */
    @TableField("drug_name")
    private String drugName;

    /**
     * 药品价格
     */
    @TableField("drug_price")
    private BigDecimal drugPrice;

    /**
     * 药品数量
     */
    @TableField("drug_quantity")
    private Long drugQuantity;

    /**
     * 存储位置
     */
    @TableField("drug_storage")
    private String drugStorage;

    /**
     * 生产日期
     */
    @TableField("drug_date")
    private LocalDateTime drugDate;

    /**
     * 有效期
     */
    @TableField("usefull_life")
    private LocalDateTime usefullLife;

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
