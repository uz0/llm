---
layout: default
title: "Quint Code: Complete Guide"
order: 999
---


# Part 1: The Philosophy Behind Quint Code

## What Problem Does This Solve?

Ivan Zakutnii identifies the core issue in his article "Please Think!":

> "The main engineering work, if we're talking about mature, result-oriented, and reasonable engineering – feels like detective work, in a quite a mystically complicated case."

The problem isn't that LLMs can't generate code—they can. The problem is:

1. **No structure for thinking** — Context gets scattered, hypotheses are tested by gut feeling
2. **Anchoring bias** — Jumping to the first "sounds reasonable" solution
3. **Lost rationale** — "Why did we build it this way?" is unanswerable in 3 months
4. **Grounding gap** — Ideas not connected to reality (as explained in "Reality Check" article)

## The "Grounding in Reality" Principle

From "Reality Check: The Skill You Should Master as an Engineer":

> "Rational work can only happen where there is grounding in reality."

**Grounding** means basing decisions on **primary metrics** from the real world, not on:
- "That's how people think"
- "It goes without saying"
- "Everyone on social media says so"

This is exactly what Quint Code operationalizes: it forces you to gather EVIDENCE before deciding.

## The "Jitter" Detection Skill

From "Trust Your Gut: How to Spot Gaps Between Reality and Subjective Ideas":

**Jitter** is the feeling that "something's not right." Semantic patterns to watch for:
- Vague, confused answers without confidence
- Phrases like "seems possible," "in principle," "theoretically"
- Too long answers to specific closed questions
- Too quick answers to questions requiring analysis
- Vague phrases without grounded specifics

**Quint Code makes jitter explicit** through the ADI cycle—it forces logical verification before empirical testing.

## Augmented Intelligence Mindset

From "Why Augmented after all?":

> **Artificial Intelligence** — autonomous agents working without humans
> **Augmented Intelligence** — symbiosis of human and AI, where each strengthens the other

Quint Code is built for Augmented Intelligence:
- **AI generates** hypotheses, finds evidence, writes plans
- **Human decides** at each step (External Transformer Mandate)
- Neither can work optimally alone

---

# Part 2: Core Concepts

## The Five Invariants (Why "Quint")

FPF requires any valid aggregation to preserve five properties:

| Invariant | Name | Plain English | Application in Quint Code |
|-----------|------|---------------|--------------------------|
| **IDEM** | Idempotence | One part alone stays itself | A single hypothesis doesn't gain confidence by being alone |
| **COMM** | Commutativity | Order of independent parts doesn't matter | Evidence A then B = B then A (same conclusion) |
| **LOC** | Locality | Which worker runs the analysis is irrelevant | Reproducible reasoning regardless of who re-runs |
| **WLNK** | Weakest Link | Whole is only as strong as weakest part | **min(evidence), NEVER average** |
| **MONO** | Monotonicity | Improving a part cannot worsen the whole | Adding better evidence only helps |

### WLNK Is the Most Critical

From the FPF specification:

> "Most reasoning failures in software architecture come from violating WLNK: averaging away weak evidence, hiding uncertainty behind confident prose, or treating 'mostly sure' as 'sure.'"

**Example:**
```
Evidence A: L2 (internal benchmark)     → R_eff = 1.0
Evidence B: L2 (official docs)          → R_eff = 1.0
Evidence C: L1 (blog, low congruence)   → R_eff = 0.65

Combined Assurance: R_eff = 0.65 ← Weakest link caps everything!
```

## The ADI Cycle

**Abduction → Deduction → Induction → (Audit) → Decision**

This is NOT arbitrary—it maps to how rigorous reasoning actually works:

1. **Abduction** (Hypothesis Generation): "What could explain this? What could solve this?"
2. **Deduction** (Logical Verification): "Does this make sense given what we know?"
3. **Induction** (Empirical Testing): "Does reality confirm or deny this?"
4. **Audit** (Bias Check): "Are we fooling ourselves?"
5. **Decision** (Lock In): "Given all evidence, what do we choose?"

## Method vs. Work Distinction

From FPF's "Strict Distinction" principle:

| Aspect | Method (Design-Time) | Work (Run-Time) |
|--------|---------------------|-----------------|
| Definition | The recipe, the plan | The cooking, the actual execution |
| Artifact | Code you plan to write | Test results, logs, benchmarks |
| Question | "What do we want to do?" | "What actually happened?" |

