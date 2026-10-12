# Play

随意开发、玩耍、做设计实验的仓库，没有统一目标。

## 目录约定

- `scratch/<主题>/`：小实验、一次性脚本、草稿。随便写，不保证能跑。
- `<项目名>/`（根目录下的文件夹）：成型或较大的项目，各自独立维护。
- 根目录只放全仓库共用的东西：`README.md`、`CLAUDE.md`、`.gitignore`、`.claude/`。

scratch 里的实验长大了，就移到根目录成为独立项目。

## 独立项目的规则

- 自包含：依赖清单、lockfile、构建和测试配置、README 都放在项目文件夹内。根目录不放 `package.json`、`pyproject.toml` 这类共享依赖。
- 项目之间不互相引用代码。
- 在一个项目里干活时，不改动其他项目。
- 每个项目都有 `README.md`：一句话说明是什么，以及怎么安装、运行、测试。
- 需要安装依赖的项目提供 `setup.sh`：幂等、非交互，在项目目录内执行。云 session 启动时由 `.claude/hooks/session-start.sh` 自动运行。
- 项目有自己的约定时，在项目文件夹里放一份 `CLAUDE.md`。
- 新建项目后，在根目录 `README.md` 的项目列表里加一行。

## 与用户协作

- 用中文交流。
- 方向不明确时，先做一个能跑的最小版本再迭代，不要反复停下来确认。
- 做出可视化的东西（网页、图表、游戏）时，跑起来截图，或发布成 Artifact 给用户看。

## 云环境须知

- 出站网络只走 HTTP/HTTPS 代理：能访问包管理器和白名单域名，不能 SSH，不能连任意 TCP 端口。
- 预装 Python、Node、Go、Rust、Java、Ruby、PHP 和 Docker；PostgreSQL、Redis 已安装但未启动（`service postgresql start`、`service redis-server start`）。
- Chromium 在 `/opt/pw-browsers`，Playwright 已配置好，不要运行 `playwright install`。
- 容器用完即回收，要保留的东西必须 commit 并 push。
