<p align="center">
  <img src="https://img.shields.io/badge/🚀-SETUP__Detox-blueviolet?style=for-the-badge&labelColor=black" alt="SETUP_Detox" />
  <br/>
  <b>Stop fighting over files. Start shipping features.</b>
</p>

<p align="center">
  <a href="#-quick-start-under-2-minutes"><img src="https://img.shields.io/badge/⚡_Setup_Time-Under_2_Min-brightgreen?style=flat-square" /></a>
  <a href="#-the-problem-we-solve"><img src="https://img.shields.io/badge/🤝_Built_For-Hackathon_Teams-orange?style=flat-square" /></a>
  <a href="#-how-does-the-ai-help"><img src="https://img.shields.io/badge/🤖_Powered_By-AI_Agents-blue?style=flat-square" /></a>
  <a href="IMPORT_GUIDE.md"><img src="https://img.shields.io/badge/📥_Full-Import_Guide-yellow?style=flat-square" /></a>
  <a href="#-license"><img src="https://img.shields.io/badge/📄_License-MIT-lightgrey?style=flat-square" /></a>
</p>

---

## 😩 The Problem We Solve

Ever been in a hackathon where...

| 😤 Without SETUP_Detox | 😎 With SETUP_Detox |
|---|---|
| "Who's working on what?" — asked 50 times | Every part is **claimed and tracked** in one file |
| Merge conflicts at 3 AM before the deadline | Each member codes in **their own isolated folder** — zero conflicts |
| One person does 80% of the work | AI **splits the plan fairly** with clear scope for each part |
| No one knows what's been done | **Every action is logged** — who did what, when, with what prompt |
| 30 minutes wasted just setting up the repo | **One command** and the full structure is ready |
| "I accidentally edited your file" | AI **blocks cross-part edits** — your folder is yours |
| Merging 4 branches at the deadline is chaos | AI **verifies all parts**, then merges everything cleanly |
| No project timeline for the judges | **Activity log** = automatic project timeline with timestamps |

---

## 💡 So What Exactly Is This?

**SETUP_Detox** is a **ready-to-use repository template** that you clone into your hackathon project. It comes with:

- 🤖 **AI Rules** — pre-written instructions (in `.gemini/rules/`) that automatically tell any AI coding agent how to manage your team's work
- 📋 **Plan → Split → Claim → Build → Merge** — a complete collaboration workflow
- 📂 **Isolated workspaces** — each team member gets `workspace/part-X/`, no stepping on toes
- 📜 **Activity logging** — every prompt, every file change, every timestamp, logged automatically
- ⚙️ **Setup scripts** — one command to initialize everything (Windows + Linux + Mac)

> **Think of it as a project manager that lives inside your repo and runs on AI.**

---

## ⚡ Quick Start (Under 2 Minutes)

### Step 1 → Get It

```bash
# Clone into your project folder
git clone https://github.com/Anshulpj12/SETUP_Detox.git my-hackathon
cd my-hackathon

# Point to YOUR team's new GitHub repo
git remote remove origin
git remote add origin https://github.com/YOUR_TEAM/your-hackathon.git
```

### Step 2 → Run Setup

```powershell
# Windows
.\setup.ps1 -ProjectName "My Awesome Hackathon"
```
```bash
# Linux / Mac
bash setup.sh --name "My Awesome Hackathon"
```

### Step 3 → Write Your Plan

Open `.hackathon/context/PLAN.md` and fill it in:

```markdown
## Project Name
EcoTracker — Carbon Footprint Calculator

## Tech Stack
React, Node.js, MongoDB, TailwindCSS

## Features
1. User authentication (Google OAuth)
2. Dashboard showing carbon stats & charts
3. Activity logger (transport, food, energy usage)
4. Social leaderboard & weekly challenges
5. REST API for all data operations

## Team Size
4 members
```

### Step 4 → Tell Your AI Agent

Open your AI agent (Antigravity, Cursor, etc.) in this workspace and just say:

```
split
```

**That's it.** The AI reads your plan, asks how many parts, creates detailed part files, isolated folders, and pushes everything to GitHub. Your team is ready to build.

---

## 🔄 The Full Workflow (Visual)

