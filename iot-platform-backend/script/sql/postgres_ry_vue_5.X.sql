-- ----------------------------
-- 1、用户信息表
-- ----------------------------
drop table if exists sys_user;
create table if not exists sys_user
(
    user_id     int8,
    user_name   varchar(30)  not null,
    nick_name   varchar(30)  not null,
    user_type   varchar(10)  default 'sys_user'::varchar,
    email       varchar(50)  default ''::varchar,
    phonenumber varchar(11)  default ''::varchar,
    sex         char         default '0'::bpchar,
    avatar      int8,
    password    varchar(100) default ''::varchar,
    status      char         default '0'::bpchar,
    del_flag    char         default '0'::bpchar,
    login_ip    varchar(128) default ''::varchar,
    login_date  timestamp,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint "sys_user_pk" primary key (user_id)
    );


comment on table sys_user               is '用户信息表';
comment on column sys_user.user_id      is '用户ID';
comment on column sys_user.user_name    is '用户账号';
comment on column sys_user.nick_name    is '用户昵称';
comment on column sys_user.user_type    is '用户类型（sys_user系统用户）';
comment on column sys_user.email        is '用户邮箱';
comment on column sys_user.phonenumber  is '手机号码';
comment on column sys_user.sex          is '用户性别（0男 1女 2未知）';
comment on column sys_user.avatar       is '头像地址';
comment on column sys_user.password     is '密码';
comment on column sys_user.status       is '帐号状态（0正常 1停用）';
comment on column sys_user.del_flag     is '删除标志（0代表存在 2代表删除）';
comment on column sys_user.login_ip     is '最后登陆IP';
comment on column sys_user.login_date   is '最后登陆时间';
comment on column sys_user.create_by    is '创建者';
comment on column sys_user.create_time  is '创建时间';
comment on column sys_user.update_by    is '更新者';
comment on column sys_user.update_time  is '更新时间';
comment on column sys_user.remark       is '备注';

-- ----------------------------

-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1, 'admin', 'eminem', 'sys_user', 'crazyLionLi@163.com', '15888888888', '1', null, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', now(),  1, now(), null, null, '管理员');
insert into sys_user values(2, 'xie', '卡特琳娜', 'sys_user', 'crazyLionLi@qq.com',  '15666666666', '1', null, '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', now(),  1, now(), null, null, '测试员');



-- ----------------------------
-- 第三方平台授权表
-- ----------------------------
create table sys_social
(
    id                 int8             not null,
    user_id            int8             not null,
    auth_id            varchar(255)     not null,
    source             varchar(255)     not null,
    open_id            varchar(255)     default null::varchar,
    user_name          varchar(30)      not null,
    nick_name          varchar(30)      default ''::varchar,
    email              varchar(255)     default ''::varchar,
    avatar             varchar(500)     default ''::varchar,
    access_token       varchar(255)     not null,
    expire_in          int8             default null,
    refresh_token      varchar(255)     default null::varchar,
    access_code        varchar(255)     default null::varchar,
    union_id           varchar(255)     default null::varchar,
    scope              varchar(255)     default null::varchar,
    token_type         varchar(255)     default null::varchar,
    id_token           varchar(255)     default null::varchar,
    mac_algorithm      varchar(255)     default null::varchar,
    mac_key            varchar(255)     default null::varchar,
    code               varchar(255)     default null::varchar,
    oauth_token        varchar(255)     default null::varchar,
    oauth_token_secret varchar(255)     default null::varchar,
    create_dept        int8,
    create_by          int8,
    create_time        timestamp,
    update_by          int8,
    update_time        timestamp,
    del_flag           char             default '0'::bpchar,
    constraint "pk_sys_social" primary key (id)
);

comment on table   sys_social                   is '社会化关系表';
comment on column  sys_social.id                is '主键';
comment on column  sys_social.user_id           is '用户ID';
comment on column  sys_social.auth_id           is '平台+平台唯一id';
comment on column  sys_social.source            is '用户来源';
comment on column  sys_social.open_id           is '平台编号唯一id';
comment on column  sys_social.user_name         is '登录账号';
comment on column  sys_social.nick_name         is '用户昵称';
comment on column  sys_social.email             is '用户邮箱';
comment on column  sys_social.avatar            is '头像地址';
comment on column  sys_social.access_token      is '用户的授权令牌';
comment on column  sys_social.expire_in         is '用户的授权令牌的有效期，部分平台可能没有';
comment on column  sys_social.refresh_token     is '刷新令牌，部分平台可能没有';
comment on column  sys_social.access_code       is '平台的授权信息，部分平台可能没有';
comment on column  sys_social.union_id          is '用户的 unionid';
comment on column  sys_social.scope             is '授予的权限，部分平台可能没有';
comment on column  sys_social.token_type        is '个别平台的授权信息，部分平台可能没有';
comment on column  sys_social.id_token          is 'id token，部分平台可能没有';
comment on column  sys_social.mac_algorithm     is '小米平台用户的附带属性，部分平台可能没有';
comment on column  sys_social.mac_key           is '小米平台用户的附带属性，部分平台可能没有';
comment on column  sys_social.code              is '用户的授权code，部分平台可能没有';
comment on column  sys_social.oauth_token       is 'Twitter平台用户的附带属性，部分平台可能没有';
comment on column  sys_social.oauth_token_secret is 'Twitter平台用户的附带属性，部分平台可能没有';
comment on column  sys_social.create_by         is '创建者';
comment on column  sys_social.create_time       is '创建时间';
comment on column  sys_social.update_by         is '更新者';
comment on column  sys_social.update_time       is '更新时间';
comment on column  sys_social.del_flag          is '删除标志（0代表存在 2代表删除）';