**This prevents confusing** "I figured out how to do it" with "I proved it works."

## Assurance Levels

| Level | Name | Meaning | How to Reach |
|-------|------|---------|--------------|
| **L0** | Observation | Unverified hypothesis | `/q1-hypothesize` |
| **L1** | Reasoned | Passed logical check | `/q2-check` |
| **L2** | Verified | Empirically tested | `/q3-test` or `/q3-research` |
| **Invalid** | Disproved | Was wrong—kept for learning! | Failed at any stage |

**Critical:** Invalid knowledge is KEPT, not deleted. Learning from failures is valuable.

## Formality Scale (F-Score)

From FPF specification (C.2.3):

| Range | Name | Description | Examples |
|-------|------|-------------|----------|
| F0-F2 | Sketch | Rough ideas, vague constraints | Whiteboard notes, brainstorms |
| F3-F5 | Structured | Clear steps, executable | Code, tests, clear specifications |
| F6-F9 | Rigorous | Formal proofs, machine-verified | Mathematical models, formal proofs |

**Most engineering work targets F3-F5.**

---

# Part 3: Installation and Setup

## Step 1: Install Quint Code

**Global installation (recommended for personal use):**
```bash
curl -fsSL https://raw.githubusercontent.com/m0n0x41d/quint-code/main/install.sh | bash -s -- -g
```

**Per-project installation (for team use, commit to repo):**
```bash
curl -fsSL https://raw.githubusercontent.com/m0n0x41d/quint-code/main/install.sh | bash
```

**Alternative via quint.codes:**
```bash
curl -fsSL https://quint.codes/install.sh | bash
quint-code init claude
```

This installs the following commands:
- `q0-init`, `q1-hypothesize`, `q1-extend`
- `q2-check`
- `q3-test`, `q3-research`
- `q4-audit`
- `q5-decide`
- `q-status`, `q-query`, `q-decay`, `q-reset`

## Step 2: Initialize Your Project

```bash
cd /path/to/your/project
claude
/q0-init
```

**What happens during `/q0-init`:**

1. **Creates `.fpf/` directory structure:**
```
.fpf/
├── knowledge/
│   ├── L0/           # Unverified hypotheses
│   ├── L1/           # Logically verified
│   ├── L2/           # Empirically tested
│   └── invalid/      # Disproved (kept for learning!)
├── evidence/         # Test results, research findings
├── decisions/        # DRRs (Design Rationale Records)
├── sessions/         # Archived reasoning cycles
├── session.md        # Current cycle state
├── context.md        # Project context and constraints
└── config.yaml       # Project settings (optional)
```

2. **Scans your repository** to understand the tech stack

3. **Conducts an interview** about context slices:
   - **Grounding Slice**: Infrastructure, region, deployment
   - **Tech Stack Slice**: Language, frameworks, versions
   - **Constraints Slice**: Compliance, budget, timeline

4. **Creates `context.md`** with structured context

**Example interview questions:**
- "I see Python and Django. What's our budget?"
- "Expected scale (100 rps or 100k rps)?"
- "What are the hard constraints?"

---

# Part 4: The Complete Command Workflow

## Phase 1: `/q1-hypothesize` (Abduction)

**Purpose:** Generate 3-5 competing hypotheses before anchoring on one.

**Usage:**
```
/q1-hypothesize "How should we handle [your problem]?"
```

**What happens:**
1. AI takes on **ExplorerRole** (creative, divergent thinking)
2. Generates hypotheses classified by novelty:
   - **Conservative:** Proven, reliable solution
   - **Novel:** Modern, enthusiastic approach
   - **Radical:** Risky but potentially powerful

**NQD Classification (Novelty, Quality, Diversity):**
- Ensures you don't just get variations of the same idea
- Forces exploration of the solution space

**Output:** Hypotheses saved to `.fpf/knowledge/L0/`

**Additional command: `/q1-extend`**
Manually add your own hypothesis to the L0 pool.

## Phase 2: `/q2-check` (Deduction)

**Purpose:** Find logical contradictions WITHOUT writing any code.

**Usage:**
```
/q2-check
```

