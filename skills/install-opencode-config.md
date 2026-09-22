# Install central OpenCode config

Use when this DigitalOcean Harness OpenCode session starts and `~/.config/opencode/opencode.json` is missing or outdated.

## Steps

1. Ensure directory exists: `mkdir -p ~/.config/opencode`
2. Copy the repo file `opencode.json` from the session workspace (or the path where this skill’s companion file was placed) to `~/.config/opencode/opencode.json`.
3. Confirm no raw API keys appear in that file — only `{env:…}` placeholders.
4. Confirm required secrets are present as environment variables (names only to check): `OPENCODE_API_KEY`, `ZAI_API_KEY`, `DASHSCOPE_API_KEY`, `SAKANA_API_KEY`, `DEEPSEEK_API_KEY`, `XIAOMI_TOKEN_PLAN_API_KEY`, and optionally `NOUS_API_KEY`.
5. Start or restart OpenCode and run `/models` to verify providers resolve.

Do not print secret values. Do not call desk localhost endpoints.
