# FancyHelper 公告服务 - 项目上下文

## 项目概述

**项目名称：** FancyHelper-notice

**项目类型：** 静态网站服务（GitHub Pages）

**项目用途：** 为 FancyHelper 插件提供公告通知服务，允许通过 API 获取实时公告信息。

**部署平台：** GitHub Pages

**技术栈：**
- 静态 HTML/JavaScript
- GitHub Actions（自动部署）
- GitHub Pages（托管）

## 项目结构

```
FancyHelper-notice/
├── index.html              # 公告展示页面（带状态显示的UI）
├── v1/
│   └── notice.json         # 公告数据源（JSON格式）
├── README.md               # API 使用文档
├── update-notice.sh        # Linux/macOS 快速更新脚本
├── update-notice.bat       # Windows 快速更新脚本
└── .github/
    └── workflows/
        └── static.yml      # GitHub Pages 部署配置
```

## 核心功能

### 1. 公告 API 端点
- **URL:** `https://zip8919.github.io/FancyHelper-notice/v1/notice.json`
- **响应格式:**
  ```json
  {
    "notice": true,  // 是否显示公告
    "text": "公告文本内容"
  }
  ```

### 2. 公告展示页面
- 提供可视化界面查看公告状态
- 显示 API 端点地址
- 实时加载公告数据

### 3. 自动部署
- 通过 GitHub Actions 自动部署到 GitHub Pages
- 推送到 `main` 分支自动触发部署

## 构建和运行

### 本地预览
```bash
# 使用 Python 启动本地服务器
python3 -m http.server 8000
# 然后访问 http://localhost:8000
```

### 更新公告内容

**方式一：使用脚本（推荐）**

Linux/macOS:
```bash
./update-notice.sh
# 按提示输入提交信息
```

Windows:
```cmd
update-notice.bat
# 按提示输入提交信息
```

**方式二：手动更新**
```bash
# 1. 编辑 v1/notice.json 文件
# 2. 提交并推送
git add v1/notice.json
git commit -m "更新公告"
git push
```

### 部署流程
1. 修改 `v1/notice.json` 文件
2. 提交并推送到 GitHub
3. GitHub Actions 自动触发部署
4. 访问 `https://zip8919.github.io/FancyHelper-notice/` 查看更新

## 开发约定

### 公告数据格式
- `notice` 字段：布尔值，`true` 表示启用公告，`false` 表示关闭
- `text` 字段：字符串，公告文本内容，支持换行符

### Git 提交规范
- 默认提交信息：`更新公告`
- 建议使用有意义的提交信息描述公告变更内容

### 编码规范
- 文件编码：UTF-8
- Windows 脚本使用 `chcp 65001` 确保中文正确显示

## 重要文件说明

### v1/notice.json
公告数据的核心文件，修改此文件即更新公告内容。客户端通过此文件获取公告信息。

### update-notice.sh / update-notice.bat
便捷脚本，用于快速更新公告并推送到远程仓库。脚本会提示输入提交信息（默认为"更新公告"）。

### .github/workflows/static.yml
GitHub Actions 工作流配置，自动将代码部署到 GitHub Pages。在推送到 `main` 分支时自动触发。

## 注意事项

1. **无需构建过程**：这是一个静态网站，无需编译或构建步骤
2. **自动部署**：所有推送到 `main` 分支的更改都会自动部署
3. **版本控制**：公告内容通过 Git 版本控制，可以追溯历史变更
4. **客户端兼容性**：API 端点返回标准 JSON 格式，任何支持 HTTP 请求的客户端均可使用