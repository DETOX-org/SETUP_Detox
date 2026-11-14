# 🚀 SETUP_Detox

### Instant AI-Powered Hackathon Team Collaboration Framework

> **One command. Full team setup. AI manages everything.**
>
> 📥 **Want to use this?** Read the **[Import & Usage Guide →](IMPORT_GUIDE.md)**

SETUP_Detox is a plug-and-play framework that sets up **AI-managed collaborative development** for hackathons and group projects. It handles task splitting, part assignment, isolated workspaces, GitHub sync, activity logging, and final merging — all through simple commands to your AI agent.

---

## ⚡ Quick Start (30 seconds)

### 1. Clone / Import
```bash
# Clone this repo into your project
git clone https://github.com/Anshulpj12/SETUP_Detox.git my-hackathon
cd my-hackathon
```

### 2. Run Setup
```powershell
# Windows
.\setup.ps1 -ProjectName "MyHackathon" -GitRemote "https://github.com/team/repo.git"

# Linux/Mac
bash setup.sh --name "MyHackathon" --remote "https://github.com/team/repo.git"
```

### 3. Write Your Plan
Edit `.hackathon/context/PLAN.md` with your full project plan.

### 4. Tell Your AI Agent
```
split
```

That's it! The AI reads your plan, asks how many parts, creates isolated workspaces, and manages everything.

---

## 🏗️ How It Works

```
┌─────────────────────────────────────────────────────────────┐
│                    SETUP_Detox Workflow                      │
│                                                              │
│  📋 PLAN.md ──→ 🤖 AI Splits ──→ 📦 Parts Created          │
│                       │                                      │
│              ┌────────┼────────┐                             │
│              ▼        ▼        ▼                             │
│          Part 1    Part 2    Part 3                          │
│          Member A  Member B  Member C                       │
│          ┌─────┐  ┌─────┐  ┌─────┐                         │
│          │work/│  │work/│  │work/│  ← Isolated folders      │
│          │pt-1/│  │pt-2/│  │pt-3/│                          │
│          └──┬──┘  └──┬──┘  └──┬──┘                         │
│             │        │        │                              │
│             ▼        ▼        ▼                              │
│          ✅ Done  ✅ Done  ✅ Done                           │
│              │        │        │                             │
│              └────────┼────────┘                             │
│                       ▼                                      │
│               🔀 AI Verifies & Merges                       │
│                       ▼                                      │
│               🎉 Final Project!                              │
└─────────────────────────────────────────────────────────────┘
```

---

## 📌 Commands Reference

Tell these to your AI agent in the chat:

| Command | What Happens |
|---------|-------------|
| **`setup`** | Checks project structure, looks for plan |
| **`split`** | AI reads plan → asks how many parts → creates part files & folders |
| **`claim part 2`** | Claims Part 2 for you (checks GitHub first!) |
| **`status`** | Shows all parts: who's working on what |
| **`start`** | Begins coding your claimed part (pulls latest first) |
| **`done`** | Marks your part as complete, pushes to GitHub |
| **`check`** | Pulls latest from GitHub, shows updates |
| **`merge`** | Verifies ALL parts done → merges into final project |
| **`log`** | Shows full activity log (who did what, when, with what prompt) |

---

## 📁 Project Structure

```
SETUP_Detox/
│
├── 📄 README.md              ← You're here
├── 📄 setup.ps1              ← Windows setup script
├── 📄 setup.sh               ← Linux/Mac setup script
├── 📄 .gitignore             ← Standard ignores
│
├── 📂 .gemini/               ← AI Agent Rules (auto-loaded)
│   └── rules/
│       ├── hackathon-workflow.md   ← Main workflow rules
│       └── ai-constraints.md      ← Strict do/don't rules
│
├── 📂 .hackathon/            ← Collaboration Engine
│   ├── context/
│   │   └── PLAN.md           ← YOUR PROJECT PLAN GOES HERE
│   ├── parts/
│   │   ├── part-1.md         ← Part 1 description & status
│   │   ├── part-2.md         ← Part 2 description & status
│   │   └── ...
│   ├── assignments/
│   │   └── registry.json     ← Who claimed what (synced via Git)
│   ├── logs/
│   │   └── activity.jsonl    ← Full activity log
│   └── merged/
│       └── MERGE_PLAN.md     ← Generated during merge
│
├── 📂 scripts/               ← Helper Scripts
│   ├── status.ps1            ← Quick status check
│   ├── sync.ps1              ← Pull & sync with team
│   └── log.ps1               ← View activity log
│
└── 📂 workspace/             ← ALL CODE GOES HERE
    ├── part-1/               ← Part 1 isolated workspace
    ├── part-2/               ← Part 2 isolated workspace
    ├── part-3/               ← Part 3 isolated workspace
    └── ...
```

