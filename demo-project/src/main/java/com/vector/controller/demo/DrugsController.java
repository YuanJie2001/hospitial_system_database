package com.vector.controller.demo;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.vector.entity.Drugs;
import com.vector.service.IDrugsService;
import com.vector.utils.R;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author YuanJie
 * @since 2025-01-03
 */
@RestController
@RequestMapping("/drugs")
@RequiredArgsConstructor
@Slf4j
public class DrugsController {

    private final IDrugsService drugsService;

    @PostMapping
    public R save(Drugs drugs) {
        return drugsService.save(drugs) ?
                R.okResult(drugs)
                : R.errorResult("添加失败");
    }

    @GetMapping("/list")
    public R list(Page page) {
        List list = drugsService.list(page);
        log.info("list:{}", list);
        return R.okResult(list);
    }
}