```
  YOU                          AI AGENT                        GITHUB
   │                              │                              │
   │  "Here's our plan"           │                              │
   │  (fill PLAN.md)              │                              │
   │ ──────────────────────────►  │                              │
   │                              │  reads plan                  │
   │  "split"                     │  ◄──────────                 │
   │ ──────────────────────────►  │                              │
   │                              │  "How many parts?"           │
   │  "4 parts"                   │  ◄──────────                 │
   │ ──────────────────────────►  │                              │
   │                              │  creates part-1.md → part-4  │
   │                              │  creates workspace/part-1/   │
   │                              │  updates registry.json       │
   │                              │ ────────────────────────────► │  PUSH
   │                              │                              │
   │                              │                              │
   │ (Team members clone the repo)│                              │
   │                              │                              │
   │  "claim part 2"              │                              │
   │ ──────────────────────────►  │                              │
   │                              │ ◄──────────────────────────  │  PULL
   │                              │  checks: part 2 free? ✅     │
   │                              │  marks you as owner          │
   │                              │ ────────────────────────────► │  PUSH
   │                              │                              │
   │  "start"                     │                              │
   │ ──────────────────────────►  │ ◄──────────────────────────  │  PULL
   │                              │  latest code? ✅              │
   │                              │  codes in workspace/part-2/  │
   │                              │  logs every action 📝        │
   │                              │                              │
   │  "done"                      │                              │
   │ ──────────────────────────►  │  marks COMPLETED ✅           │
   │                              │ ────────────────────────────► │  PUSH
   │                              │                              │
   │ (when ALL parts are done)    │                              │
   │                              │                              │
   │  "merge"                     │                              │
   │ ──────────────────────────►  │  verifies all parts ✅       │
   │                              │  combines into final project │
   │                              │ ────────────────────────────► │  PUSH
   │                              │                              │
   │         🎉 PROJECT COMPLETE! │                              │
```

---

## 🤖 How Does The AI Help?

The `.gemini/rules/` folder contains **10 rules** that program any AI agent working in this workspace. Here's what the AI does **automatically**:

<table>
<tr>
<td width="50%">

### 🧠 It Thinks Before Acting
- Reads your full plan before doing anything
- Never starts coding without understanding the project
- Asks how many parts — doesn't assume

</td>
<td width="50%">

### 🔒 It Prevents Conflicts
- Checks GitHub before every operation
- Blocks you from editing another member's folder
- Warns if a part is already claimed

</td>
</tr>
<tr>
<td>

### 📝 It Logs Everything
- Records every prompt you give it
- Tracks which files were changed
- Stamps everything with time, date, and member name

</td>
<td>

### 🔀 It Manages the Merge
- Verifies every part is marked complete
- Refuses to merge if anything is missing
- Creates a merge plan before combining

</td>
</tr>
</table>

> **You don't need to configure anything.** The rules load automatically when any AI agent opens this workspace.

---

## 📂 What's Inside

```
SETUP_Detox/
│
├── 📄 README.md                  ← You are here
├── 📄 IMPORT_GUIDE.md            ← Detailed import instructions
├── 📄 setup.ps1                  ← Windows setup (one command)
├── 📄 setup.sh                   ← Linux/Mac setup (one command)
├── 📄 .gitignore
│
├── 🤖 .gemini/rules/             ← AI AGENT BRAIN
│   ├── hackathon-workflow.md     ← 10 rules: split, claim, build, merge
│   └── ai-constraints.md        ← Strict guardrails (never/always)
│
├── 📦 .hackathon/                ← COLLABORATION ENGINE
│   ├── context/PLAN.md           ← ✍️ YOUR PLAN GOES HERE
│   ├── parts/                    ← Part descriptions (auto-generated)
│   ├── assignments/registry.json ← Who claimed what (Git-synced)
│   ├── logs/activity.jsonl       ← Full activity log
│   └── merged/                   ← Final merged output
│
├── 🛠️ scripts/                   ← HELPER SCRIPTS
│   ├── status.ps1                ← Show all parts & who's working
│   ├── sync.ps1                  ← Pull latest & check conflicts
│   └── log.ps1                   ← View filtered activity log
│
└── 💻 workspace/                 ← ALL CODE LIVES HERE
    ├── part-1/                   ← Member A's isolated workspace
    ├── part-2/                   ← Member B's isolated workspace
    └── ...                       ← One folder per part
```