**What happens:**
1. AI takes on **LogicianRole** (strict, deductive)
2. Checks each hypothesis against:
   - Project context from `context.md`
   - Logical consistency
   - Constraint compatibility

**Example rejection:**
> "If we start building microservices (hypothesis), and we have 2 juniors on the team (context), 1 mid-level and no infrastructure engineers — we'll die at the devops stage."

Hypothesis rejected **before** you spend 2 weeks setting up Kubernetes.

**Output:**
- Valid hypotheses promoted to `.fpf/knowledge/L1/`
- Rejected hypotheses stay in L0 with noted concerns

## Phase 3a: `/q3-test` (Induction - Internal)

**Purpose:** Gather internal empirical evidence.

**Usage:**
```
/q3-test
```

**Activities:**
- Run existing unit tests
- Create benchmarks/prototypes
- Execute proof-of-concept code
- Measure performance characteristics

## Phase 3b: `/q3-research` (Induction - External)

**Purpose:** Gather external evidence from documentation, articles, benchmarks.

**Usage:**
```
/q3-research
```

**Critical: Assess Congruence**

External evidence may not apply to your context:

| Congruence Level | Φ Penalty | Example |
|------------------|-----------|---------|
| **High** | 0.00 | Same tech, similar scale, similar use case |
| **Medium** | 0.15 | Same tech, different scale |
| **Low** | 0.35 | Related tech, very different context |

**Formula:** `R_eff = R_base - Φ(CL)`

A blog post with low congruence gets penalized significantly.

## Phase 4: `/q4-audit` (Optional but Recommended)

**Purpose:** The "weakest link doesn't mean useless" check.

**Usage:**
```
/q4-audit
```

**What happens:**
1. AI takes on **AuditorRole** (adversarial, critical)
2. Performs WLNK analysis:
   - Identifies your weakest piece of evidence
   - Calculates combined assurance level
3. Checks for cognitive biases:
   - Confirmation bias
   - Anchoring bias
   - Availability heuristic
4. Assesses congruence of external data

**When NOT to skip audit:**
- Multiple hypotheses survived phase 3
- Evidence came primarily from external sources
- Decision affects multiple teams or has long-term impact

## Phase 5: `/q5-decide` (Decision)

**Purpose:** Lock in your choice with full rationale documented.

**Usage:**
```
/q5-decide
```

**What happens:**
1. AI presents complete analysis:
   - Context summary
   - All hypotheses with their journey (L0→L1→L2)
   - Evidence collected
   - WLNK analysis
   - Risks and mitigations
2. **YOU choose the winner** (Transformer Mandate!)
3. Creates a Design Rationale Record (DRR)

**DRR contains:**
```markdown
# DRR-001: [Decision Title]

## Context
[Project context at time of decision]

## Decision
[What was chosen]

## Alternatives Considered
[Other hypotheses and why rejected]

## Evidence
[Links to evidence files]

## WLNK Analysis
[Weakest link identified, combined assurance]

## Validity Conditions
[When to revisit this decision]
- If load exceeds X requests/second
- If team grows beyond Y members
- After Z months regardless
```

---

# Part 5: Utility Commands

## `/q-status`

**Purpose:** "Where am I in the cycle?"

Shows:
- Current phase
- List of hypotheses with statuses (L0/L1/L2/invalid)
- Suggested next step

**Use when:** You return to a task after a break or lost the thread.

## `/q-query <topic>`

**Purpose:** Search the accumulated knowledge base.

**Examples:**
```
/q-query "order fulfillment"
/q-query "caching decisions L2"
/q-query "rejected hypotheses database"
```

**Filters available:**
- By topic keywords
- By confidence level (L0, L1, L2, invalid)
- By time period

## `/q-decay`

**Purpose:** Check evidence freshness (Epistemic Debt).

Evidence ages:
- Year-old benchmarks may be irrelevant
- Documentation for outdated library versions
- Links to deprecated APIs

Shows which evidence needs:
- Re-checking
- Marking as invalid
- Waiving with justification

## `/q-reset`

**Purpose:** Abandon current cycle while preserving learnings.

The knowledge gathered moves to archive, not deleted.

---

# Part 6: Practical Example - Project Specification Generation

## Scenario: New E-Commerce Platform Architecture

### Step 1: Initialize

```bash
cd ~/projects/ecommerce-platform
claude
/q0-init
```

