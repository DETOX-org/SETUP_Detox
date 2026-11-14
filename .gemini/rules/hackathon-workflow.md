# 🚀 SETUP_Detox — AI-Powered Team Collaboration Rules

> These rules are MANDATORY for any AI agent operating inside this workspace.
> They govern how work is distributed, tracked, merged, and logged across a team.
> Works for: Hackathons | Team Projects | Competitions | Open Source Collabs

---

## RULE 1: ALWAYS CHECK CONTEXT FIRST

Before doing ANY work, the AI agent MUST:

1. Check if `.hackathon/context/PLAN.md` exists and has content.
2. If the file is empty or missing, **STOP** and tell the user:
   > "⚠️ No project plan found! Please write your full project plan in `.hackathon/context/PLAN.md` before I can begin. Include: project goal, features, tech stack, and any requirements."
3. Do NOT proceed with any coding, splitting, or task work until the plan is filled.

---

## RULE 2: SPLITTING THE PLAN INTO PARTS

When the user asks to split/distribute the work:

1. Read `.hackathon/context/PLAN.md` thoroughly.
2. Ask the user: **"How many parts should I divide this project into?"**
3. Wait for the user's answer (do NOT assume a number).
4. For each part, create a file in `.hackathon/parts/`:
   - `part-1.md`, `part-2.md`, `part-3.md`, etc.
   - Each file MUST contain:
     - **Part Title** — descriptive name
     - **Scope** — what this part covers in detail (paragraph form)
     - **Dependencies** — which other parts it depends on (or "None")
     - **Files & Folders** — list of files/folders this part will create inside `workspace/part-X/`
     - **Acceptance Criteria** — how to verify this part is done
     - **Status** — `🔴 UNCLAIMED`
5. Create a folder in `workspace/` for each part: `workspace/part-1/`, `workspace/part-2/`, etc.
6. Update `.hackathon/assignments/registry.json` with all parts set to unclaimed.
7. **Git add, commit, and push** all split files immediately.

---

## RULE 3: CLAIMING A PART

When a team member wants to work on a part:

1. **FIRST** — Run `git pull` to get the latest state from GitHub.
2. Read `.hackathon/assignments/registry.json` to check if the part is already claimed.
3. If the part is `CLAIMED` or `IN_PROGRESS` by someone else:
   > "⛔ Part X is already taken by [member]. Please choose another part."
4. If the part is `UNCLAIMED`:
   - Update `registry.json`: set status to `CLAIMED`, record the member name, timestamp.
   - Update the part file (`part-X.md`): change status to `🟡 CLAIMED by [member]`.
   - **Git add, commit, and push immediately** so others see it's taken.
5. Show the user which parts are still available.

---

## RULE 4: BEFORE STARTING ANY WORK — CHECK GITHUB

Before writing ANY code or making changes:

1. Run `git pull` to check for updates.
2. Read `.hackathon/assignments/registry.json` to verify the part is still assigned to this member.
3. Check if any new parts or changes have been pushed by others.
4. If there are conflicts or the part was reassigned, STOP and inform the user.
5. Only after confirming everything is up-to-date, begin working.

---

## RULE 5: ISOLATED WORKSPACES — NO CROSS-CONTAMINATION

**CRITICAL**: Each part works ONLY inside its own folder.

- Part 1 code goes ONLY in `workspace/part-1/`
- Part 2 code goes ONLY in `workspace/part-2/`
- Part N code goes ONLY in `workspace/part-N/`

**NEVER** modify files in another part's folder. Each part is completely independent until merge.

---

## RULE 6: ACTIVITY LOGGING — EVERY ACTION IS RECORDED

Every time the AI agent performs an action (prompt received, code written, file created, part claimed, etc.):

1. Append an entry to `.hackathon/logs/activity.jsonl` with this format:
   ```json
   {
     "timestamp": "2026-11-14T21:12:00+05:30",
     "member": "member-name",
     "part": "part-X",
     "action": "description of what was done",
     "prompt": "the exact prompt given by the user",
     "files_changed": ["list", "of", "files"],
     "type": "CLAIM | CODE | REVIEW | MERGE | SPLIT | OTHER"
   }
   ```
2. This log is NEVER deleted or overwritten — always append.
3. Commit and push the log update with every significant action.

---

## RULE 7: COMPLETING A PART

When a team member finishes their part:

1. Update `registry.json`: set the part status to `COMPLETED`.
2. Update the part file: change status to `🟢 COMPLETED by [member] at [timestamp]`.
3. Log the completion in `activity.jsonl`.
4. Commit and push all changes.
5. Inform the user of remaining uncompleted parts.

---

## RULE 8: VERIFICATION BEFORE MERGE

Before merging, the AI agent MUST:

1. Run `git pull` to get the latest from all members.
2. Check `registry.json` — ALL parts must be `COMPLETED`.
3. If any part is not complete:
   > "⚠️ Cannot merge yet. The following parts are incomplete: [list]. Please wait for all members to finish."
4. Verify each part's folder exists and has code in it.
5. Only proceed with merge if everything checks out.

---

## RULE 9: MERGING

When all parts are verified complete:

1. Create a merge plan document at `.hackathon/merged/MERGE_PLAN.md` describing how parts connect.
2. Combine code from all `workspace/part-X/` folders into the main `workspace/` directory structure.
3. Resolve any integration points (imports, shared configs, API connections).
4. Test the merged result if possible.
5. Log the merge action with all details.
6. Commit and push the final merged project.

---

## RULE 10: GIT COMMIT MESSAGE FORMAT

All commits MUST follow this format:
```
[SETUP_Detox] <ACTION> | Part: <N> | Member: <name>

<description of what was done>
```

Examples:
```
[SETUP_Detox] SPLIT | Part: ALL | Member: lead
Split project into 4 parts with detailed descriptions

[SETUP_Detox] CLAIM | Part: 2 | Member: anshul
Claimed Part 2 - Backend API Development

[SETUP_Detox] CODE | Part: 2 | Member: anshul
Implemented user authentication endpoints

[SETUP_Detox] MERGE | Part: ALL | Member: lead
Final merge of all 4 parts into unified project
```

---

## QUICK COMMANDS REFERENCE

Tell the user about these commands they can give:

| Command | What it does |
|---------|-------------|
| `setup` | Initialize the project, check for plan |
| `split` | Divide the plan into parts |
| `claim part X` | Claim a part to work on |
| `status` | Show all parts and their status |
| `start` | Begin working on your claimed part |
| `done` | Mark your part as complete |
| `check` | Pull latest and check for updates |
| `merge` | Verify all parts and merge (lead only) |
| `log` | Show activity log |

