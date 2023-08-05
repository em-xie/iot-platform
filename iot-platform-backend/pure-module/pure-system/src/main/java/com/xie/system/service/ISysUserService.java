package com.xie.system.service;

import com.xie.common.mybatis.core.page.PageQuery;
import com.xie.common.mybatis.core.page.TableDataInfo;
import com.xie.system.domain.bo.SysUserBo;
import com.xie.system.domain.vo.SysUserVo;

/**
 * @作者：xie
 * @时间：2023/7/16 21:01
 */
public interface ISysUserService {
    boolean checkUserNameUnique(SysUserBo sysUser);

    boolean registerUser(SysUserBo sysUser);


    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    SysUserVo selectUserById(Long userId);


    /**
     * 根据条件分页查询已分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    TableDataInfo<SysUserVo> selectAllocatedList(SysUserBo user, PageQuery pageQuery);

    /**
     * 根据条件分页查询未分配用户角色列表
     *
     * @param user 用户信息
     * @return 用户信息集合信息
     */
    TableDataInfo<SysUserVo> selectUnallocatedList(SysUserBo user, PageQuery pageQuery);

    TableDataInfo<SysUserVo> selectPageUserList(SysUserBo user, PageQuery pageQuery);

    void checkUserAllowed(Long userId);

    int updateUserStatus(Long userId, String status);
}
