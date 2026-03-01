## Purpose
This repo is a small Elixir exercise named `Bondificaccion`. These instructions help AI coding agents become productive by describing the project's shape, run/debug commands, language/conventions, and how to safely change code.

## Big picture
- Single small app under `Bondificaccion/` containing simple modules and script-like entrypoints.
- `Parte_1.exs` is the primary script that reads input, prints date/time and uses `Util.ingresar_texto/1` for console input.
- No Mix project or deps present; this is intended as a set of standalone Elixir scripts.

## Key files
- `Bondificaccion/Parte_1.exs`: main script, prints date/time and reads user input. See [Parte_1.exs](Bondificaccion/Parte_1.exs#L1-L20).
- `Bondificaccion/Util.ex`: small utility module; exposes `ingresar_texto/1`. See [Util.ex](Bondificaccion/Util.ex#L1-L10).

## Conventions & patterns (repo-specific)
- Spanish identifiers and prompts (e.g., "Im¿ngrese el nombre") — preserve user-facing Spanish strings unless asked to localize.
- Minimal module structure: utilities in `Util` module; scripts directly call `:calendar.local_time()` and use `IO` for I/O.
- No test harness or CI configured; changes should be minimal and obvious.

## Run / debug
- Run a script directly with Elixir (no Mix):

  ```bash
  elixir Bondificaccion/Parte_1.exs
  ```

- For iterative editing and quick checks, use `elixir` to run the modified script or open an Elixir REPL with `iex` and `c("Bondificaccion/Util.ex")`.

## What an AI agent should do (practical rules)
- Read referenced files before making edits. Link examples above show where to look.
- Do not make large restructures (e.g., convert to a Mix project) without explicit user approval.
- When fixing obvious syntax/typo issues, keep changes minimal and explain them in the commit message (e.g., `defmodele` -> `defmodule`). Ask the user before semantic refactors.
- Preserve user-facing strings in Spanish; if changing, include a translation note and request confirmation.
- If adding tests or build infra, propose it first and show a short plan.

## Quick examples (safe edits)
- Fix typos in module declaration in `Parte_1.exs` (only change the identifier and immediate syntax), then re-run using the command above.
- If adding helper functions to `Util.ex`, keep the API surface small and update callers in `Parte_1.exs`.

## When unsure
- Ask the user if a change affects user-visible behavior, I/O, or project scope.
- Provide a short, one-paragraph summary of the planned edit and a small diff preview before applying.

---
If anything here is unclear or you'd like a different level of detail (for example, expand run/debug examples or add preferred commit message templates), tell me which parts to iterate on.
