package com.xie.system.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xie.common.mybatis.core.mapper.BaseMapperPlus;
import com.xie.system.domain.SysUser;
import com.xie.system.domain.vo.SysUserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * @作者：xie
 * @时间：2023/7/6 22:32
 */

public interface SysUserMapper extends BaseMapperPlus<SysUser, SysUserVo> {

//    @Select("select * from sys_user where user_name = #{userName} and del_flag = '0'")
    SysUserVo selectUserByUserName(String userName);


    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
//    @Select("select * from sys_user where user_id = #{userId} and del_flag = '0'")
    SysUserVo selectUserById(Long userId);

    /**
     * 根据条件分页查询已配用户角色列表
     *
     * @param queryWrapper 查询条件
     * @return 用户信息集合信息
     */

    Page<SysUserVo> selectAllocatedList(@Param("page") Page<SysUser> page, @Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);

    /**
     * 根据条件分页查询未分配用户角色列表
     *
     * @param queryWrapper 查询条件
     * @return 用户信息集合信息
     */

    Page<SysUserVo> selectUnallocatedList(@Param("page") Page<SysUser> page, @Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);
}