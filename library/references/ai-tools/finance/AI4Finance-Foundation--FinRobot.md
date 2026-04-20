---
url: https://github.com/AI4Finance-Foundation/FinRobot
stars: 5700
last_checked: 2026-04-15
last_commit: 2024-11-17
category: finance
status: active
---
# FinRobot

> FinRobot: An Open-Source AI Agent Platform for Financial Analysis using Large Language Models

## What's Inside
- Multi-agent financial analysis platform with specialized agents for market forecasting, trading strategies, and risk assessment
- Automated equity research report generation with 15+ chart types and professional HTML/PDF output
- Financial Chain-of-Thought (CoT) prompting for complex analysis and decision-making
- Smart Scheduler for LLM selection and agent orchestration with Director Agent, Agent Adaptor, Task Manager
- Integration with financial data providers (FMP, FINNHUB, SEC-EDGAR, Yahoo Finance)
- Web interface for deploying local AI-powered equity research assistant (FinRobot Pro)
- Tutorials for market forecaster, trade strategist, and annual report agents

## Stack
- Python (11.7%), Jupyter Notebook (66.6%), HTML (21.5%)
- AutoGen for multi-agent orchestration
- LLMs (OpenAI GPT-4, fine-tuned financial models)
- Financial data APIs (FMP, FINNHUB, SEC-EDGAR, Yahoo Finance)

## File Tree (key paths)
```
FinRobot/
├── finrobot/
│   ├── agents/
│   ├── data_source/
│   ├── functional/
│   └── toolkits.py
├── finrobot_equity/
├── configs/
├── tutorials_beginner/
├── tutorials_advanced/
├── experiments/
└── report/
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: yes (AutoGen-based multi-agent system)
- Hooks: no

## Notable
- Includes FinRobot Pro - deployable local AI equity research assistant with web interface
- Generates professional HTML/PDF equity research reports (NVDA, MSFT, TSLA, META examples available)
- 4-layer architecture: Financial AI Agents, Financial LLMs Algorithms, LLMOps/DataOps, Multi-source LLM Foundation Models
- Whitepaper available on arXiv (arXiv:2405.14767), published in ICAIF 2024
