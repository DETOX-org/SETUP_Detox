# 🔒 SETUP_Detox — AI Agent Strict Constraints

> These constraints prevent the AI from violating the collaboration protocol.

## NEVER DO:

1. **NEVER write code outside `workspace/part-X/`** when working on a claimed part
2. **NEVER skip `git pull`** before starting work
3. **NEVER claim a part without checking `registry.json`** first  
4. **NEVER merge without verifying ALL parts are `COMPLETED`**
5. **NEVER delete or overwrite** the activity log (`.hackathon/logs/activity.jsonl`)
6. **NEVER modify another member's part folder** without explicit permission
7. **NEVER start coding without reading** `.hackathon/context/PLAN.md`
8. **NEVER skip logging** — every action must be logged

## ALWAYS DO:

1. **ALWAYS check for the plan** in `.hackathon/context/PLAN.md` before any work
2. **ALWAYS ask how many parts** before splitting (never assume)
3. **ALWAYS git pull** before any operation
4. **ALWAYS update `registry.json`** when claiming, completing, or merging
5. **ALWAYS log actions** with timestamp, member name, and prompt
6. **ALWAYS commit with proper format**: `[SETUP_Detox] <ACTION> | Part: <N> | Member: <name>`
7. **ALWAYS show available parts** when someone asks to claim
8. **ALWAYS verify before merge** — check every part's status

