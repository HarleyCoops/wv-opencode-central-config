# wv-opencode-central — day-one package

Central **OpenCode** session on DigitalOcean Harness Runtime. Desk CLIs stay on the shared computer; this guest calls the same **hosted HTTPS** APIs.

**Status:** draft artifacts only. ChiefofStaff owns `doctl` launch, secret inject, and prepaid spend after Christian’s final go.  
**Out of v1:** Kimi OAuth, RunInfra (no key), MiniMax (unfinished), workspaceAlberta / MCP (Pi/local product only), desk localhost (`mimo serve`, Pi ports).

## Files

| File | Role |
|---|---|
| `opencode.json` | Guest OpenCode providers; `{env:…}` only |
| `harness.yaml` | DO env-spec template; `${VAR}` placeholders only |
| `skills/install-opencode-config.md` | Boot skill text if CoS picks skill delivery |
| `DRAFT.md` | Earlier inventory / decisions notes |

## Providers in `opencode.json`

| Provider id | Default / models | Secret env name |
|---|---|---|
| `zai-coding-plan` | **default** `glm-5.3-flash`; also `glm-5.3`, `glm-4.7` | `ZAI_API_KEY` |
| `qwencloud` | `qwen3.8-max`, `qwen3-vl-plus` | `DASHSCOPE_API_KEY` |
| `sakana` | `fugu-max`, `fugu-max-v1.0` | `SAKANA_API_KEY` |
| `deepseek` | `deepseek-v4-pro` | `DEEPSEEK_API_KEY` |
| `mimo` | `mimo-v2.6-pro`, `mimo-v2.6-flash` (SGP Token Plan) | `XIAOMI_TOKEN_PLAN_API_KEY` |
| `nous` | `stealth/ox-alpha` (optional Hermes-class) | `NOUS_API_KEY` |

Also declare `OPENCODE_API_KEY` in `harness.yaml` so OpenCode Zen remains available (CoS smoke path). Switch models in-session with `/models`.

**Omitted:** Kimi, RunInfra, MiniMax.

**Note:** Desk OpenCode keeps GLM auth in the auth store without `ZAI_API_KEY` in `opencode.json`. This DO template adds `{env:ZAI_API_KEY}` so the guest can run without copying the auth-store file. Map Christian’s Z.ai Coding Plan key into that secret name at inject time.

## Config delivery — pick one

### A) Git repo (recommended if the package is pushed)

1. Publish this folder (or a config-only repo) with **no secrets**.
2. In `harness.yaml`, set `repos:` to that `OWNER/REPO` (first entry is the workspace hint) **or** launch with `doctl harness-runtime launch … --gh-repo OWNER/REPO`.
3. On first attach, copy `opencode.json` into `~/.config/opencode/opencode.json` (or rely on the boot skill below).
4. Export approved secret names in the shell that runs `doctl`, then:  
   `doctl harness-runtime launch harness.yaml`  
   (CoS only — do not run until Christian’s final go.)

### B) Boot skill

1. Keep `opencode.json` reachable in the session workspace (git clone, or paste via a non-secret channel).
2. Add the contents of `skills/install-opencode-config.md` as an inline Harness `skills:` entry (see DO env-spec `skills`), or install it as an OpenCode skill the adapter will load.
3. First prompt: “Run the install-opencode-config skill, then confirm `/models`.”
4. Same `doctl harness-runtime launch harness.yaml` ownership as above.

Do **not** bake keys into the skill, the JSON, or git. Do **not** save a resolved DO manifest after `${VAR}` substitution.

## Secrets checklist (names only)

- `OPENCODE_API_KEY` — Zen / smoke  
- `ZAI_API_KEY` — GLM Coding Plan  
- `DASHSCOPE_API_KEY` — Qwen Model Studio SG  
- `SAKANA_API_KEY` — Fugu Max  
- `DEEPSEEK_API_KEY` — DeepSeek V4 Pro (or later swap for `HARNESS_INFERENCE_API_KEY` + DO Inference)  
- `XIAOMI_TOKEN_PLAN_API_KEY` — MiMo Token Plan SGP (`tp-…`, not PAYG `sk-…`)  
- `NOUS_API_KEY` — optional Ox Alpha  

## Non-goals

- No DO spend from CLIbot  
- No writes to desk `~/.config/opencode` or auth store  
- No workspaceAlberta / MCP on DO  
- No tunnels to desk or Pi localhost  

## Next

Christian / CoS: choose git vs skill, approve which secret names to inject, then CoS launches. CLIbot revises this folder only if asked.
