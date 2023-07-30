/// <reference types="vitest" />
import { resolve } from 'path';// https://vitejs.dev/config/
import { defineConfig } from 'vite';

import vueJsx from '@vitejs/plugin-vue-jsx'; // https://vitejs.dev/config/
import vue from '@vitejs/plugin-vue'; // https://vitejs.dev/config/
export default defineConfig({
    base: './',
    resolve: {
        alias: {
          '@': resolve(__dirname, './src') ,
        },
    },
    test: {
        globals: true,
        environment: 'jsdom',
        transformMode: { web: [/\.tsx$/] },
    },
    plugins: [vueJsx(), vue()],
    build: {
      target: 'es2015', // 构建出来的产物支持的环境
    }, 
});