---

## 📌 Commands Cheatsheet

Just say these to your AI agent in the chat:

```
┌──────────────────┬──────────────────────────────────────────────┐
│  What You Say     │  What Happens                                │
├──────────────────┼──────────────────────────────────────────────┤
│  setup            │  Checks project structure, looks for plan    │
│  split            │  Reads plan → asks parts count → creates all │
│  status           │  Shows all parts with assignments            │
│  claim part 3     │  Pulls → checks availability → claims → push │
│  start            │  Pulls latest → begins coding your part      │
│  done             │  Marks your part complete → pushes            │
│  check            │  Pulls latest from GitHub, shows updates     │
│  merge            │  Verifies ALL parts done → merges project    │
│  log              │  Shows activity history with timestamps      │
└──────────────────┴──────────────────────────────────────────────┘
```

---

## 🏆 Why Teams Love This

<table>
<tr>
<td align="center">⏱️<br/><b>2-Minute Setup</b><br/><sub>Clone, run script, done. No config needed.</sub></td>
<td align="center">🚫<br/><b>Zero Merge Conflicts</b><br/><sub>Isolated folders = no stepping on toes.</sub></td>
<td align="center">📊<br/><b>Full Visibility</b><br/><sub>Everyone sees who's doing what, live.</sub></td>
</tr>
<tr>
<td align="center">🤖<br/><b>AI Does The Boring Stuff</b><br/><sub>Splitting, tracking, logging — automated.</sub></td>
<td align="center">📝<br/><b>Auto Documentation</b><br/><sub>Activity log = project timeline for judges.</sub></td>
<td align="center">⭐<br/><b>Pro Repo Structure</b><br/><sub>Looks professional from commit #1.</sub></td>
</tr>
</table>

---

## 📥 How to Import Into Your Project

### Option 1 — Clone & Go (Recommended)
```bash
git clone https://github.com/Anshulpj12/SETUP_Detox.git my-hackathon
cd my-hackathon
git remote remove origin
git remote add origin https://github.com/YOUR_TEAM/your-repo.git
.\setup.ps1 -ProjectName "YourProjectName"    # Windows
# bash setup.sh --name "YourProjectName"      # Linux/Mac
git push -u origin main
```

### Option 2 — Use as GitHub Template
> If the repo owner has enabled **Template Repository** in settings:

Click **"Use this template"** → name your repo → clone → run setup. Done.

### Option 3 — Fork
Click **"Fork"** on GitHub → clone your fork → run setup → push.

> 📘 **For detailed step-by-step instructions, see the [Import Guide →](IMPORT_GUIDE.md)**

---

## 🧑‍🤝‍🧑 Team Roles

| Role | What They Do |
|------|-------------|
| **🎯 Team Lead** | Fills `PLAN.md`, runs `split`, runs `merge` at the end |
| **👨‍💻 Members** | Clone repo, `claim` a part, `start` building, mark `done` |
| **🤖 AI Agent** | Reads rules, enforces workflow, logs everything, manages merge |

---

## 💬 Example: A Real Hackathon Flow

```
┌─────────────────────────────────────────────────────────────────┐
│  HACKATHON STARTS — 9:00 AM                                     │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  9:00  Team Lead clones SETUP_Detox, runs setup.ps1             │
│  9:05  Team Lead writes PLAN.md with full project details       │
│  9:10  Team Lead tells AI: "split" → AI creates 4 parts        │
│  9:12  Team Lead pushes to GitHub, shares repo link in chat     │
│                                                                  │
│  9:15  Member A: "claim part 1" → Frontend UI (claimed ✅)      │
│  9:15  Member B: "claim part 2" → Backend API (claimed ✅)      │
│  9:16  Member C: "claim part 3" → Database & Auth (claimed ✅)  │
│  9:16  Member D: "claim part 4" → Integration & Deploy (✅)     │
│                                                                  │
│  9:20  Everyone: "start" → AI pulls latest → coding begins     │
│        Each member works in workspace/part-X/ only               │
│        AI logs every prompt and file change                      │
│                                                                  │
│  2:00 PM  Member A: "done" → Part 1 complete ✅                 │
│  3:30 PM  Member C: "done" → Part 3 complete ✅                 │
│  4:00 PM  Member B: "done" → Part 2 complete ✅                 │
│  4:30 PM  Member D: "done" → Part 4 complete ✅                 │
│                                                                  │
│  4:35  Team Lead: "merge" → AI verifies all 4 parts ✅          │
│        AI combines everything into final project                 │
│                                                                  │
│  4:45  Final push. Project ready for demo. 🎉                   │
│                                                                  │
│  📜 Activity log = full project timeline for judges             │
└─────────────────────────────────────────────────────────────────┘
```

