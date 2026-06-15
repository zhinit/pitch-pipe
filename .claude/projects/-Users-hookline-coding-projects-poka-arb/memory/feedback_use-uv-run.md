---
name: feedback_use-uv-run
description: Always use `uv run` to execute Python commands in this project, not bare `python`
metadata:
  type: feedback
---

Use `uv run python -m bot ...` to run commands, not `python -m bot ...`.

**Why:** Project uses uv for dependency management; bare python doesn't have deps available.

**How to apply:** Prefix all python/pytest invocations with `uv run`.