-- ----------------------------
-- 系统授权表
-- ----------------------------
drop table if exists sys_client;
create table sys_client (
                            id                  int8,
                            client_id           varchar(64)   default ''::varchar,
                            client_key          varchar(32)   default ''::varchar,
                            client_secret       varchar(255)  default ''::varchar,
                            grant_type          varchar(255)  default ''::varchar,
                            device_type         varchar(32)   default ''::varchar,
                            active_timeout      int4          default 1800,
                            timeout             int4          default 604800,
                            status              char(1)       default '0'::bpchar,
                            del_flag            char(1)       default '0'::bpchar,
                            create_by           int8,
                            create_time         timestamp,
                            update_by           int8,
                            update_time         timestamp,
                            constraint sys_client_pk primary key (id)
);

comment on table sys_client                         is '系统授权表';
comment on column sys_client.id                     is '主建';
comment on column sys_client.client_id              is '客户端id';
comment on column sys_client.client_key             is '客户端key';
comment on column sys_client.client_secret          is '客户端秘钥';
comment on column sys_client.grant_type             is '授权类型';
comment on column sys_client.device_type            is '设备类型';
comment on column sys_client.active_timeout         is 'token活跃超时时间';
comment on column sys_client.timeout                is 'token固定超时';
comment on column sys_client.status                 is '状态（0正常 1停用）';
comment on column sys_client.del_flag               is '删除标志（0代表存在 2代表删除）';
comment on column sys_client.create_by              is '创建者';
comment on column sys_client.create_time            is '创建时间';
comment on column sys_client.update_by              is '更新者';
comment on column sys_client.update_time            is '更新时间';

insert into sys_client values (1, 'e5cd7e4891bf95d1d19206ce24a7b32e', 'pc', 'pc123', 'password,social', 'pc', 1800, 604800, 0, 0, 1, now(), 1, now());
insert into sys_client values (2, '428a8310cd442757ae699df5d894f051', 'app', 'app123', 'password,sms,social', 'app', 1800, 604800, 0, 0, 1, now(), 1, now());




-- ----------------------------
-- OSS对象存储表
-- ----------------------------
drop table if exists sys_oss;
create table if not exists sys_oss
(
    oss_id        int8,
    file_name     varchar(255) default ''::varchar not null,
    original_name varchar(255) default ''::varchar not null,
    file_suffix   varchar(10)  default ''::varchar not null,
    url           varchar(500) default ''::varchar not null,
    create_dept   int8,
    create_by     int8,
    create_time   timestamp,
    update_by     int8,
    update_time   timestamp,
    service       varchar(20)  default 'minio'::varchar,
    constraint sys_oss_pk primary key (oss_id)
    );

comment on table sys_oss                    is 'OSS对象存储表';
comment on column sys_oss.oss_id            is '对象存储主键';
comment on column sys_oss.tenant_id         is '租户编码';
comment on column sys_oss.file_name         is '文件名';
comment on column sys_oss.original_name     is '原名';
comment on column sys_oss.file_suffix       is '文件后缀名';
comment on column sys_oss.url               is 'URL地址';
comment on column sys_oss.create_by         is '上传人';
comment on column sys_oss.create_dept       is '创建部门';
comment on column sys_oss.create_time       is '创建时间';
comment on column sys_oss.update_by         is '更新者';
comment on column sys_oss.update_time       is '更新时间';
comment on column sys_oss.service           is '服务商';

-- ----------------------------
-- OSS对象存储动态配置表
-- ----------------------------
drop table if exists sys_oss_config;
create table if not exists sys_oss_config
(
    oss_config_id int8,
    tenant_id     varchar(20)  default '000000'::varchar,
    config_key    varchar(20)  default ''::varchar not null,
    access_key    varchar(255) default ''::varchar,
    secret_key    varchar(255) default ''::varchar,
    bucket_name   varchar(255) default ''::varchar,
    prefix        varchar(255) default ''::varchar,
    endpoint      varchar(255) default ''::varchar,
    domain        varchar(255) default ''::varchar,
    is_https      char         default 'N'::bpchar,
    region        varchar(255) default ''::varchar,
    access_policy char(1)      default '1'::bpchar not null,
    status        char         default '1'::bpchar,
    ext1          varchar(255) default ''::varchar,
    create_dept   int8,
    create_by     int8,
    create_time   timestamp,
    update_by     int8,
    update_time   timestamp,
    remark        varchar(500) default ''::varchar,
    constraint sys_oss_config_pk primary key (oss_config_id)
    );