**Interview answers:**
- Tech: Python, Django, PostgreSQL
- Budget: Medium (can use managed services)
- Scale: 10k orders/day initially, 100k target
- Constraints: GDPR compliance, 99.9% uptime requirement

### Step 2: First Architectural Decision - Database Strategy

```
/q1-hypothesize "How should we design the database architecture for an e-commerce platform expecting 100k orders/day?"
```

**AI generates:**
- **H1 (Conservative):** Single PostgreSQL with read replicas
- **H2 (Novel):** PostgreSQL for transactions + Redis for sessions + Elasticsearch for search
- **H3 (Radical):** Event-sourced architecture with CQRS

### Step 3: Logical Check

```
/q2-check
```

**Results:**
- H1: Passes basic logic, but may bottleneck at 100k orders
- H2: Passes, complexity matched to team size (checked context)
- H3: **Rejected** — "Context shows 2 Django devs, no event-sourcing experience. Learning curve would delay launch by 6 months."

### Step 4: Gather Evidence

```
/q3-research
```

**Finds:**
- PostgreSQL benchmarks for e-commerce (High congruence)
- Shopify's architecture articles (Medium congruence - much larger scale)
- Redis session management best practices

```
/q3-test
```

**Runs:**
- Load test simulation on PostgreSQL
- Redis session latency test
- Query performance benchmarks

### Step 5: Audit

```
/q4-audit
```

**WLNK Analysis:**
- H1 weakest link: No proof of handling 100k orders (only tested to 30k)
- H2 weakest link: Team hasn't operated Redis in production (but low risk)

### Step 6: Decide

```
/q5-decide
```

**Choose:** H2 (PostgreSQL + Redis + Elasticsearch)

**DRR Created:** `decisions/DRR-001-database-architecture.md`

---

### Repeat for Each Major Decision

Run the cycle for:
1. Database architecture ✓
2. Authentication system
3. Payment processing integration
4. Order processing workflow
5. Deployment strategy
6. Monitoring and alerting

### Your Specification Emerges

After 6 cycles, your `.fpf/decisions/` contains:
```
decisions/
├── DRR-001-database-architecture.md
├── DRR-002-authentication.md
├── DRR-003-payment-processing.md
├── DRR-004-order-workflow.md
├── DRR-005-deployment.md
└── DRR-006-monitoring.md
```

**This IS your project specification** — with full rationale!

---

# Part 7: Turning Decisions into Actionable Plans

## From DRRs to Implementation Tasks

Each DRR naturally breaks down into implementation tasks:

### Example: DRR-001-database-architecture.md

**Tasks derived:**
1. Set up PostgreSQL primary instance
2. Configure read replica
3. Set up Redis cluster
4. Implement session management with Redis
5. Set up Elasticsearch
6. Implement search indexing pipeline
7. Create database migration strategy
8. Write integration tests for all data stores

### Creating the Implementation Plan

```
/q-query "all DRRs"
```

Then for each DRR:
1. Extract implementation tasks
2. Order by dependencies
3. Estimate complexity
4. Assign to team members

### Validity Conditions as Checkpoints

Each DRR includes validity conditions:
- "Revisit if orders exceed 100k/day"
- "Revisit after 6 months"
- "Revisit if team grows beyond 5"

**Schedule these as calendar reminders!**

---

# Part 8: Integration with Your Workflow

## With Jira/Linear/Notion

From Ivan's real case:
> "Using artifacts from Quint Code I created a Story task in Jira and soon it will go into work."

1. Run Quint Code cycle
2. Export DRR to your task management
3. Break down into subtasks
4. Track implementation

## With Git

Commit `.fpf/` to your repository:
```bash
git add .fpf/
git commit -m "Add architectural decision records"
```

Team members can:
- Review decisions via PRs
- Query past decisions
- Understand rationale

## With Documentation

Your `.fpf/` directory IS your documentation source:
- `context.md` → Project overview
- `decisions/*.md` → Architecture Decision Records
- `knowledge/L2/` → Verified technical facts
- `evidence/` → Benchmarks, test results

---

# Part 9: When to Use Quint Code

## ✅ USE Quint Code When:

