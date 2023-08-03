package com.xie.system.domain.vo;

import com.xie.common.core.utils.StringUtils;
import lombok.Data;


/**
 * 路由显示信息
 *
 * @author ruoyi
 */

@Data
public class MetaVo {



    /**
     * 内链地址（http(s)://开头）
     */
    private String iframe_link;

    private Boolean auth;

    private MenuVo menu;

    private String[] permissions;



    public MetaVo(String iframe_link, MenuVo menu, String[] permissions) {
        this.iframe_link = iframe_link;
        this.menu = menu;
        this.permissions = permissions;
    }

    public MetaVo(MenuVo menu, String[] permissions) {
        this.menu = menu;
        this.permissions = permissions;
    }

    public MetaVo(String iframe_link, MenuVo menu) {
        this.iframe_link = iframe_link;
        this.menu = menu;
    }

    public MetaVo(MenuVo menu) {
        this.menu = menu;
    }

    public MetaVo(Boolean auth,MenuVo menu) {
        this.auth = auth;
        this.menu = menu;
    }

//    public MetaVo(String iframe_link, Boolean auth, MenuVo menu, String[] permissions) {
//        this.iframe_link = iframe_link;
//        this.auth = auth;
//        this.menu = menu;
//        this.permissions = permissions;
//    }


//    public MetaVo(String title, String icon) {
//        this.title = title;
//        this.icon = icon;
//    }
//
//    public MetaVo(String title, String icon, boolean noCache) {
//        this.title = title;
//        this.icon = icon;
//        this.noCache = noCache;
//    }
//
//    public MetaVo(String title, String icon, String link) {
//        this.title = title;
//        this.icon = icon;
//        this.link = link;
//    }
//
//    public MetaVo(String title, String icon, boolean noCache, String link) {
//        this.title = title;
//        this.icon = icon;
//        this.noCache = noCache;
//        if (StringUtils.ishttp(link)) {
//            this.link = link;
//        }
//    }

}
