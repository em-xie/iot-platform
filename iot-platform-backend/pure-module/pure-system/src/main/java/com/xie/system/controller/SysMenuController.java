package com.xie.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.hutool.core.lang.tree.Tree;
import com.xie.common.core.constant.UserConstants;
import com.xie.common.core.domain.R;
import com.xie.common.core.utils.StringUtils;
import com.xie.common.log.annotation.Log;
import com.xie.common.log.enums.BusinessType;
import com.xie.common.satoken.utils.LoginHelper;
import com.xie.common.web.core.BaseController;
import com.xie.system.domain.SysMenu;
import com.xie.system.domain.bo.SysMenuBo;
import com.xie.system.domain.vo.MenuTreeSelectVo;
import com.xie.system.domain.vo.RouterVo;
import com.xie.system.domain.vo.SysMenuVo;
import com.xie.system.service.ISysMenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 菜单信息
 *
 * @author Lion Li
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/menu")
public class SysMenuController extends BaseController {

    private final ISysMenuService menuService;

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("/getRouters")
    public R<List<RouterVo>> getRouters() {
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(LoginHelper.getUserId());
        return R.ok(menuService.buildMenus(menus));
    }

}
