package com.xie.test;

import com.xie.system.domain.vo.SysRoleSelectKeyVo;
import com.xie.system.mapper.SysRoleMapper;
import com.xie.system.mapper.SysUserMapper;
import com.xie.system.service.impl.SysRoleServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * @作者：xie
 * @时间：2023/8/6 15:43
 */
@SpringBootTest
@Slf4j
public class test {
//    @Autowired
//    private SysRoleMapper roleMapper;
    @Autowired
    private SysRoleServiceImpl service;

    @Test
    public void Test1(){
        List<SysRoleSelectKeyVo> sysRoleSelectKeyVos = service.selectRoleKey();
        log.info(sysRoleSelectKeyVos.toString());
    }

}
