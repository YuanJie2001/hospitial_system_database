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
@TableName("pgm_view")
public class PgmView implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 收费编号
     */
    @TableField("t_id")
    private String tId;

    /**
     * 药品编号
     */
    @TableField("drug_id")
    private String drugId;

    /**
     * 数量
     */
    @TableField("quantity")
    private Integer quantity;

    /**
     * 价格
     */
    @TableField("price")
    private BigDecimal price;

    @TableField("is_delete")
    private Integer isDelete;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;
}