- **Architectural decisions** — Long-term consequences need documented rationale
- **Multiple viable approaches** — Systematic comparison prevents anchoring
- **Team decisions** — Auditable trail for async review and onboarding
- **Unfamiliar territory** — Structured research reduces "confident but wrong"
- **Decisions you'll need to defend** — Evidence stored, re-evaluation trivial
- **Complex debugging** — When root cause isn't obvious (per README)
- **Team disputes** — Copy disputes from Slack, let Quint Code analyze

## ❌ DON'T USE Quint Code When:

- "Paint the button red"
- "Write a sorting function"
- "Fix the bug in the webhooks endpoint"
- Quick fixes that take 10 minutes
- Genuinely obvious solutions (but be honest!)
- Easily reversible choices
- Time-critical emergencies

## Decision Heuristic

```
Is this decision:
  □ Hard to reverse?
  □ Affecting more than a few days of work?
  □ Involving multiple unknowns?
  □ Likely to be questioned later?

If any checked → Use Quint Code
If none → Skip, just decide
```

---

# Part 10: Connecting to Ivan Zakutnii's Philosophy

## From "Productivity through Primary Metrics"

Quint Code operationalizes time tracking for **thinking**:
- Track time spent in each phase
- Identify where you get stuck
- Measure improvement over time

## From "Don't Surprise the Engineers"

Following DRRs prevents surprises:
- New team members read decisions
- Rationale is explicit
- Breaking changes are visible

## From "Short Note on Abstractions"

FPF provides the abstraction level:
- Rise above specific implementation details
- Reason at the architectural level
- Maintain connection to reality through evidence

## From "Exception Generation is Pure Evil"

Apply to reasoning:
- Don't let unclear reasoning "throw exceptions"
- Handle uncertainty explicitly at each phase
- Make error handling (rejected hypotheses) visible

## From SOLID Principles Articles

Quint Code follows:
- **ISP:** Small, focused commands
- **OCP:** Extend by adding new cycles, not modifying old
- **LSP:** Each phase's output compatible with next phase's input

---

# Part 11: Advanced Topics

## Context Slicing (A.2.6)

Truth depends on where you stand. `/q0-init` creates structured slices:

- **Slice: Grounding** — Infrastructure, region, deployment environment
- **Slice: Tech Stack** — Language, frameworks, versions
- **Slice: Constraints** — Compliance, budget, timeline

## Explicit Role Injection

The AI isn't a generic chatbot—it enacts specific roles per phase:

- **ExplorerRole** (Hypothesize): Creative, divergent
- **LogicianRole** (Check): Strict, deductive
- **AuditorRole** (Audit): Adversarial, critical

## Congruence Assessment

For external evidence, always assess:
1. Is this the same technology?
2. Is this the same scale?
3. Is this the same use case?

Low congruence = significant R penalty.

## Epistemic Debt

Like technical debt, but for knowledge:
- Stale evidence accumulates
- Old decisions may be invalid
- Run `/q-decay` periodically

---

# Part 12: Summary - Your Action Plan

## Today

1. **Install:**
```bash
curl -fsSL https://raw.githubusercontent.com/m0n0x41d/quint-code/main/install.sh | bash -s -- -g
```

2. **Initialize:**
```bash
cd /your/project
claude
/q0-init
```

3. **Start with one real problem:**
```
/q1-hypothesize "How should we handle [your actual architectural question]?"
```

## This Week

Complete your first full cycle:
- `/q2-check`
- `/q3-test` and `/q3-research`
- `/q4-audit`
- `/q5-decide`

## This Month

- Run cycles for all major architectural decisions
- Build up your `.fpf/decisions/` directory
- Create your living project specification

## Ongoing

- Use `/q-query` to reference past decisions
- Run `/q-decay` monthly to check evidence freshness
- Re-run cycles when validity conditions are triggered

---

# Resources

- **Quint Code:** https://github.com/m0n0x41d/quint-code
- **Quint Website:** https://quint.codes
- **First Principles Framework:** https://github.com/ailev/FPF
- **Author's Blog:** https://ivanzakutnii.substack.com
- **DEV.to Article:** https://dev.to/m0n0x41d/stop-gambling-with-vibe-coding-meet-quint-1f3j

---

*"Quint Code implements about 10% of the First Principles Framework (FPF). That 10% is the Pareto Principle in action. It turns out you don't need a PhD in Formal Logic to improve AI and AI + Human collaborative reasoning."* — Ivan Zakutnii