---

## 🔄 Complete Workflow

### Phase 1: Setup (Team Lead)
1. Clone this repo or use it as a template
2. Run `setup.ps1` or `setup.sh`
3. Fill in `.hackathon/context/PLAN.md` with your full project plan
4. Tell AI: **"split"** → AI asks how many parts → creates everything
5. Push to GitHub: `git push origin main`

### Phase 2: Claim (Each Member)
1. Clone the repo
2. Tell AI: **"status"** → see available parts
3. Tell AI: **"claim part 2"** → AI checks GitHub, marks it, pushes
4. Start working: **"start"**

### Phase 3: Build (Each Member)
1. AI pulls latest before any coding
2. You work ONLY in `workspace/part-X/` folder
3. AI logs every action with your name, timestamp, and prompt
4. When done: **"done"** → AI marks complete, pushes

### Phase 4: Merge (Team Lead)
1. Tell AI: **"merge"**
2. AI verifies ALL parts are complete
3. AI creates merge plan and combines everything
4. Final project ready! 🎉

---

## 📜 Activity Logging

Every AI interaction is logged in `.hackathon/logs/activity.jsonl`:

```json
{
  "timestamp": "2026-11-14T21:15:00+05:30",
  "member": "anshul",
  "part": "part-2",
  "action": "Implemented user authentication with JWT",
  "prompt": "Create login and signup endpoints with JWT tokens",
  "files_changed": ["workspace/part-2/auth.py", "workspace/part-2/models.py"],
  "type": "CODE"
}
```

View logs:
```powershell
# Show last 20 entries
.\scripts\log.ps1

# Filter by member
.\scripts\log.ps1 -Member "anshul"

# Filter by part
.\scripts\log.ps1 -Part "part-2"
```

---

## 🤖 AI Agent Features

The `.gemini/rules/` folder automatically configures any AI agent with:

| Feature | Description |
|---------|-------------|
| **Context-First** | AI always reads PLAN.md before doing anything |
| **Smart Splitting** | AI creates detailed part descriptions with scope & acceptance criteria |
| **Conflict Prevention** | Parts are claimed via Git — no two people work on the same part |
| **Auto-Sync** | AI pulls from GitHub before every operation |
| **Isolation** | Each part has its own folder — no cross-contamination |
| **Full Logging** | Every prompt, action, and file change is recorded |
| **Verification** | AI checks all parts are done before allowing merge |
| **Structured Commits** | All commits follow `[SETUP_Detox] ACTION | Part: N | Member: name` format |

---

## 🌟 For Hackathon Teams

### Why SETUP_Detox?

- ⏱️ **Save 30+ minutes** of project setup time
- 🤝 **No merge conflicts** — isolated part folders
- 📊 **Full visibility** — everyone sees who's doing what
- 🤖 **AI manages the boring stuff** — splitting, tracking, logging
- 📝 **Built-in documentation** — activity log becomes your project timeline
- ⭐ **GitHub stars** — professional repo structure from minute one

### Tips for Teams

1. **Write a detailed PLAN.md** — the more detail, the better the AI splits
2. **Claim parts quickly** — first come, first served
3. **Check status often** — `status` command shows team progress
4. **Don't edit other parts** — the AI enforces this, but be disciplined
5. **Push frequently** — keep the team in sync

---

## 📦 Use as GitHub Template

1. Click **"Use this template"** on GitHub
2. Name your hackathon repo
3. Clone and run setup
4. Share with your team

---

## 📄 License

MIT — Use it, fork it, star it ⭐

---

<p align="center">
  <b>Built for hackers, by hackers. 🚀</b><br>
  <i>Stop wasting time on setup. Start building.</i>
</p>

