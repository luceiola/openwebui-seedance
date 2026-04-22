# OpenWebUI + Seedance 开发工作区

这个目录已经准备好用于：
- 本地运行 OpenWebUI
- 开发 OpenWebUI Tools（后续对接火山方舟 Seedance 视频生成）

## 当前状态

- Python venv: `.venv`（Python 3.11）
- OpenWebUI: 已安装 `open-webui==0.8.12`
- 启动命令已验证可执行：`open-webui serve`

## 快速开始

```bash
source .venv/bin/activate
open-webui serve --host 127.0.0.1 --port 8080
```

首次启动会做数据库初始化，并可能触发部分模型文件下载，时间会更长一些。

## 文档目录

- [环境安装与启动](docs/01-环境安装与启动.md)
- [OpenWebUI Tools 开发指南](docs/02-openwebui-tools-开发指南.md)
- [Seedance 集成设计草案](docs/03-seedance-接入设计.md)
- [Git 工作流与提交规范](docs/04-git-工作流.md)
- [素材包 ZIP 需求文档](docs/05-素材包ZIP-需求文档.md)
- [素材包 ZIP 开发 TODO](docs/06-素材包ZIP-开发TODO.md)
- [素材包 Tool 接入与联调](docs/07-素材包Tool-接入与联调.md)
- [运行命令手册](docs/08-运行命令手册.md)
- [TOS 素材服务接入说明](docs/09-TOS-素材服务接入.md)
- [LLM 提示词拆分与 Skill 挂载](docs/10-LLM-提示词拆分与Skill挂载.md)
- [生成任务管理 Tool 需求文档](docs/11-生成任务管理Tool-需求文档.md)
- [生成任务管理 Tool 开发 TODO](docs/12-生成任务管理Tool-开发TODO.md)
- [聊天上传素材包增强需求文档](docs/13-聊天上传素材包增强-需求文档.md)
- [聊天上传素材包增强开发 TODO](docs/14-聊天上传素材包增强-开发TODO.md)

## 一键初始化脚本

```bash
bash scripts/bootstrap.sh
```

脚本会：
- 检查 Python 3.11
- 创建 `.venv`
- 安装/升级 `open-webui`

### 路由检查脚本

```bash
bash scripts/check_material_routes.sh
```

用于确认 `material-packages` 相关接口是否已加载到当前 OpenWebUI 进程。

## 后续建议

1. 先按 `docs/03` 定义好 Seedance API 的最小可用字段。
2. 用 `templates/seedance_material_package_tool.py` 作为起点接入素材包主链路。
3. 在 OpenWebUI 中导入 Tool，走一遍端到端调用链路。

## 进度提示（2026-04-21）

- 已完成文档：`docs/05`（需求）和 `docs/06`（TODO+状态）。
- 当前后端 PoC 主链路已可联调，前端 ZIP 入口仍待接入到 `+` 菜单。
- 已新增 Tool 模板：`templates/seedance_material_package_tool.py`（用于绑定基础 LLM 做工具调用）。
