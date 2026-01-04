# Agent Handoff: Create Feature Addition Workflow for CodeMachine

## Your Task

Create a custom CodeMachine workflow template (`feature-addition.workflow.js`) designed for **adding features to existing large codebases (50K+ LOC)** — NOT greenfield project generation.

The workflow should:
1. Prioritize codebase understanding over heavy planning
2. Make minimal, non-risky changes
3. Respect existing architecture and patterns
4. Be lightweight compared to default `codemachine-one.workflow.js`

---

## Context Files to Read

### 1. Project Overview
- **README.md** — What CodeMachine is, supported engines
- **docs/customizing-workflows.md** — CRITICAL: How to create workflows

### 2. Existing Workflows (Reference)
- **templates/workflows/codemachine-one.workflow.js** — Default workflow (HEAVY, for greenfield)
- **templates/workflows/bmad.workflow.js** — Product-focused workflow with controller tracks
- **templates/workflows/test.workflow.js** — Example with `controller: true` and `tracks`

### 3. Agent Definitions
- **config/main.agents.js** — All available main agents
- **config/sub.agents.js** — All available sub-agents
- **config/modules.js** — Loop/trigger modules

### 4. Key Agent Prompts (for understanding capabilities)
- **prompts/templates/codemachine/main-agents/05-context-manager-agent.md** — Does codebase reconnaissance
- **prompts/templates/codemachine/main-agents/06-code-generation-agent.md** — Code implementation

### 5. GitHub Issues (Context)
- **memory-bank/context/github/issues/issue-50.md** — User complaint: overkill for small projects
- **memory-bank/context/github/issues/issue-42.md** — How to resume/tweak workflows
- **memory-bank/context/github/issues/issue-66.md** — Feature addition use case (my request)

---

## Key Findings from Codebase Analysis

### What Already Exists

| Component | Capability | Location |
|-----------|------------|----------|
| **Context Manager Agent** | `ls -R` codebase mapping, reads critical files, generates context briefing | `05-context-manager-agent.md` |
| **Controller Workflows** | `tracks` for conditional step execution | `test.workflow.js`, `bmad.workflow.js` |
| **resolveStep()** | Override engine, model, executeOnce, etc. | `docs/customizing-workflows.md` |
| **resolveModule()** | Loop/trigger behaviors | `config/modules.js` |

### What's Missing

- **Official "feature addition" workflow template** — Doesn't exist
- **"Codebase audit" agent** — Context Manager does recon, but no deep analysis
- **Lightweight mode** — No official way to skip heavy planning phases

---

## Workflow Design Requirements

### Use Case: Adding 3-10K LOC to Existing 50K+ LOC Project

**Differences from Greenfield:**

| Greenfield (codemachine-one) | Feature Addition (new workflow) |
|------------------------------|--------------------------------|
| Full architecture planning | Skip — use existing architecture |
| Blueprint orchestrator (6 sub-agents) | Skip — respect existing patterns |
| Comprehensive planning | Minimal — focus on specific feature |
| Create from scratch | Integrate with existing code |

### Proposed Workflow Structure

```javascript
// feature-addition.workflow.js
export default {
  name: 'Feature Addition Workflow',

  // Optional: Use controller for user selection
  // controller: true,
  // tracks: { ... },

  steps: [
    // Phase 1: Understand existing codebase (CRITICAL)
    resolveStep('context-manager'),  // Already does ls -R, reads critical files

    // Phase 2: Lightweight planning
    // Maybe custom agent or minimal plan-agent?

    // Phase 3: Implementation
    resolveStep('code-generation'),
    resolveStep('task-sanity-check'),
    resolveStep('git-commit'),

    // Phase 4: Loop if needed
    resolveModule('check-task', {
      loopSteps: 3,  // Fewer steps than default
      loopMaxIterations: 10
    }),
  ],

  subAgentIds: [], // Minimal sub-agents
};
```

---

## Available Agents Reference

### Main Agents (from config/main.agents.js)

