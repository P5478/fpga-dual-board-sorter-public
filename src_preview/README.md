# src_preview —— 接口骨架说明

本目录用于展示系统的**模块划分**与**接口设计**，帮助理解项目结构。
核心实现（算法、参数、动作表、标定值）不在此仓库中。

## 目录

```
src_preview/
├── board1/                 板 1（视觉）
│   ├── design_top_wrapper.v      顶层
│   ├── frame_diff_bbox.v         运动检测 + 静态彩色识别
│   ├── static_multi_label.v      多目标标签整理
│   ├── gesture_recognizer.v      手势识别
│   ├── hand_box_draw.v           手势框叠加
│   ├── cell_map_uart.v           目标 → 6 格映射 + 串口打包
│   └── eth_rgb_line_send.v       以太网视频发送
├── board2/                 板 2（显示 + 机械臂）
│   ├── design_top_wrapper.v      顶层
│   ├── eth_rgb_recv.v            以太网视频接收
│   ├── eth_rgb_effect_chain.v    显示特效链
│   └── arm/
│       ├── sort_arm_top.v        机械臂顶层
│       ├── seq_ctrl.v            20 步动作序列控制器
│       ├── sort_rule.v           分拣策略
│       └── arm_table.v           落点查表
└── common/                 通用模块（完整实现，可独立阅读）
    ├── debounce_key.v            按键消抖
    ├── uart_tx.v                 UART 发送器
    └── sync_2ff.v                两级同步器
```

## 骨架文件包含什么

每个骨干模块文件包含：

1. **文件头注释**：模块职责、功能概要、端口分组说明；
2. **完整端口列表**：信号方向、位宽、命名，能看出模块之间的接口关系；
3. **说明**：核心实现未公开。

骨架文件**不能直接编译**（没有实现体），它们的用途是阅读和讨论架构，
不是作为可运行代码。

## 关于参数

真实工程里，大多数模块带有大量参数（阈值、标定值、时序常数等）。
本仓库**刻意移除了参数默认值**，只保留模块的功能描述。

## 通用模块

`common/` 下的三个模块是完整实现，可以直接编译使用。
它们不涉及本项目的核心算法，选在这里是为了展示代码风格：

- `debounce_key.v`：同步消抖，输出按下/松开脉冲
- `uart_tx.v`：8N1 串口发送，valid/ready 握手
- `sync_2ff.v`：跨时钟域单比特同步器
