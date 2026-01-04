/**
 * Feature Addition Workflow
 *
 * Lightweight workflow for adding features to EXISTING large codebases (50K+ LOC).
 * NOT for greenfield projects — use codemachine-one.workflow.js for that.
 *
 * ## Philosophy: Cascade Reasoning
 * Uses different reasoning levels for different phases:
 * - LOW: Fast init/recon (speed matters, tasks are simple)
 * - MEDIUM: Balanced planning (need some reasoning, but not max)
 * - HIGH: Quality code generation (this is where quality matters most)
 *
 * ## Key Differences from codemachine-one:
 * | Aspect                  | codemachine-one        | feature-addition       |
 * |-------------------------|------------------------|------------------------|
 * | Blueprint orchestrator  | ✅ 6 sub-agents        | ❌ Skip                |
 * | Principal analyst       | ✅ Full spec review    | ❌ Skip                |
 * | Plan agent              | ✅ Comprehensive       | ⚡ Lightweight         |
 * | Loop iterations         | 20 max                 | 10 max                 |
 * | Sub-agents              | 6 architecture agents  | 0 (use existing arch)  |
 *
 * ## Use Case
 * Adding 3-10K LOC feature to existing 50K+ LOC project where:
 * - Architecture already exists
 * - Patterns are established
 * - You need to understand, not redesign
 *
 * @see https://github.com/moazbuilds/CodeMachine-CLI/issues/66
 * @see https://github.com/moazbuilds/CodeMachine-CLI/issues/50
 */

export default {
  name: 'Feature Addition Workflow',

  /**
   * Cascade Reasoning Strategy:
   *
   * ┌─────────────────┬──────────────┬─────────────────────────────────────┐
   * │ Phase           │ Reasoning    │ Why                                 │
   * ├─────────────────┼──────────────┼─────────────────────────────────────┤
   * │ init            │ LOW          │ Simple setup, no reasoning needed   │
   * │ context-manager │ LOW          │ Fast file scanning, pattern match   │
   * │ task-breakdown  │ MEDIUM       │ Some reasoning for task structure   │
   * │ code-generation │ HIGH         │ Quality code requires deep thinking │
   * │ task-sanity     │ MEDIUM       │ Validation needs balanced reasoning │
   * │ git-commit      │ LOW          │ Mechanical task, fast execution     │
   * │ check-task      │ MEDIUM       │ Loop decision needs some reasoning  │
   * └─────────────────┴──────────────┴─────────────────────────────────────┘
   *
   * Engine selection:
   * - codex: For speed-critical phases (init, context, commit)
   * - claude: For quality-critical phases (code-generation)
   */

  steps: [
    // ═══════════════════════════════════════════════════════════════════════
    // Phase 1: Quick Setup (LOW reasoning — speed matters)
    // ═══════════════════════════════════════════════════════════════════════
    resolveStep('init', {
      executeOnce: true,
      engine: 'codex',
      modelReasoningEffort: 'low'  // Fast: just create branch, setup gitignore
    }),

    separator("⟲ Feature Development Cycle ⟲"),

    // ═══════════════════════════════════════════════════════════════════════
    // Phase 2: Codebase Understanding (LOW reasoning — fast scanning)
    // This is CRITICAL — understand before you change
    // ═══════════════════════════════════════════════════════════════════════
    resolveStep('context-manager', {
      engine: 'codex',
      modelReasoningEffort: 'low'  // Fast: ls -R, read files, pattern match
    }),

    // ═══════════════════════════════════════════════════════════════════════
    // Phase 3: Lightweight Task Planning (MEDIUM reasoning)
    // Skip heavy planning — existing codebase has patterns
    // ═══════════════════════════════════════════════════════════════════════
    resolveStep('task-breakdown', {
      executeOnce: true,
      engine: 'codex',
      modelReasoningEffort: 'medium'  // Balanced: structure tasks from spec
    }),

    resolveStep('git-commit', {
      executeOnce: true,
      engine: 'codex',
      modelReasoningEffort: 'low'  // Fast: mechanical commit
    }),

    // ═══════════════════════════════════════════════════════════════════════
    // Phase 4: Quality Code Generation (HIGH reasoning — quality matters)
    // This is where you spend the reasoning budget
    // ═══════════════════════════════════════════════════════════════════════
    resolveStep('code-generation', {
      engine: 'claude',           // Claude for quality code
      model: 'sonnet',            // Sonnet is balanced (not opus — too slow)
      modelReasoningEffort: 'high'  // MAX reasoning for code quality
    }),

    // ═══════════════════════════════════════════════════════════════════════
    // Phase 5: Validation (MEDIUM reasoning — balanced checking)
    // ═══════════════════════════════════════════════════════════════════════
    resolveStep('task-sanity-check', {
      engine: 'codex',
      modelReasoningEffort: 'medium'  // Balanced: verify against requirements
    }),

    resolveStep('git-commit', {
      engine: 'codex',
      modelReasoningEffort: 'low'  // Fast: mechanical commit
    }),

    separator("◈◈ Feature Iteration Gate ◈◈"),

    // ═══════════════════════════════════════════════════════════════════════
    // Phase 6: Iteration Loop (fewer steps, fewer iterations than default)
    // ═══════════════════════════════════════════════════════════════════════
    resolveModule('check-task', {
      loopSteps: 4,               // Loop back 4 steps (context → code → check → commit)
      loopMaxIterations: 10,      // Max 10 iterations (vs 20 in codemachine-one)
      loopSkip: [],               // No skips needed in this lightweight flow
      engine: 'codex',
      modelReasoningEffort: 'medium'  // Balanced: decide if more work needed
    }),
  ],

  // No sub-agents needed — we use existing architecture, not create new
  subAgentIds: [],
};