| Agent ID | Purpose | Use in Feature Addition? |
|----------|---------|--------------------------|
| `init` | Create branch, setup gitignore | Maybe (once) |
| `principal-analyst` | Review specs, find ambiguities | Skip or minimal |
| `blueprint-orchestrator` | Run 6 architecture sub-agents | **SKIP** |
| `plan-agent` | Comprehensive development plan | Minimal or skip |
| `task-breakdown` | Extract tasks to JSON | Yes, but simplified |
| `context-manager` | Codebase recon, gather context | **CRITICAL** |
| `code-generation` | Implement based on context | **CRITICAL** |
| `runtime-prep` | Generate shell scripts | Optional |
| `task-sanity-check` | Verify against requirements | Yes |
| `git-commit` | Version control | Yes |

### Sub-Agents (from config/sub.agents.js)

Architecture sub-agents — **SKIP for feature addition**:
- founder-architect
- structural-data-architect
- behavior-architect
- ui-ux-architect
- operational-architect
- file-assembler

---

## Engine/Model Recommendations

For feature addition (optimize for speed/cost):

```javascript
// Lightweight config
{ engine: 'claude', model: 'sonnet' }  // Not opus — overkill

// Or use codex for speed
{ engine: 'codex', model: 'gpt-5' }
```

---

## Deliverables

1. **`templates/workflows/feature-addition.workflow.js`** — The new workflow file
2. **Explanation** — How each step works and why it's different from greenfield
3. **Usage instructions** — How to select/run this workflow
4. **Optional: Custom agent prompt** — If Context Manager needs enhancement for this use case

---

## Validation Criteria

The workflow should:
- [ ] Be significantly shorter than `codemachine-one.workflow.js` (skip heavy planning)
- [ ] Start with codebase understanding (Context Manager first)
- [ ] NOT run blueprint-orchestrator or heavy architecture phases
- [ ] Work with existing `.codemachine/tasks/` structure
- [ ] Support iterative development loop
- [ ] Be configurable via engine/model overrides

---

## How to Test

1. Install codemachine locally (npm link)
2. Navigate to existing project with 50K+ LOC
3. Add feature spec to `.codemachine/inputs/specifications.md`
4. Run codemachine and select new workflow (or modify default)
5. Verify it doesn't try to re-architect the whole project

---

## Reference: codemachine-one.workflow.js (SKIP THESE FOR FEATURE ADDITION)

```javascript
// CURRENT DEFAULT - TOO HEAVY FOR FEATURE ADDITION
steps: [
  resolveStep('init', { executeOnce: true }),
  resolveStep('principal-analyst', { executeOnce: true }),  // ← Maybe skip
  // ∴ Planning Phase ∴
  resolveStep('blueprint-orchestrator', { executeOnce: true }),  // ← SKIP (6 sub-agents!)
  resolveStep('plan-agent', { executeOnce: true }),  // ← Minimize or skip
  resolveStep('task-breakdown', { executeOnce: true }),
  resolveStep('git-commit', { executeOnce: true }),
  // ⟲ Development Cycle ⟲
  resolveStep('context-manager'),  // ← KEEP (critical)
  resolveStep('code-generation'),  // ← KEEP (critical)
  resolveStep('runtime-prep', { executeOnce: true }),  // ← Optional
  resolveStep('task-sanity-check'),  // ← KEEP
  resolveStep('git-commit'),  // ← KEEP
  // ◈◈ Iteration Gate ◈◈
  resolveModule('check-task', { loopSteps: 6, loopMaxIterations: 20, loopSkip: ['runtime-prep'] }),
]
```

---

## Related GitHub Discussion

- **Issue #50**: User spent $160 on 2K LOC — workflow overkill
- **Issue #42**: Workaround for adding features — manual task editing
- **Issue #66**: My feature request for this workflow (acknowledged by moazbuilds)

moazbuilds response on #50:
> "The default workflow in 0.7.0 is definitely overkill for small projects, it's designed for projects with 4,500+ lines of code... We'll add a new workflow in 0.8.0 that's better suited."

This workflow IS that missing piece.
