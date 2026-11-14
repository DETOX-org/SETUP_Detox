# 📥 SETUP_Detox — Import & Usage Guide

> **For anyone who wants to use SETUP_Detox in their hackathon, team project, competition, or any collaborative development.**

---

## ⚡ 3 Ways to Import

### Way 1: Use as GitHub Template (Recommended)

1. Go to **[github.com/Anshulpj12/SETUP_Detox](https://github.com/Anshulpj12/SETUP_Detox)**
2. Click the green **"Use this template"** button → **"Create a new repository"**
3. Name your repo (e.g., `my-team-project`)
4. Clone your new repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/my-hackathon-2026.git
   cd my-hackathon-2026
   ```
5. Run setup:
   ```powershell
   # Windows
   .\setup.ps1 -ProjectName "My Hackathon"

   # Linux/Mac
   bash setup.sh --name "My Hackathon"
   ```

> **⚠️ For this to work, the repo owner must enable "Template repository" in GitHub → Settings → General → check "Template repository".**

---

### Way 2: Fork It

1. Go to **[github.com/Anshulpj12/SETUP_Detox](https://github.com/Anshulpj12/SETUP_Detox)**
2. Click **"Fork"** → create your own copy
3. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/SETUP_Detox.git
   cd SETUP_Detox
   ```
4. Run setup:
   ```powershell
   .\setup.ps1 -ProjectName "My Hackathon"
   ```

---

### Way 3: Clone Directly (Quickest)

```bash
# Clone the repo
git clone https://github.com/Anshulpj12/SETUP_Detox.git my-project
cd my-project

# Remove original remote and add your own
git remote remove origin
git remote add origin https://github.com/YOUR_TEAM/your-project-repo.git

# Run setup
# Windows:
.\setup.ps1 -ProjectName "My Project" 
# Linux/Mac:
bash setup.sh --name "My Project"

# Push to your team's repo
git add -A
git commit -m "[SETUP_Detox] INIT | Project initialized"
git push -u origin main
```

---

## 🚀 After Import — Full Workflow (Step by Step)

### Step 1: Fill the Plan (Team Lead — 5 min)

Open `.hackathon/context/PLAN.md` and fill in:
- Project name & description
- Tech stack (React, Python, etc.)
- All features you want to build
- Architecture (frontend/backend/database)
- Team size

```markdown
## Project Name
EcoTracker — Carbon Footprint Calculator

## Tech Stack
React, Node.js, MongoDB, TailwindCSS

## Features
1. User authentication (Google OAuth)
2. Dashboard with carbon stats
3. Activity logging (transport, food, energy)
4. Leaderboard & challenges
5. REST API for all data
...
```

Commit and push:
```bash
git add .hackathon/context/PLAN.md
git commit -m "[SETUP_Detox] PLAN | Team lead added project plan"
git push
```

---

### Step 2: Split the Work (Tell AI Agent)

Open your AI agent (Antigravity, Cursor, etc.) in this workspace and say:

```
split
```

The AI will:
1. ✅ Read your `PLAN.md`
2. ❓ Ask: *"How many parts should I split this into?"*
3. 📝 Create `part-1.md`, `part-2.md`, etc. with detailed descriptions
4. 📂 Create `workspace/part-1/`, `workspace/part-2/`, etc.
5. 📤 Push everything to GitHub

---

### Step 3: Team Members Clone & Claim

Each team member:

```bash
# Clone the repo
git clone https://github.com/YOUR_TEAM/your-hackathon-repo.git
cd your-hackathon-repo
```

Then open AI agent and say:

```
status
```
→ See all parts and who's working on what.

```
claim part 2
```
→ AI checks GitHub, marks Part 2 as yours, pushes immediately.

---

### Step 4: Start Building

Tell your AI agent:

```
start
```

The AI will:
1. 🔄 Pull latest from GitHub
2. ✅ Verify your part is still yours
3. 💻 Start coding ONLY in `workspace/part-2/` (your part)
4. 📝 Log every action with your name, timestamp, and prompt

**Give it coding prompts like normal:**
```
Create the user authentication with Google OAuth using Passport.js
```

The AI writes code in your isolated part folder and logs everything.

---

### Step 5: Mark Done

When your part is complete:

```
done
```

AI marks your part as ✅ COMPLETED and pushes to GitHub.

---

### Step 6: Merge (Team Lead)

When ALL parts show ✅:

```
merge
```

AI verifies everything → combines all parts → final project ready! 🎉

---

## 📌 Quick Command Cheatsheet

| You Say | What Happens |
|---------|-------------|
| `setup` | Check project structure |
| `split` | AI reads plan → splits into parts |
| `status` | Show all parts & assignments |
| `claim part 3` | Claim Part 3 (checks GitHub first) |
| `start` | Pull latest → begin coding |
| `done` | Mark your part complete → push |
| `check` | Pull latest from GitHub |
| `merge` | Verify all done → merge project |
| `log` | Show activity history |

---

## ❓ FAQ

**Q: What AI agents work with this?**
A: Any AI that reads `.gemini/rules/` — Antigravity (Google), and any tool that supports workspace rules. The rules are in plain markdown so any AI can follow them.

**Q: What if two people try to claim the same part?**
A: The AI checks `registry.json` via Git. First person to push their claim wins. Second person is told to pick another part.

**Q: Can I work on two parts?**
A: Yes! Just `claim part X` for each. The AI tracks both.

**Q: What if I need to use something from another part?**
A: Wait until merge. Each part is isolated during development to prevent conflicts.

**Q: Where does my code go?**
A: ONLY in `workspace/part-X/` where X is your claimed part number.

**Q: Can I see what others are doing?**
A: Yes! `status` shows all parts. `log` shows every action by every member.

---

## 🏆 Pro Tips for Teams

1. **Detailed PLAN.md = Better splits** — spend 10 min on the plan, it pays off
2. **Claim early** — tell your team to claim parts as soon as the split is done
3. **Push often** — keep `registry.json` synced so everyone sees live progress
4. **Use `check` before long breaks** — stay in sync with your team
5. **The activity log is your project timeline** — judges, professors, and managers love seeing this
6. **Star the SETUP_Detox repo** ⭐ — support the project!