---

## ❓ FAQ

<details>
<summary><b>What AI agents work with this?</b></summary>

Any AI agent that reads `.gemini/rules/` files — primarily **Google Antigravity**. But since the rules are written in plain markdown, any AI coding assistant can follow them if you point it to the rules files.

</details>

<details>
<summary><b>What if two people try to claim the same part?</b></summary>

The AI checks `registry.json` from GitHub before claiming. First person to push wins. The second person gets: *"⛔ Part X is already taken by [name]. Choose another."*

</details>

<details>
<summary><b>Can one person work on multiple parts?</b></summary>

Yes! Just `claim part X` for each part you want. The AI tracks all your assignments.

</details>

<details>
<summary><b>What if I need code from another part?</b></summary>

Wait until merge. Parts are isolated during development to prevent conflicts. If you need a shared utility, coordinate with your team lead to put it in a shared folder.

</details>

<details>
<summary><b>Where exactly does my code go?</b></summary>

Only in `workspace/part-X/` where X is your claimed part number. The AI will not let you write to another part's folder.

</details>

<details>
<summary><b>What does the activity log look like?</b></summary>

```json
{
  "timestamp": "2026-11-14T14:32:00+05:30",
  "member": "anshul",
  "part": "part-2",
  "action": "Created REST API endpoints for user CRUD operations",
  "prompt": "Build user signup and login API with JWT auth",
  "files_changed": ["workspace/part-2/routes/auth.js", "workspace/part-2/models/User.js"],
  "type": "CODE"
}
```

</details>

<details>
<summary><b>Does this work without an AI agent?</b></summary>

The structure and scripts work without AI — you can manually claim parts by editing `registry.json` and coding in part folders. But the magic is in the AI automation — it handles the boring stuff so you focus on building.

</details>

<details>
<summary><b>Can I customize the rules?</b></summary>

Absolutely! Edit `.gemini/rules/hackathon-workflow.md` to change how the AI behaves. Add new rules, modify the commit format, change the folder structure — it's all yours.

</details>

---

## 🌟 Show Your Support

If SETUP_Detox helped your team, give it a ⭐ on GitHub!

```
             ⭐ Star this repo = more teams discover it
              ↓
  https://github.com/Anshulpj12/SETUP_Detox
```

---

## 🤝 Contributing

Want to make SETUP_Detox better? 

1. Fork the repo
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m "Add amazing feature"`
4. Push: `git push origin feature/amazing-feature`
5. Open a Pull Request

Ideas for contributions:
- Support for more AI agents (Copilot, Claude, etc.)
- Bash equivalents of all PowerShell scripts
- Web dashboard for team status
- Slack/Discord integration for notifications
- Auto-conflict resolution during merge

---

## 📄 License

MIT — use it, fork it, build with it. Free forever.

---

<p align="center">
  <b>Built for hackers, by hackers. 🚀</b><br/>
  <sub>Stop wasting time on setup. Start building what matters.</sub><br/><br/>
  <a href="https://github.com/Anshulpj12/SETUP_Detox">⭐ Star</a> · <a href="IMPORT_GUIDE.md">📥 Import Guide</a> · <a href="https://github.com/Anshulpj12/SETUP_Detox/issues">🐛 Report Bug</a> · <a href="https://github.com/Anshulpj12/SETUP_Detox/issues">💡 Request Feature</a>
</p>
