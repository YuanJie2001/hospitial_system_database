```sql
# 【强制】不得使用外键与级联，一切外键概念必须在应用层解决
# 【强制】禁止使用存储过程，存储过程难以调试和扩展，更没有移植性。
# 必备的三个字段id, create_time, update_time。
#更改数据库默认字符集
alter database hospital_information CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

#挂号
drop table register;
create table register -- 中间表patient_doctor
(
    r_num        varchar(10) primary key comment '挂号编号', -- 挂号编号
    r_patient_id varchar(20) not null comment '病人身份证号',  -- 病人编号
    r_P_name     varchar(20) not null comment '病人姓名',
    r_sex        varchar(2)  not null comment '性别',-- 性别
    r_dept       varchar(20) not null comment '挂号科室',-- 挂号部门
    r_name       varchar(10) not null comment '医生姓名',-- 医生姓名
    is_delete    tinyint     not null default 0 comment '0为未删除 1为已删除',
    create_time  datetime             DEFAULT CURRENT_TIMESTAMP comment '创建字段的时间',
    update_time  datetime             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '修改字段的时间'
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO register(r_num, r_patient_id,r_P_name, r_sex, r_dept, r_name)
VALUES ('222', '411282xxxxxxx1182', '病人1','女', '肛肠科', '尘思宇');
SELECT *
from register
where r_patient_id = '41128220230304554X';
UPDATE patient
SET p_name = '病人1'
WHERE p_atient_id = '41128220230304554X';
UPDATE register
SET r_name = '病人1'
WHERE r_patient_id = '41128220230304554X';
DELETE
FROM register
WHERE r_num = '222';
-- 级联操作
alter table patient
    add
        constraint patient_register_dept
            foreign key (p_atient_id) references register (r_patient_id) on delete cascade;
UPDATE patient
SET p_atient_id='41128220230304554X'
where p_name = '病人1';

DELETE
FROM patient
WHERE p_atient_id = '41128220230304554X';
create view register_view as
select *
from register;

select *
from register
where register.is_delete = 0;
insert into register(r_num, r_patient_id,r_P_name, r_sex, r_dept, r_name)
values ('101', '411282xxxxxxxx5555','病人1', '男', '牙科', '王渊洁');
insert into register(r_num, r_patient_id,r_P_name, r_sex, r_dept, r_name)
values ('102', '421282xxxxxxxx5554', '病人2','女', '妇产科', '莫家里昂');
insert into register(r_num, r_patient_id, r_P_name,r_sex, r_dept, r_name)
values ('103', '251381xxxxxxxx5553','病人3', '男', '肛肠科', '尘思语');
insert into register(r_num, r_patient_id,r_P_name, r_sex, r_dept, r_name)
values ('104', '315213xxxxxxxx5552','病人4', '女', '呼吸道科', '杰瑞哲');

create view register_view as
select *
from register
where register.is_delete = 0;
# 医师信息
create table doctor
(
    d_octor_id  varchar(10) primary key comment '医生编号',
    d_name      varchar(20)         not null comment '医生姓名',
    d_sex       varchar(2)          not null comment '医生性别',
    d_age       tinyint(4) unsigned not null comment '医生年龄',
    d_dept      varchar(50)         not null comment '科室',
    d_tel       varchar(20)         not null comment '电话',
    is_jobing   tinyint unsigned             default 1 not null comment '0为医生不在岗',
    is_delete   tinyint             not null default 0,
    create_time datetime                     DEFAULT CURRENT_TIMESTAMP,
    update_time datetime                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


select *
from doctor
where doctor.is_delete = 0;
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('001', '王渊洁', '男', 30, '牙科', '137xxxx321');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('002', '莫家里昂', '男', 30, '妇产科', '137xxxx111');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('003', '尘思语', '男', 30, '肛肠科', '137xxxx112');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('004', '杰瑞哲', '男', 30, '呼吸道科', '137xxxx113');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('005', '唐三', '女', 30, '肛肠科', '158xxxx113');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('006', '叶文洁', '女', 30, '骨科', '168xxxx113');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('007', '罗辑', '男', 30, '眼科', '133xxxx113');
INSERT INTO doctor(d_octor_id, d_name, d_sex, d_age, d_dept, d_tel)
VALUES ('008', '尘心', '女', 30, '心理科', '155xxxx113');

create view doctor_view as
select *
from doctor
where doctor.is_delete = 0;
# 病人信息
alter table patient
    add is_delete tinyint not null default 0;
alter table patient
    add create_time datetime DEFAULT CURRENT_TIMESTAMP;
alter table patient
    add update_time datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
create table patient
(
    p_atient_id varchar(20) primary key comment '病人身份证号',
    p_name      varchar(20)         not null comment '病人姓名',
    p_age       tinyint(4) unsigned not null comment '病人年龄',
    p_sex       varchar(2)          not null comment '病人性别',
    p_tel       varchar(20)         not null comment '病人电话',
    p_inf       varchar(50)         not null comment '病例',
    is_delete   tinyint             not null default 0 comment '0为未删除 1为已删除',
    create_time datetime                     DEFAULT CURRENT_TIMESTAMP comment '创建字段的时间',
    update_time datetime                     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '修改字段的时间'
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
select *
from patient
where patient.is_delete = 0;
INSERT INTO patient(p_atient_id, p_name, p_age, p_sex, p_tel, p_inf)
VALUES ('411282xxxxxxxx5555', '病人1', 24, '男', '141xxxx532', '牙疼');
INSERT INTO patient(p_atient_id, p_name, p_age, p_sex, p_tel, p_inf)
VALUES ('421282xxxxxxxx5554', '病人2', 24, '女', '141xxxx532', '生孩子');
INSERT INTO patient(p_atient_id, p_name, p_age, p_sex, p_tel, p_inf)
VALUES ('251381xxxxxxxx5553', '病人3', 40, '男', '121xxxx532', '胃疼腹泻');
INSERT INTO patient(p_atient_id, p_name, p_age, p_sex, p_tel, p_inf)
VALUES ('315213xxxxxxxx5552', '病人4', 40, '女', '137xxxx532', '肺炎');

create view patient_view as
select *
from patient
where patient.is_delete = 0;
# 药品信息
create table drugs
(
    drug_id       varchar(10) primary key comment '药品编号',
    drug_name     varchar(50)      not null comment '药品名称',
    drug_price    decimal unsigned not null comment '药品价格',
    drug_quantity bigint unsigned      not null comment '药品数量',
    drug_storage  varchar(50)      not null comment '存储位置',
    drug_date     datetime         not null comment '生产日期',
    usefull_life  datetime         not null comment '有效期',
    is_delete     tinyint          not null DEFAULT 0 comment '0为未删除 1为已删除',
    create_time   datetime                  DEFAULT CURRENT_TIMESTAMP comment '创建字段的时间',
    update_time   datetime                  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '修改字段的时间'
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


select *
from drugs
where drugs.is_delete = 0;
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100023', '感冒灵颗粒', 40.00, '821', 'A-2-302', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100024', '卡左双多巴缓释片', 56.00, '821', 'C-1-122', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100025', '拉莫三嗪片', 32.00, '821', 'C-2-102', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100026', '活血风湿膏', 28.00, '821', 'D-5-213', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100027', '龙穴羯', 63.00, '821', 'A-2-522', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100028', '龙胆泻肝片', 43.00, '821', 'B-2-302', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('100029', '黑漆丹', 54.00, '821', 'B-3-101', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000210', '黄连羊肝丸', 23.00, '821', 'A-1-002', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000211', '黄连解毒丸', 31.00, '821', 'A-1-101', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000212', '黄金波药酒', 43.00, '821', 'A-1-110', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000213', '黄连上清片', 12.00, '821', 'A-1-111', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000214', '维C银翘片', 8.00, '821', 'B-1-102', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000215', '骨筋丸胶囊', 37.00, '821', 'C-2-302', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000216', '除障泽海甫片', 14.00, '821', 'D-1-102', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000217', '除脂生发片', 36.00, '821', 'C-1-102', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000218', '远志糖浆', 43.00, '821', 'B-2-100', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000219', '还少丹', 40.00, '821', 'C-3-001', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000220', '当归补血丸', 20.00, '821', 'A-3-291', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000221', '胃康灵胶囊', 50.00, '821', 'B-2-231', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000222', '维生素B2注射液', 64.00, '821', 'C-1-213', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000223', '磺胺甲噁唑', 56.00, '821', 'B-1-221', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000224', '乙型肝炎病毒表面抗原检测试剂盒(化学发光法)', 240.00, '821', 'B-2-312', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000225', '多糖止血修复生物胶液（生物多糖冲洗胶液）', 140.00, '821', 'C-2-011', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000226', 'D-二聚体试剂盒', 40.00, '821', 'C-5-190', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000227', 'Pholcodine', 340.00, '821', 'C-4-302', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000228', '尼可待因', 221.00, '821', 'C-6-302', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000229', 'Ethylmorphine', 440.00, '821', 'C-4-202', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000230', 'Thiofentanyl', 540.00, '821', 'C-3-271', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000231', '2-二甲氨基-1-[3,4-(亚甲二氧基)苯基]-1-丙酮', 740.00, '821', 'C-4-102', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000232', '丹黄祛瘀胶囊', 40.00, '821', 'B-4-555', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000233', '生血宁片', 20.00, '821', 'B-2-222', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000234', '乌灵胶囊', 10.00, '821', 'A-3-231', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000235', '清热止咳颗粒', 23.00, '821', 'B-7-456', '2021-09-01', '2022-09-01');
INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000236', '杜仲补天素丸', 28.00, '821', 'A-6-291', '2021-09-01', '2022-09-01');


INSERT INTO drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
VALUES ('1000237', '长生不老丹', 9999.00, '821', 'C-8-291', '2021-09-01', '2022-09-01');

UPDATE drugs
SET drug_name = '聪明草'
WHERE drug_id = '1000237';

UPDATE drugs
SET IS_DELETE=1
WHERE drug_name = '聪明草';
SELECT drug_name, sum(drug_quantity)
FROM drug_view
GROUP BY drug_name;

create view drug_view as
SELECT *
FROM drugs
WHERE is_delete = 0;
# 缴费信息
drop table charge;
create table charge -- patient_drug
(
    toll_id       varchar(10) comment '收费员编号',
    t_name        varchar(10) not null comment '收费员姓名',
    patient_id    varchar(20) comment '病人编号',
    drug_id       varchar(10) comment '药品编号',
    drug_quantity int unsigned not null comment '药品数量',
    amount        decimal     not null comment '金额',
    is_delete     tinyint     not null default 0 comment '0为未删除 1为已删除',
    create_time   datetime             DEFAULT CURRENT_TIMESTAMP comment '创建字段的时间',
    update_time   datetime             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '修改字段的时间',
    primary key (toll_id, patient_id, drug_id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

select *
from charge
WHERE is_delete = 0;
INSERT INTO charge(toll_id, t_name, patient_id, drug_id, drug_quantity, amount)
VALUES ('101', '收费员1', '411282xxxxxxxx5555', '100023', '2', 80.00);
INSERT INTO charge(toll_id, t_name, patient_id, drug_id, drug_quantity, amount)
VALUES ('101', '收费员1', '421282xxxxxxxx5554', '1000233', '1', 20.00);
INSERT INTO charge(toll_id, t_name, patient_id, drug_id, drug_quantity, amount)
VALUES ('102', '收费员1', '251381xxxxxxxx5553', '1000229', '1', 440.00);
INSERT INTO charge(toll_id, t_name, patient_id, drug_id, drug_quantity, amount)
VALUES ('102', '收费员1', '315213xxxxxxxx5552', '1000230', '2', 1080.00);

create view charge_view as
select *
from charge;
# 取药票单
drop table PGM;
create table PGM -- 中间表 drug_charge
(
    t_id        varchar(10) comment '收费编号',
    drug_id     varchar(10) comment '药品编号',
    quantity    int unsigned      not null comment '数量',
    price       decimal unsigned not null comment '价格',
    is_delete   tinyint          not null default 0,
    create_time datetime                  DEFAULT CURRENT_TIMESTAMP,
    update_time datetime                  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    primary key (t_id, drug_id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

select *
from PGM;
insert into PGM(t_id, drug_id, quantity, price)
values ('001', '100023', '2', 80.00);
insert into PGM(t_id, drug_id, quantity, price)
values ('002', '1000233', '1', 20.00);
insert into PGM(t_id, drug_id, quantity, price)
values ('003', '1000229', '1', 440.00);
insert into PGM(t_id, drug_id, quantity, price)
values ('004', '1000230', '2', 1080.00);

create view PGM_view as
select *
from PGM
WHERE is_delete = 0;

# 处方信息
drop table recipel;
create table recipel -- 中间表 doctor_drug
(
    id           int unsigned primary key auto_increment,
    count        int unsigned not null comment '数量',
    doctor_id    varchar(10)  not null comment '医生编号',
    drug_id      varchar(10)  not null comment '药品编号',
    patient_name varchar(20)  not null comment '病人姓名',
    is_delete    tinyint      not null default 1,
    create_time  datetime              DEFAULT CURRENT_TIMESTAMP,
    update_time  datetime              DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


select *
from recipel;
INSERT INTO recipel(doctor_id, count, drug_id, patient_name)
VALUES ('001', '2', '100023', '病人1');
INSERT INTO recipel(doctor_id, count, drug_id, patient_name)
VALUES ('002', '1', '1000233', '病人2');
INSERT INTO recipel(doctor_id, count, drug_id, patient_name)
VALUES ('003', '1', '1000229', '病人3');
INSERT INTO recipel(doctor_id, count, drug_id, patient_name)
VALUES ('004', '2', '1000230', '病人4');
select *
from recipel;

create view recipel_view as
select *
from recipel
WHERE is_delete = 0;


# 支付凭据
drop table pay;
create table pay -- 中间表 patient_charge
(
    patient_id  varchar(20) comment '病人编号',
    t_id        varchar(10) comment '收费编号',
    price       decimal not null comment '价格',
    is_delete   tinyint not null default 0 comment '0为未删除 1为已删除',
    create_time datetime         DEFAULT CURRENT_TIMESTAMP comment '创建字段的时间',
    update_time datetime         DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '修改字段的时间',
    primary key (patient_id, t_id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

select *
from pay
WHERE is_delete = 0;
insert into pay(patient_id, t_id, price)
values ('411282xxxxxxxx5555', '001', 80.00);
insert into pay(patient_id, t_id, price)
values ('421282xxxxxxxx5554', '002', 20.00);
insert into pay(patient_id, t_id, price)
values ('251381xxxxxxxx5553', '003', 440.00);
insert into pay(patient_id, t_id, price)
values ('315213xxxxxxxx5552', '004', 1080.00);
create view pay_view as
select *
from pay;

-- 创建触发器，当药品入库、出库时自动修改库存；
# 操作处方   药品出库操作
delimiter $$ -- 自定义结束符号
create trigger recipel_update
    #存在过的错误,一些操作必须是插入后执行.
    after insert
    on recipel
    for EACH ROW
BEGIN
    #存在过的错误,没有把查询结果放到容器中
    #触发器从NEW.xxxx取得这个值并返回它
    SELECT @quantity=drug_quantity into @str
    FROM drugs WHERE NEW.drug_id = drugs.drug_id;
    IF @quantity <= 0 || NEW.count > @quantity THEN
        #存在过的错误,mysql触发器禁止一切隐式或显式的提交,回滚
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: 药品数量为零!';
    ELSE
        UPDATE drugs SET drug_quantity = drug_quantity - NEW.count WHERE drug_id=NEW.drug_id AND is_delete=0;
    end if;
end
$$ -- 自定义触发器结束
delimiter ;
drop trigger recipel_update;

INSERT INTO recipel(DOCTOR_ID, COUNT, DRUG_ID, PATIENT_NAME)
VALUES ('005', '2', '1000226', '病人6');


# 药品入库操作 触发器
# 触发器应该建立在视图上,这里直接是实体
# 关于这个触发器存在的问题  --> https://ask.csdn.net/questions/7590137
drop trigger drugs_trigger;
DELIMITER $$ -- 自定义结束符号
create trigger drugs_trigger
    AFTER UPDATE
    ON drugs
    FOR EACH ROW
BEGIN

    IF EXISTS(SELECT @drug_id FROM drugs WHERE NEW.drug_id)  THEN
        #不允许写update来操作同一张表,即禁止递归操作
        #update drugs SET drug_quantity = OLD.drug_quantity + NEW.drug_quantity where drug_id=NEW.drug_id;
        #触发器从NEW.xxxx取得这个值并返回它
        # 由于mysql的触发器十分简陋,不能屏蔽掉原语句,因此触发触发器的语句依然会被执行
        #因此有如下操作做到 instead of方法
        SET NEW.drug_quantity = OLD.drug_quantity + NEW.drug_quantity;
        SET NEW.drug_id = OLD.drug_id;
        SET NEW.drug_name = OLD.drug_name;
        SET NEW.drug_price = OLD.drug_price;
        SET NEW.drug_storage = OLD.drug_storage;
        SET NEW.drug_date = OLD.drug_date;
        SET NEW.usefull_life = OLD.usefull_life;
        REPLACE INTO  drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
        VALUES (NEW.drug_id,NEW.drug_name,NEW.drug_price,NEW.drug_quantity,NEW.drug_storage,NEW.drug_date,NEW.usefull_life);
    ELSE#必须是增强写法Replace into   这里的这种操作相当于sql server的instead of
        REPLACE INTO  drugs(drug_id, drug_name, drug_price, drug_quantity, drug_storage, drug_date, usefull_life)
    values (NEW.drug_id,NEW.drug_name,NEW.drug_price,NEW.drug_quantity,NEW.drug_storage,NEW.drug_date,NEW.usefull_life);
    END IF;
END
$$ -- 自定义触发器结束
DELIMITER ;

#   存在主键约束,所以插入相同数据必报错
UPDATE drugs
SET drug_id='1314251', drug_name='阳春白雪', drug_price=883.00, drug_quantity=200, drug_storage='F-4-291', drug_date='2021-09-01', usefull_life='2022-09-01'
WHERE drug_id='1314251';

select * from drugs where drug_id='1314251';

# 存储过程
drop procedure count_people_date;
DELIMITER $$
CREATE PROCEDURE count_people_date(

#     IN @begin_date datetime,  这样写是错误的
    IN begin_date datetime,
    IN end_date datetime
    )
BEGIN
    SELECT r_dept '科室',count(*) '问诊人数'
    FROM register
    WHERE update_time BETWEEN begin_date AND end_date AND is_delete=0
    GROUP BY r_dept ;
end $$
DELIMITER ;

CALL count_people_date('2021-12-04','2021-12-05');



```

