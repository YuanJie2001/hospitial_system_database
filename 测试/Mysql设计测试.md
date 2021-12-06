

```sql
-- 修改提交模式
set session autocommit=0; //会话的事务提交模式
show session variables like 'autocommit';

set global autocommit=0; //全局的事务提交模式
show global variables like 'autocommit';

ROLLBACK;
COMMIT;

-- 修改密码
ALTER user 'root'@'localhost' IDENTIFIED BY 'WJHwjh20010825.';
commit ;
//隔离级别操作
//mysql5.7及之后版本
show variables like 'transaction_isolation';或者select @@transaction_isolation;
//mysql5.7之前版本
show variables like 'tx_isolation';或者select @@tx_isolation;
//设置read uncommitted级别：
set session transaction isolation level read uncommitted;

//设置read committed级别：
set session transaction isolation level read committed;

//设置repeatable read级别：
set session transaction isolation level repeatable read;

//设置serializable级别：
set session transaction isolation level serializable;

```

规范化理论消除数据依赖, 



```
在mysql中插入数据，会发现自增主键由于以前删除过纪录或者其他原因造成主键id不连续，如果需要连续的话必须使用AUTO_INCREMENT =1；

PS：
ALTER TABLE `table` AUTO_INCREMENT =1
执行之后，不一定再插入的id就是1；而是表中id最大值+1。
这是MySQL中的执行结果。

eg:

alter table emp  AUTO_INCREMENT=1;
INSERT INTO emp(ename,job) VALUES('yangssss11ssss','laoshi') ;

每次执行两句一起。

到这里，问题就变的异常简单了：在每次插入之后都重置AUTO_INCREMENT的值。

如果插入的自定义函数或类的名称被定义成insert的话，那么就在此基础上扩展一个函数insert_continuous_id好了，其意为：保证自增主键连续的插入。

```

mysql自动化测试

时间采集

```shell
#!/bin/sh
INTERVAL=5
PREFIX=$INTERVAL-sec-status
RUNFILE=/root/shell_dir/hospital_information.xml
mysql -e 'SHOW GLOBAL VARIABLES' >> mysql-variables
while test -e $RUNFILE; do
  file=$(date +%F_%I)
  sleep=$(date +%s.%N | awk "{print $INTERVAL - (\$1 % $INTERVAL)}")
  sleep $sleep
  ts="$(date +"TS %s.%N %F %T")"
  loadavg="$(uptime)"
  echo "$ts $loadavg" >> $PREFIX-${file}-status
  mysql -e 'SHOW GLOBAL STATUS' >> $PREFIX-${file}-status &
  echo "$ts $loadavg" >> $PREFIX-${file}-innodbstatus
  mysql -e 'SHOW ENGINE INNODB STATUS\G' >> $PREFIX-${file}-innodbstatus &
  echo "$ts $loadavg" >> $PREFIX-${file}-processlist
  mysql -e 'SHOW FULL PROCESSLIST\G' >> $PREFIX-${file}-processlist &
  echo $ts
done
echo Exiting because $RUNFILE does not exist.

```

时间分析

```shell
#!/bin/sh
# This script converts SHOW GLOBAL STATUS into a tabulated format, one line
# per sample in the input, with the metrics divided by the time elapsed
# between samples.
awk '
  BEGIN {
    printf "#ts date time load QPS";
    fmt = " %.2f";
  }
  /^TS/ { # The timestamp lines begin with TS.
    ts = substr($2, 1, index($2, ".") - 1);
    load = NF - 2;
    diff = ts - prev_ts;
    prev_ts = ts;
    printf "\n%s %s %s %s", ts, $3, $4, substr($load, 1, length($load)-1);
  }
  /Queries/ {
    printf fmt, ($2-Queries)/diff;
    Queries=$2
  }
  ' "$@"

```

