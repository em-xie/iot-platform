package com.xie.system.domain.vo;

import lombok.Data;

/**
 * @作者：xie
 * @时间：2023/8/2 20:10
 */

@Data
public class MenuVo {
    public MenuVo(String title, String icon) {
        this.title = title;
        this.icon = icon;
    }

    public MenuVo(String title) {
        this.title = title;
    }

    /**
     * 设置该路由在侧边栏和面包屑中展示的名字
     */
    private String title;

    /**
     * 设置该路由的图标，对应路径src/assets/icons/svg
     */
    private String icon;


}