我有一个问题.就是如果级联操作都在后端的话.那么i/o操作不就增大了吗?而触发器,级联操作等我可以牵一发而动全身.在数据库内部就能执行操作那么听说高可用是希望在后端处理的并且即使不是高并发集群也建议这样做。我想不通了，因为我觉得后端处理的话，会加大i/o的资源消耗。。。。除非数据库内部操作比这个更危险！以下答案我觉得较为理想分享给大家.

https://zhuanlan.zhihu.com/p/252840511

外键提供的几种在更新和删除时的不同行为都可以帮助我们保证数据库中数据的一致性和引用合法性，但是外键的使用也需要数据库承担额外的开销，在大多数服务都可以水平扩容的今天，高并发场景中使用外键确实会影响服务的吞吐量上限。在数据库之外手动实现外键的功能是可能的，但是却会带来很多维护上的成本或者需要我们在数据一致性上做出一些妥协。我们可以从可用性、一致性几个方面分析使用外键、模拟外键以及不使用外键的差异：

- 不使用外键牺牲了数据库中数据的一致性，但是却能够减少数据库的负载；
- 模拟外键将一部分工作移到了数据库之外，我们可能需要放弃一部分一致性以获得更高的可用性，但是为了这部分可用性，我们会付出更多的研发与维护成本，也增加了与数据库之间的网络通信次数；
- 使用外键保证了数据库中数据的一致性，也将全部的计算任务全部交给了数据库；