comment on table sys_oss_config                 is '对象存储配置表';
comment on column sys_oss_config.oss_config_id  is '主建';
comment on column sys_oss_config.tenant_id      is '租户编码';
comment on column sys_oss_config.config_key     is '配置key';
comment on column sys_oss_config.access_key     is 'accessKey';
comment on column sys_oss_config.secret_key     is '秘钥';
comment on column sys_oss_config.bucket_name    is '桶名称';
comment on column sys_oss_config.prefix         is '前缀';
comment on column sys_oss_config.endpoint       is '访问站点';
comment on column sys_oss_config.domain         is '自定义域名';
comment on column sys_oss_config.is_https       is '是否https（Y=是,N=否）';
comment on column sys_oss_config.region         is '域';
comment on column sys_oss_config.access_policy  is '桶权限类型(0=private 1=public 2=custom)';
comment on column sys_oss_config.status         is '是否默认（0=是,1=否）';
comment on column sys_oss_config.ext1           is '扩展字段';
comment on column sys_oss_config.create_dept    is '创建部门';
comment on column sys_oss_config.create_by      is '创建者';
comment on column sys_oss_config.create_time    is '创建时间';
comment on column sys_oss_config.update_by      is '更新者';
comment on column sys_oss_config.update_time    is '更新时间';
comment on column sys_oss_config.remark         is '备注';

insert into sys_oss_config values (1, '000000', 'minio',  'ruoyi',            'ruoyi123',        'ruoyi',             '', '127.0.0.1:9000',                      '','N', '',            '1', '0', '', 103, 1, now(), 1, now(), null);
insert into sys_oss_config values (2, '000000', 'qiniu',  'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 's3-cn-north-1.qiniucs.com',           '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), null);
insert into sys_oss_config values (3, '000000', 'aliyun', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi',             '', 'oss-cn-beijing.aliyuncs.com',         '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), null);
insert into sys_oss_config values (4, '000000', 'qcloud', 'XXXXXXXXXXXXXXX',  'XXXXXXXXXXXXXXX', 'ruoyi-1250000000',  '', 'cos.ap-beijing.myqcloud.com',         '','N', 'ap-beijing',  '1', '1', '', 103, 1, now(), 1, now(), null);
insert into sys_oss_config values (5, '000000', 'image',  'ruoyi',            'ruoyi123',        'ruoyi',             'image', '127.0.0.1:9000',                 '','N', '',            '1', '1', '', 103, 1, now(), 1, now(), NULL);



-- ----------------------------
-- 4、角色信息表
-- ----------------------------
drop table if exists sys_role;
create table if not exists sys_role
(
    role_id             int8,
    role_name           varchar(30)  not null,
    role_key            varchar(100) not null,
    role_sort           int4         not null,
    data_scope          char         default '1'::bpchar,
    menu_check_strictly bool         default true,
    status              char         not null,
    del_flag            char         default '0'::bpchar,
    create_dept         int8,
    create_by           int8,
    create_time         timestamp,
    update_by           int8,
    update_time         timestamp,
    remark              varchar(500) default null::varchar,
    constraint "sys_role_pk" primary key (role_id)
    );

comment on table sys_role                       is '角色信息表';
comment on column sys_role.role_id              is '角色ID';
comment on column sys_role.role_name            is '角色名称';
comment on column sys_role.role_key             is '角色权限字符串';
comment on column sys_role.role_sort            is '显示顺序';
comment on column sys_role.data_scope           is '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';
comment on column sys_role.menu_check_strictly  is '菜单树选择项是否关联显示';
comment on column sys_role.status               is '角色状态（0正常 1停用）';
comment on column sys_role.del_flag             is '删除标志（0代表存在 2代表删除）';
comment on column sys_role.create_dept          is '创建部门';
comment on column sys_role.create_by            is '创建者';
comment on column sys_role.create_time          is '创建时间';
comment on column sys_role.update_by            is '更新者';
comment on column sys_role.update_time          is '更新时间';
comment on column sys_role.remark               is '备注';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '超级管理员',  'superadmin',  1, '1', 't', '0', '0', 103, 1, now(), null, null, '超级管理员');
insert into sys_role values('2', '普通角色',    'common', 2, '2', 't', '0', '0', 103, 1, now(), null, null, '普通角色');


-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
drop table if exists sys_menu;
create table if not exists sys_menu
(
    menu_id     int8,
    menu_name   varchar(50) not null,
    parent_id   int8         default 0,
    order_num   int4         default 0,
    path        varchar(200) default ''::varchar,
    component   varchar(255) default null::varchar,
    query_param varchar(255) default null::varchar,
    is_frame    char         default '1'::bpchar,
    is_cache    char         default '0'::bpchar,
    menu_type   char         default ''::bpchar,
    visible     char         default '0'::bpchar,
    status      char         default '0'::bpchar,
    perms       varchar(100) default null::varchar,
    icon        varchar(100) default '#'::varchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default ''::varchar,
    constraint "sys_menu_pk" primary key (menu_id)
    );

