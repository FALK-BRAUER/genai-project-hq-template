---
url: https://github.com/karpathy/autoresearch
stars: 73900
last_checked: 2026-04-18
last_commit: 2026-03-26
category: agent-tools
status: active
---
# karpathy/autoresearch

> AI agents running research on single-GPU nanochat training automatically — give an AI agent a small LLM training setup and let it experiment autonomously overnight.

## What's Inside
- `train.py` — single file the agent edits; contains GPT model, optimizer (Muon + AdamW), and training loop
- `program.md` — agent instructions (human-edited); the "research org code" that sets up autonomous experimentation
- `prepare.py` — fixed constants, data prep, tokenizer training, and evaluation utilities (never modified by agent)
- Fixed 5-minute training budget per experiment (~12 experiments/hour, ~100 overnight)
- val_bpb (validation bits per byte) metric for architecture-agnostic comparison
- Analysis notebook for reviewing experiment results

## Stack
- Python 3.10+, PyTorch
- uv package manager
- Jupyter Notebook for analysis (analysis.ipynb)
- Single-GPU focused (NVIDIA H100 tested)

## File Tree (key paths)
```
karpathy/autoresearch/
├── train.py            # Agent-modified: model, optimizer, training loop
├── prepare.py          # Fixed: data prep, tokenizer, evaluation
├── program.md          # Human-edited: agent instructions
├── analysis.ipynb      # Results analysis notebook
├── pyproject.toml      # uv/Python dependencies
└── progress.png        # Training progress visualization
```

## AI-Readiness
- CLAUDE.md: no
- .cursorrules: no
- MCP config: no
- Skills/agents: no (program.md serves as lightweight skill)
- Hooks: no

## Notable
- Agent forms hypothesis, edits train.py, runs 5-min experiment, keeps improvements via git commit, reverts failures
- Community forks exist for macOS (Apple Silicon), Windows (RTX), and AMD GPUs
- Karpathy's own run: 700 experiments overnight, 20 genuine improvements, 11% speedup on hand-tuned code
- Minimal 630-line codebase fits entirely in agent context
