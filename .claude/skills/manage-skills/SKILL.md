---
name: manage-skills
description: Skill lifecycle management — discover, evaluate, promote, deploy, and list skills across the vibe-hq library. Use with /manage-skills or when working with skill candidates.
---

## Commands

This skill supports subcommands via arguments: `discover`, `evaluate`, `promote`, `deploy`, `list`.

---

### discover [source]

Scan for skill candidates from internal projects and community repos.

**Internal discovery (no argument or `internal`):**
1. Read `registry/active/*.md` to get project list and paths
2. For each project, scan `.claude/skills/` for skills not in `library/skills/`
3. For each new skill found, create an evaluation file in `library/skills/_candidates/`
   - Copy the EVALUATION-TEMPLATE.md
   - Pre-fill: origin = project name, discovered = today, discovered by = /manage-skills discover
4. Update `library/skills/CATALOG.md` candidates table

**Community discovery (argument = repo name or `community`):**
1. Read the External Skill Registries section in `library/skills/CATALOG.md`
2. For each registry, use WebSearch or WebFetch to check for new/updated skills
3. Focus on skills matching these domains: business-ops, consulting, jurisdiction compliance, accounting, HR, legal
4. For each relevant skill found, create an evaluation file in `library/skills/_candidates/`
5. Update `library/skills/CATALOG.md` candidates table

**Session pattern discovery (argument = `patterns`):**
1. Review recent conversation for repeated patterns that could become skills
2. Look for: repeated prompts, domain knowledge lookups, multi-step workflows done more than once
3. Propose as candidates with origin = "session pattern"

---

### evaluate [candidate-name]

Run the evaluation checklist against a candidate skill.

1. Read `library/skills/_candidates/{candidate-name}.md`
   - If no evaluation file exists, create one from EVALUATION-TEMPLATE.md
2. For each criterion (relevance, quality, overlap, maintenance, license, adaptability, SG-specific):
   - Research the source (fetch repo README, read skill content)
   - Score 1-5 with notes
3. Calculate total score
4. Set verdict based on threshold: 20+ = promote, 15-19 = adapt, <15 = skip
5. If adapt: write specific adaptation notes (what to change, add, remove)
6. Save the completed evaluation

---

### promote [candidate-name]

Move an evaluated candidate into the library.

1. Read `library/skills/_candidates/{candidate-name}.md`
2. Verify verdict is "Promote as-is" or "Adapt then promote"
3. If "Adapt then promote":
   - Read the adaptation notes
   - Fetch the source skill content
   - Apply adaptations (add SG context, remove irrelevant sections, restructure)
4. Create the skill directory: `library/skills/{category}/{skill-name}/SKILL.md`
   - Use standard frontmatter: name, description
   - Include provenance comment: `<!-- Promoted from {source} on {date} -->`
5. Remove the candidate evaluation file from `_candidates/`
6. Update `library/skills/CATALOG.md`:
   - Add to the appropriate category table
   - Remove from candidates table
7. Report what was promoted and where

---

### deploy [skill-name] [project-name|all]

Push a library skill to one or more active projects.

1. Resolve the skill path in `library/skills/`
2. If project = "all":
   - Read `registry/active/*.md` to get project list
   - Filter to projects where the skill is relevant (check project type and stack)
3. For each target project:
   - Check if skill already exists in project's `.claude/skills/`
   - If exists: compare content, report if outdated, offer to update
   - If not exists: copy `library/skills/{path}/SKILL.md` to project's `.claude/skills/{name}/SKILL.md`
4. Update `library/skills/CATALOG.md` "Used By" column
5. Report: deployed to N projects, skipped M (already up to date)

**For business-ops projects** (type: business-ops in registry):
- These are iCloud/Google Drive locations, not git repos
- Skills are informational — store a reference in the registry entry rather than copying files
- Add a `## Skills` section to the registry .md file listing applicable skills

---

### list [category]

Show skills by category and status.

1. Read `library/skills/CATALOG.md`
2. If category specified: filter to that category
3. Display:
   - Active skills with deployment count
   - Candidates with evaluation status
   - External registries last scanned date
4. Highlight: skills with no deployments, candidates pending evaluation, stale external scans (>30 days)
