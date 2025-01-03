package com.vector.controller.demo;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.vector.entity.Doctor;
import com.vector.service.IDoctorService;
import com.vector.utils.R;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author YuanJie
 * @since 2025-01-03
 */
@RestController
@RequestMapping("/doctor")
@RequiredArgsConstructor
@Slf4j
public class DoctorController {

    private final IDoctorService doctorService;



    @GetMapping("/list")
    public R list() {
        return R.okResult(doctorService.list());
    }

    @PostMapping("/get")
    public R getByCondition(@RequestBody Doctor doctor, Page page) {
        LambdaQueryWrapper<Doctor> queryWrapper = Wrappers.lambdaQuery(Doctor.class)
                .eq(Doctor::getIsJobing, 1L)
                .like(Doctor::getDName, doctor.getDName())
                .like(Doctor::getDDept, doctor.getDDept());
        Page doctorIPage = doctorService.page(page, queryWrapper);
        log.info("查询结果：{}", doctorIPage);
        return R.okResult(doctorIPage);
    }

    @PostMapping
    public R save(@RequestBody Doctor doctor) {
        return R.okResult(doctorService.save(doctor));
    }

}
