package com.xie.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import com.xie.common.core.domain.R;
import com.xie.common.core.domain.model.LoginUser;
import com.xie.common.core.utils.MapstructUtils;
import com.xie.common.excel.utils.ExcelUtil;
import com.xie.common.log.annotation.Log;
import com.xie.common.log.enums.BusinessType;
import com.xie.common.mybatis.core.page.PageQuery;
import com.xie.common.mybatis.core.page.TableDataInfo;
import com.xie.common.satoken.utils.LoginHelper;
import com.xie.common.web.core.BaseController;
import com.xie.system.domain.bo.SysUserBo;
import com.xie.system.domain.vo.SysUserVo;
import com.xie.system.domain.vo.UserInfoVo;
import com.xie.system.service.ISysRoleService;
import com.xie.system.service.ISysUserService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户信息
 *
 * @author Lion Li
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/user")
public class SysUserController extends BaseController {

    private final ISysUserService userService;
    private final ISysRoleService roleService;



    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("/getInfo")
    public R<UserInfoVo> getInfo() {
        UserInfoVo userInfoVo = new UserInfoVo();
        LoginUser loginUser = LoginHelper.getLoginUser();
        SysUserVo user = userService.selectUserById(loginUser.getUserId());
        userInfoVo.setUser(user);
        userInfoVo.setPermissions(loginUser.getMenuPermission());
        userInfoVo.setRoles(loginUser.getRolePermission());
        return R.ok(userInfoVo);
    }


}