comment on table sys_menu               is '菜单权限表';
comment on column sys_menu.menu_id      is '菜单ID';
comment on column sys_menu.menu_name    is '菜单名称';
comment on column sys_menu.parent_id    is '父菜单ID';
comment on column sys_menu.order_num    is '显示顺序';
comment on column sys_menu.path         is '路由地址';
comment on column sys_menu.component    is '组件路径';
comment on column sys_menu.query_param  is '路由参数';
comment on column sys_menu.is_frame     is '是否为外链（0是 1否）';
comment on column sys_menu.is_cache     is '是否缓存（0缓存 1不缓存）';
comment on column sys_menu.menu_type    is '菜单类型（M目录 C菜单 F按钮）';
comment on column sys_menu.visible      is '显示状态（0显示 1隐藏）';
comment on column sys_menu.status       is '菜单状态（0正常 1停用）';
comment on column sys_menu.perms        is '权限标识';
comment on column sys_menu.icon         is '菜单图标';
comment on column sys_menu.create_dept  is '创建部门';
comment on column sys_menu.create_by    is '创建者';
comment on column sys_menu.create_time  is '创建时间';
comment on column sys_menu.update_by    is '更新者';
comment on column sys_menu.update_time  is '更新时间';
comment on column sys_menu.remark       is '备注';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', '系统管理', '0', '1', 'system',           null, '', '1', '0', 'M', '0', '0', '', 'system',   103, 1, now(), null, null, '系统管理目录');
insert into sys_menu values('2', '系统监控', '0', '3', 'monitor',          null, '', '1', '0', 'M', '0', '0', '', 'monitor',  103, 1, now(), null, null, '系统监控目录');
insert into sys_menu values('3', '系统工具', '0', '4', 'tool',             null, '', '1', '0', 'M', '0', '0', '', 'tool',     103, 1, now(), null, null, '系统工具目录');
insert into sys_menu values('4', '物联网平台', '0', '5', 'https://gitee.com/eminem-my-love/iot-platform', null, '', '0', '0', 'M', '0', '0', '', 'guide',    103, 1, now(), null, null, '物联网平台官网地址');
-- 二级菜单
insert into sys_menu values('100',  '用户管理',     '1',   '1', 'user',             'system/user/index',            '', '1', '0', 'C', '0', '0', 'system:user:list',            'user',          103, 1, now(), null, null, '用户管理菜单');
insert into sys_menu values('101',  '角色管理',     '1',   '2', 'role',             'system/role/index',            '', '1', '0', 'C', '0', '0', 'system:role:list',            'peoples',       103, 1, now(), null, null, '角色管理菜单');
insert into sys_menu values('102',  '菜单管理',     '1',   '3', 'menu',             'system/menu/index',            '', '1', '0', 'C', '0', '0', 'system:menu:list',            'tree-table',    103, 1, now(), null, null, '菜单管理菜单');
insert into sys_menu values('105',  '字典管理',     '1',   '6', 'dict',             'system/dict/index',            '', '1', '0', 'C', '0', '0', 'system:dict:list',            'dict',          103, 1, now(), null, null, '字典管理菜单');
insert into sys_menu values('106',  '参数设置',     '1',   '7', 'config',           'system/config/index',          '', '1', '0', 'C', '0', '0', 'system:config:list',          'edit',          103, 1, now(), null, null, '参数设置菜单');
insert into sys_menu values('107',  '通知公告',     '1',   '8', 'notice',           'system/notice/index',          '', '1', '0', 'C', '0', '0', 'system:notice:list',          'message',       103, 1, now(), null, null, '通知公告菜单');
insert into sys_menu values('108',  '日志管理',     '1',   '9', 'log',              '',                             '', '1', '0', 'M', '0', '0', '',                            'log',           103, 1, now(), null, null, '日志管理菜单');
insert into sys_menu values('109',  '在线用户',     '2',   '1', 'online',           'monitor/online/index',         '', '1', '0', 'C', '0', '0', 'monitor:online:list',         'online',        103, 1, now(), null, null, '在线用户菜单');
insert into sys_menu values('113',  '缓存监控',     '2',   '5', 'cache',            'monitor/cache/index',          '', '1', '0', 'C', '0', '0', 'monitor:cache:list',          'redis',         103, 1, now(), null, null, '缓存监控菜单');
insert into sys_menu values('114',  '表单构建',     '3',   '1', 'build',            'tool/build/index',             '', '1', '0', 'C', '0', '0', 'tool:build:list',             'build',         103, 1, now(), null, null, '表单构建菜单');
insert into sys_menu values('115',  '代码生成',     '3',   '2', 'gen',              'tool/gen/index',               '', '1', '0', 'C', '0', '0', 'tool:gen:list',               'code',          103, 1, now(), null, null, '代码生成菜单');
insert into sys_menu values('123',  '客户端管理',   '1',   '11', 'client',           'system/client/index',          '', '1', '0', 'C', '0', '0', 'system:client:list',          'international', 103, 1, now(), null, null, '客户端管理菜单');

-- springboot-admin监控
insert into sys_menu values('117',  'Admin监控',   '2',   '5',  'Admin',            'monitor/admin/index',         '', '1', '0', 'C', '0', '0', 'monitor:admin:list',          'dashboard',     103, 1, now(), null, null, 'Admin监控菜单');
-- oss菜单
insert into sys_menu values('118',  '文件管理',     '1',   '10', 'oss',              'system/oss/index',            '', '1', '0', 'C', '0', '0', 'system:oss:list',             'upload',        103, 1, now(), null, null, '文件管理菜单');
-- powerjob server控制台
insert into sys_menu values('120',  '任务调度中心',  '2',   '5',  'powerjob',           'monitor/powerjob/index',        '', '1', '0', 'C', '0', '0', 'monitor:powerjob:list',         'job',           103, 1, now(), null, null, 'PowerJob控制台菜单');

