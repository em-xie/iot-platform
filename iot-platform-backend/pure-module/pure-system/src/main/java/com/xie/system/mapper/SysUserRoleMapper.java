package com.xie.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.xie.common.mybatis.core.mapper.BaseMapperPlus;
import com.xie.system.domain.SysRole;
import com.xie.system.domain.SysUserRole;
import com.xie.system.domain.vo.SysRoleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author Lion Li
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRole, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);



}
