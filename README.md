# openwebui-seedance 开发工作区

这个目录已经准备好用于：
- 本地运行 OpenWebUI
- 开发 OpenWebUI Tools（对接火山方舟 Seedance 视频生成）

## 当前状态

- Python venv: `.venv`（Python 3.11）
- OpenWebUI: 已安装 `open-webui`（当前按本地环境版本）
- 素材包主链路已可联调（上传/入包/校验/生成/任务查询）

## 快速开始

```bash
source .venv/bin/activate
bash scripts/run_openwebui.sh
```

首次启动会做数据库初始化，并可能触发模型文件下载，时间会更长一些。

## 文档目录

### 当前主文档（推荐）

- [Seedance v1.0 需求文档](docs/16-v1.0-需求文档.md)
- [Seedance v1.0 开发 TODO](docs/17-v1.0-开发TODO.md)
- [素材包 Tool 接入与联调](docs/07-素材包Tool-接入与联调.md)
- [运行命令手册](docs/08-运行命令手册.md)
- [视频生成用户使用手册](docs/15-视频生成用户使用手册.md)

### 专项文档

- [环境安装与启动](docs/01-环境安装与启动.md)
- [OpenWebUI Tools 开发指南](docs/02-openwebui-tools-开发指南.md)
- [Seedance 集成设计草案](docs/03-seedance-接入设计.md)
- [Git 工作流与提交规范](docs/04-git-工作流.md)
- [TOS 素材服务接入说明](docs/09-TOS-素材服务接入.md)
- [LLM 提示词拆分与 Skill 挂载](docs/10-LLM-提示词拆分与Skill挂载.md)

### 归档文档（追溯）

- [历史文档归档（2026-04-pre-v1）](docs/archive/2026-04-pre-v1/README.md)

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

1. 先按 `docs/16` 与 `docs/17` 统一推进需求与迭代。
2. 用 `templates/seedance_material_package_tool.py` 作为工具代码源，导入 `templates/seedance_material_package_tool_v2.import.json`。
3. 在 OpenWebUI 中用同一模型绑定 Tool + Skill，走一遍端到端调用链路。