-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    '', '1', '0', 'C', '0', '0', 'monitor:operlog:list',    'form',          103, 1, now(), null, null, '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    103, 1, now(), null, null, '登录日志菜单');
-- 用户管理按钮
insert into sys_menu values('1001', '用户查询', '100', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:query',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1002', '用户新增', '100', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:add',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1003', '用户修改', '100', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit',           '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1004', '用户删除', '100', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1005', '用户导出', '100', '5',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:export',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1006', '用户导入', '100', '6',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:import',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1007', '重置密码', '100', '7',  '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd',       '#', 103, 1, now(), null, null, '');
-- 角色管理按钮
insert into sys_menu values('1008', '角色查询', '101', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:query',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1009', '角色新增', '101', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:add',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1010', '角色修改', '101', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit',           '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1011', '角色删除', '101', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1012', '角色导出', '101', '5',  '', '', '', '1', '0', 'F', '0', '0', 'system:role:export',         '#', 103, 1, now(), null, null, '');
-- 菜单管理按钮
insert into sys_menu values('1013', '菜单查询', '102', '1',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1014', '菜单新增', '102', '2',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1015', '菜单修改', '102', '3',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit',           '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1016', '菜单删除', '102', '4',  '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove',         '#', 103, 1, now(), null, null, '');

-- 字典管理按钮
insert into sys_menu values('1026', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1027', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1028', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit',           '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1029', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1030', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export',         '#', 103, 1, now(), null, null, '');
-- 参数设置按钮
insert into sys_menu values('1031', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query',        '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1032', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1033', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1034', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove',       '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1035', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export',       '#', 103, 1, now(), null, null, '');
-- 通知公告按钮
insert into sys_menu values('1036', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query',        '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1037', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1038', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit',         '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1039', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove',       '#', 103, 1, now(), null, null, '');
-- 操作日志按钮
insert into sys_menu values('1040', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query',      '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1041', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove',     '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1042', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export',     '#', 103, 1, now(), null, null, '');
-- 登录日志按钮
insert into sys_menu values('1043', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query',   '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1044', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove',  '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1045', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export',  '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1050', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 103, 1, now(), null, null, '');
-- 在线用户按钮
insert into sys_menu values('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query',       '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 103, 1, now(), null, null, '');
-- 代码生成按钮
insert into sys_menu values('1055', '生成查询', '115', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query',             '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1056', '生成修改', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit',              '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1057', '生成删除', '115', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1058', '导入代码', '115', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import',            '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1059', '预览代码', '115', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview',           '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1060', '生成代码', '115', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code',              '#', 103, 1, now(), null, null, '');
-- oss相关按钮
insert into sys_menu values('1600', '文件查询', '118', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:query',        '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1601', '文件上传', '118', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:upload',       '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1602', '文件下载', '118', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:download',     '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1603', '文件删除', '118', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:remove',       '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1604', '配置添加', '118', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:add',          '#', 103, 1, now(), null, null, '');
insert into sys_menu values('1605', '配置编辑', '118', '6', '#', '', '', '1', '0', 'F', '0', '0', 'system:oss:edit',         '#', 103, 1, now(), null, null, '');


-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table if not exists sys_user_role
(
    user_id int8 not null,
    role_id int8 not null,
    constraint sys_user_role_pk primary key (user_id, role_id)
    );

comment on table sys_user_role              is '用户和角色关联表';
comment on column sys_user_role.user_id     is '用户ID';
comment on column sys_user_role.role_id     is '角色ID';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table if not exists sys_role_menu
(
    role_id int8 not null,
    menu_id int8 not null,
    constraint sys_role_menu_pk primary key (role_id, menu_id)
    );

comment on table sys_role_menu              is '角色和菜单关联表';
comment on column sys_role_menu.role_id     is '角色ID';
comment on column sys_role_menu.menu_id     is '菜单ID';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');
insert into sys_role_menu values ('2', '1061');
insert into sys_role_menu values ('2', '1062');
insert into sys_role_menu values ('2', '1063');
insert into sys_role_menu values ('2', '1064');
insert into sys_role_menu values ('2', '1065');



-- ----------------------------
-- 11、字典类型表
-- ----------------------------
drop table if exists sys_dict_type;
create table if not exists sys_dict_type
(
    dict_id     int8,
    dict_name   varchar(100) default ''::varchar,
    dict_type   varchar(100) default ''::varchar,
    status      char         default '0'::bpchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint sys_dict_type_pk primary key (dict_id)
    );

create unique index sys_dict_type_index1 ON sys_dict_type (dict_type);

comment on table sys_dict_type                  is '字典类型表';
comment on column sys_dict_type.dict_id         is '字典主键';
comment on column sys_dict_type.dict_name       is '字典名称';
comment on column sys_dict_type.dict_type       is '字典类型';
comment on column sys_dict_type.status          is '状态（0正常 1停用）';
comment on column sys_dict_type.create_dept     is '创建部门';
comment on column sys_dict_type.create_by       is '创建者';
comment on column sys_dict_type.create_time     is '创建时间';
comment on column sys_dict_type.update_by       is '更新者';
comment on column sys_dict_type.update_time     is '更新时间';
comment on column sys_dict_type.remark          is '备注';

insert into sys_dict_type values(1, '用户性别', 'sys_user_sex',        '0', 103, 1, now(), null, null, '用户性别列表');
insert into sys_dict_type values(2, '菜单状态', 'sys_show_hide',       '0', 103, 1, now(), null, null, '菜单状态列表');
insert into sys_dict_type values(3, '系统开关', 'sys_normal_disable',  '0', 103, 1, now(), null, null, '系统开关列表');
insert into sys_dict_type values(6, '系统是否', 'sys_yes_no',          '0', 103, 1, now(), null, null, '系统是否列表');
insert into sys_dict_type values(7, '通知类型', 'sys_notice_type',     '0', 103, 1, now(), null, null, '通知类型列表');
insert into sys_dict_type values(8, '通知状态', 'sys_notice_status',   '0', 103, 1, now(), null, null, '通知状态列表');
insert into sys_dict_type values(9, '操作类型', 'sys_oper_type',       '0', 103, 1, now(), null, null, '操作类型列表');
insert into sys_dict_type values(10,'系统状态', 'sys_common_status',  '0', 103, 1, now(), null, null, '登录状态列表');
insert into sys_dict_type values(11,'授权类型', 'sys_grant_type',     '0', 103, 1, now(), null, null, '认证授权类型');
insert into sys_dict_type values(12,'设备类型', 'sys_device_type',    '0', 103, 1, now(), null, null, '客户端设备类型');
insert into sys_dict_type values(13,'设备认证方式', 'link_device_auth_mode',    '0', 103, 1, now(), null, null, '设备管理鉴权方式');
insert into sys_dict_type values(14,'设备连接实例', 'link_device_connector',    '0', 103, 1, now(), null, null, '设备连接实例');
insert into sys_dict_type values(15,'设备状态', 'link_device_status',    '0', 103, 1, now(), null, null, '设备状态');
insert into sys_dict_type values(16,'连接状态', 'link_device_connect_status',    '0', 103, 1, now(), null, null, '设备连接状态');
insert into sys_dict_type values(17,'是否遗言', 'link_device_is_will',    '0', 103, 1, now(), null, null, '设备是否有遗言');
insert into sys_dict_type values(18,'产品协议类型', 'link_device_protocol_type',    '0', 103, 1, now(), null, null, '产品协议类型 ：mqtt || coap || modbus || http');
insert into sys_dict_type values(19,'设备类型', 'link_device_device_type',    '0', 103, 1, now(), null, null, '设备类型0-普通设备（无子设备也无父设备）1-网关设备(可挂载子设备)2-子设备(归属于某个网关设备)。');
insert into sys_dict_type values(20,'集成应用类型', 'link_application_type',    '0', 103, 1, now(), null, null, '集成应用');
insert into sys_dict_type values(21,'产品设备类型', 'link_product_device_type',    '0', 103, 1, now(), null, null, '产品设备类型，支持英文大小写、数字、下划线和中划线');
insert into sys_dict_type values(22,'产品类型', 'link_product_type',    '0', 103, 1, now(), null, null, '支持以下两种产品类型：\n•0：普通产品，需直连设备。\n•1：网关产品，可挂载子设备。\n');
insert into sys_dict_type values(23,'是否必填', 'link_product_isRequired',    '0', 103, 1, now(), null, null, NULL);
insert into sys_dict_type values(24,'CAS策略类型', 'link_casbinRule_v3',    '0', 103, 1, now(), null, null, 'CAS策略类型：允许||拒绝');
insert into sys_dict_type values(25,'CAS策略动作', 'link_casbinRule_v2',    '0', 103, 1, now(), null, null, '认证动作');
insert into sys_dict_type values(26,'设备动作类型', 'link_device_action_type',    '0', 103, 1, now(), null, null, NULL);
insert into sys_dict_type values(27,'设备影子状态', 'link_deviceInfo_shadow_enable',    '0', 103, 1, now(), null, null, '是否支设备影子');
insert into sys_dict_type values(28,'业务数据状态', 'business_data_status',    '0', 103, 1, now(), null, null, '业务数据状态标识（0启用  1停用）');
insert into sys_dict_type values(29,'指示数据类型', 'link_product_datatype',    '0', 103, 1, now(), null, null, '产品模型指示数据类型');
insert into sys_dict_type values(30,'协议语言', 'link_protocol_voice',    '0', 103, 1, now(), null, null, '协议管理-支持的协议脚本语言');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
drop table if exists sys_dict_data;
create table if not exists sys_dict_data
(
    dict_code   int8,
    dict_sort   int4         default 0,
    dict_label  varchar(100) default ''::varchar,
    dict_value  varchar(100) default ''::varchar,
    dict_type   varchar(100) default ''::varchar,
    css_class   varchar(100) default null::varchar,
    list_class  varchar(100) default null::varchar,
    is_default  char         default 'N'::bpchar,
    status      char         default '0'::bpchar,
    create_dept int8,
    create_by   int8,
    create_time timestamp,
    update_by   int8,
    update_time timestamp,
    remark      varchar(500) default null::varchar,
    constraint sys_dict_data_pk primary key (dict_code)
    );

comment on table sys_dict_data                  is '字典数据表';
comment on column sys_dict_data.dict_code       is '字典编码';
comment on column sys_dict_data.dict_sort       is '字典排序';
comment on column sys_dict_data.dict_label      is '字典标签';
comment on column sys_dict_data.dict_value      is '字典键值';
comment on column sys_dict_data.dict_type       is '字典类型';
comment on column sys_dict_data.css_class       is '样式属性（其他样式扩展）';
comment on column sys_dict_data.list_class      is '表格回显样式';
comment on column sys_dict_data.is_default      is '是否默认（Y是 N否）';
comment on column sys_dict_data.status          is '状态（0正常 1停用）';
comment on column sys_dict_data.create_dept     is '创建部门';
comment on column sys_dict_data.create_by       is '创建者';
comment on column sys_dict_data.create_time     is '创建时间';
comment on column sys_dict_data.update_by       is '更新者';
comment on column sys_dict_data.update_time     is '更新时间';
comment on column sys_dict_data.remark          is '备注';

insert into sys_dict_data values(1, 1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 103, 1, now(), null, null, '性别男');
insert into sys_dict_data values(2, 2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 103, 1, now(), null, null, '性别女');
insert into sys_dict_data values(3, 3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 103, 1, now(), null, null, '性别未知');
insert into sys_dict_data values(4, 1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 103, 1, now(), null, null, '显示菜单');
insert into sys_dict_data values(5, 2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 103, 1, now(), null, null, '隐藏菜单');
insert into sys_dict_data values(6, 1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 103, 1, now(), null, null, '正常状态');
insert into sys_dict_data values(7, 2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 103, 1, now(), null, null, '停用状态');
insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 103, 1, now(), null, null, '系统默认是');
insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 103, 1, now(), null, null, '系统默认否');
insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 103, 1, now(), null, null, '通知');
insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 103, 1, now(), null, null, '公告');
insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 103, 1, now(), null, null, '正常状态');
insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 103, 1, now(), null, null, '关闭状态');
insert into sys_dict_data values(29, 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 103, 1, now(), null, null, '其他操作');
insert into sys_dict_data values(18, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 103, 1, now(), null, null, '新增操作');
insert into sys_dict_data values(19, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 103, 1, now(), null, null, '修改操作');
insert into sys_dict_data values(20, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 103, 1, now(), null, null, '删除操作');
insert into sys_dict_data values(21, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 103, 1, now(), null, null, '授权操作');
insert into sys_dict_data values(22, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 103, 1, now(), null, null, '导出操作');
insert into sys_dict_data values(23, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 103, 1, now(), null, null, '导入操作');
insert into sys_dict_data values(24, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 103, 1, now(), null, null, '强退操作');
insert into sys_dict_data values(25, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 103, 1, now(), null, null, '生成操作');
insert into sys_dict_data values(26, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 103, 1, now(), null, null, '清空操作');
insert into sys_dict_data values(27, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 103, 1, now(), null, null, '正常状态');
insert into sys_dict_data values(28, 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 103, 1, now(), null, null, '停用状态');
insert into sys_dict_data values(30, 0,  '密码认证', 'password',   'sys_grant_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '密码认证');
insert into sys_dict_data values(31, 0,  '短信认证', 'sms',        'sys_grant_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '短信认证');
insert into sys_dict_data values(32, 0,  '邮件认证', 'email',      'sys_grant_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '邮件认证');
insert into sys_dict_data values(33, 0,  '小程序认证', 'xcx',      'sys_grant_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '小程序认证');
insert into sys_dict_data values(34, 0,  '三方登录认证', 'social', 'sys_grant_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '三方登录认证');
insert into sys_dict_data values(35, 0,  'PC', 'pc',              'sys_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'PC');
insert into sys_dict_data values(36, 0,  '安卓', 'android',       'sys_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '安卓');
insert into sys_dict_data values(37, 0,  'iOS', 'ios',            'sys_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'iOS');
insert into sys_dict_data values(38, 0,  '小程序', 'xcx',         'sys_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '小程序');
insert into sys_dict_data values(39, 0,  '默认', 'default',         'link_device_auth_mode',   '',   'default', 'N', '0', 103, 1, now(), null, null, '设备用户名+设备密码');
insert into sys_dict_data values(40, 1,  'SSL/TLS', 'SSL/TLS',         'link_device_auth_mode',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'SSL/TLS认证');
insert into sys_dict_data values(41, 0,  '127.0.0.1:11883', '127.0.0.1:11883',         'link_device_connector',   '',   'default', 'N', '0', 103, 1, now(), null, null, '本地默认节点');
insert into sys_dict_data values(42, 0,  '启用', 'ENABLE',         'link_device_status',   '',   'success', 'N', '0', 103, 1, now(), null, null, '设备启用');
insert into sys_dict_data values(43, 1,  '禁用', 'DISABLE',         'link_device_status',   '',   'danger', 'N', '0', 103, 1, now(), null, null, '设备禁用');
insert into sys_dict_data values(44, 1,  '在线', 'ONLINE',         'link_device_connect_status',   '',   'success', 'N', '0', 103, 1, now(), null, null, '设备在线');
insert into sys_dict_data values(45, 2,  '离线', 'OFFLINE',         'link_device_connect_status',   '',   'warning', 'N', '0', 103, 1, now(), null, null, '设备离线');
insert into sys_dict_data values(46, 0,  '未连接', 'INIT',         'link_device_connect_status',   '',   'info', 'N', '0', 103, 1, now(), null, null, '设备未连接');
insert into sys_dict_data values(47, 0,  '是', '0',         'link_device_is_will',   '',   'primary', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(48, 0,  '否', '1',         'link_device_is_will',   '',   'warning', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(49, 0,  'mqtt', 'MQTT',         'link_device_protocol_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'mqtt');
insert into sys_dict_data values(50, 1,  'coap', 'COAP',         'link_device_protocol_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'coap');
insert into sys_dict_data values(51, 2,  'modbus', 'MODBUS',         'link_device_protocol_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'modbus');
insert into sys_dict_data values(52, 3,  'http', 'HTTP',         'link_device_protocol_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'http');
insert into sys_dict_data values(53, 0,  '普通设备', 'COMMON',         'link_device_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '普通设备（无子设备也无父设备）');
insert into sys_dict_data values(54, 1,  '网关设备', 'GATEWAY',         'link_device_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '网关设备(可挂载子设备)');
insert into sys_dict_data values(55, 0,  'thinglinks', 'thinglinks',         'link_application_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'thinglinks');
insert into sys_dict_data values(56, 1,  '218.78.103.93:11883', '218.78.103.93:11883',         'link_device_connector',   '',   'default', 'N', '0', 103, 1, now(), null, null, '物联网测试环境');
insert into sys_dict_data values(57, 0,  'Default', 'default',         'link_product_device_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '默认');
insert into sys_dict_data values(58, 0,  '普通产品', 'COMMON',         'link_product_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '普通产品，需直连设备。');
insert into sys_dict_data values(59, 1,  '网关产品', 'GATEWAY',         'link_product_type',   '',   'default', 'N', '0', 103, 1, now(), null, null, '网关产品，可挂载子设备。');
insert into sys_dict_data values(60, 0,  '非必填', '0',         'link_product_isRequired',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(61, 0,  '必填', '1',         'link_product_isRequired',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(62, 0,  '允许', 'allow',         'link_casbinRule_v3',   '',   'success', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(63, 0,  '拒绝', 'deny',         'link_casbinRule_v3',   '',   'warning', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(64, 0,  '发布', 'PUBLISH',         'link_casbinRule_v2',   '',   'primary', 'N', '0', 103, 1, now(), null, null, '发布动作');
insert into sys_dict_data values(65, 0,  '订阅', 'SUBSCRIBE',         'link_casbinRule_v2',   '',   'info', 'N', '0', 103, 1, now(), null, null, '订阅动作');
insert into sys_dict_data values(66, 0,  '上线', 'ONLINE',         'link_device_action_type',   '',   'success', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(67, 0,  '离线', 'OFFLINE',         'link_device_action_type',   '',   'warning', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(68, 0,  '是', 'true',         'link_deviceInfo_shadow_enable',   '',   'primary', 'N', '0', 103, 1, now(), null, null, '支持设备影子');
insert into sys_dict_data values(69, 0,  '否', 'false',         'link_deviceInfo_shadow_enable',   '',   'danger', 'N', '0', 103, 1, now(), null, null, '不支持设备影子');
insert into sys_dict_data values(70, 0,  '启用', '0',         'business_data_status',   '',   'success', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(71, 0,  '停用', '1',         'business_data_status',   '',   'danger', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(72, 0,  'string', 'string',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(73, 0,  'binary', 'binary',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(74, 0,  'int', 'int',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(75, 0,  'bool', 'bool',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(76, 0,  'decimal', 'decimal',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(77, 0,  'timestamp', 'timestamp',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(78, 0,  'json', 'json',         'link_product_datatype',   '',   'default', 'N', '0', 103, 1, now(), null, null, null);
insert into sys_dict_data values(79, 0,  'java', 'java',         'link_protocol_voice',   '',   'default', 'N', '0', 103, 1, now(), null, null, 'java');
insert into sys_dict_data values(80, 3,  '协议管理', 'PROTOCOL',         'sys_job_group',   '',   'default', 'N', '0', 103, 1, now(), null, null, '协议管理');
insert into sys_dict_data values(81, 4,  '规则触发器', 'RULE_TRIGGER',         'sys_job_group',   '',   'default', 'N', '0', 103, 1, now(), null, null, '设备联动规则触发器');
insert into sys_dict_data values(82, 5,  '设备管理', 'LINK_DEVICE',         'sys_job_group',   '',   'default', 'N', '0', 103, 1, now(), null, null, '设备管理');




-- 字符串自动转时间 避免框架时间查询报错问题
create or replace function cast_varchar_to_timestamp(varchar) returns timestamptz as $$
select to_timestamp($1, 'yyyy-mm-dd hh24:mi:ss');
$$ language sql strict ;

create cast (varchar as timestamptz) with function cast_varchar_to_timestamp as IMPLICIT;