在大多数不需要高并发或者对一致性有较强要求的系统中，我们可以直接使用数据库提供的外键帮助我们对数据进行校验，但是在对一致性要求不高的、复杂的场景或者大规模的团队中，不使用外键也确实可以为数据库减负，而大团队也有更多的时间和精力去设计其他的方案，例如：分布式的关系型数据库。

当我们考虑应不应该在数据库中使用外键时，需要关注的核心我们的数据库承担这部分计算任务后会不会影响系统的可用性，在使用时也不应该一刀切的决定用或者不用外键，应该根据具体的场景做决策，我们在这里介绍了两个使用外键时可能遇到的问题：

- `RESTRICT` 外键会在更新和删除关系表中的数据时对外键约束的合法性进行检查，保证外键不会引用到不存在的记录；
- `CASCADE` 外键会在更新和删除关系表中的数据时触发对关联记录的更新和删除，在数据量较大的数据库中可能会有数量级的放大效果；

我们在很多时候其实并不能选择是否使用外键，大多数公司的 DBA 都会对数据库系统的使用有比较明确的规定，但是我们要清楚做出使用外键和不使用外键这一抉择的原因。到最后，我们还是来看一些比较开放的相关问题，有兴趣的读者可以仔细思考一下下面的问题：

- 数据库中还有哪些特性是我们在生产环境中不会使用的？为什么？
- 分布式的关系型数据库与 MySQL 等传统数据库有哪些区别？





**在建表中出现的一些问题:**

1.当有缺省值时最好要加上匹配字段!

![img](file:///C:\Users\78235\AppData\Roaming\Tencent\Users\782353676\QQ\WinTemp\RichOle\BS2$2FO[2`6_YLD3N6NMP_C.png)

