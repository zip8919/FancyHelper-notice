# FancyHelper 公告服务

## API 使用

### 获取公告信息

**端点：** `/v1/notice.json`

**示例请求：**
```javascript
fetch('https://你的用户名.github.io/FancyHelper-notice/notice.json')
  .then(response => response.json())
  .then(data => {
    if (data.notice) {
      console.log('公告内容:', data.text);
    }
  });
```

**响应格式：**
```json
{
  "notice": true,
  "text": "hello world"
}
```

| 字段 | 类型 | 说明 |
|------|------|------|
| `notice` | boolean | 是否显示公告（`true` = 启用，`false` = 关闭） |
| `text` | string | 公告文本内容 |

## 修改公告

直接编辑 `notice.json` 文件并提交，GitHub Pages 会自动重新部署。
