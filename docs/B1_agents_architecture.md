---
layout: default
title: "Advanced Agent Architectures"
order: 5
---

# Advanced Agent Architectures

> 📄 **PDF Version**: [Download the complete analysis (PDF)](B1_agents_architecture.pdf)

In-depth analysis of production-ready agent architectures with performance comparisons, based on research by Sergei Parfenov.

## Learning Objectives

After completing this module, you will be able to:
- Compare different agent architectures and their trade-offs
- Implement advanced patterns like ReAct, Self-Ask, and Tree of Thoughts
- Design multi-agent systems with coordination mechanisms
- Optimize agent performance for production workloads
- Understand performance characteristics and benchmarking results

## Prerequisites

- Completion of [04_baseagents](04_baseagents.md)
- Experience with building simple agents
- Understanding of distributed systems concepts

## Course Module Content

### Overview of Agent Architectures

| Architecture               | Key Idea                                    |
| ------------------------- | ------------------------------------------- |
| Basic Reflection          | Single-pass response generation             |
| Actor-Reflector           | Iterative self-critique and improvement     |
| Tree of Thoughts          | Tree-based solution search                  |
| Plan-and-Execute          | Explicit step-by-step planning              |
| ReWOO                     | Separation of reasoning and observations    |
| LLMCompiler               | DAG orchestration and parallelism           |

---

## Architecture Details

### Basic Reflection

**Based on:** _Reflexion: Language Agents with Verbal Reinforcement Learning_ (10/10/2023)

**Description:**
Basic reflection is an architecture where responses are generated iteratively through sequential generation, analysis, and text improvement using reflection.

**Workflow:**

1. User request enters the system
2. Initial response is generated using the first prompt (e.g., "write essay")
3. Response is passed to a second prompt for reflection (e.g., "evaluate essay")
4. Reflection stage generates critique and improvement ideas
5. Reflection and initial response are passed back to the original prompt for revised draft generation
6. Process repeats N times, then result is returned to user

**Key Feature:**
Response quality improves through repeating cycles of generation and self-analysis without using external tools or explicit planning.

### Actor-Reflector

**Source:** _Language Agents with Verbal Reinforcement Learning_ (10.10.2023)

**Workflow:**

- User request enters the system
- Initial response is generated along with self-critique and suggested tool queries
- Suggested tool queries are executed (e.g., web search for additional information)
- Original response, reflection, and additional context from tools are passed to revision prompt
- Response is updated, new self-reflection is created, and new tool usage suggestions are made
- Process repeats N times until final response is returned to user

### Tree of Thoughts (ToT)

**Source:** _Language Agent Tree Search Unifies Reasoning, Acting and Planning in Language Models_ (12/05/2023)

Uses LLMs as agents, value functions, and optimizers within a Monte Carlo Tree Search algorithm.

**Workflow:**

1. User request enters the system
2. Initial response is generated as the root node of the tree (either response or tool execution)
3. Reflection prompt generates:
   - reflection on result
   - result evaluation
   - determination if solution is found
4. Additional N candidates are generated considering previous output and reflection, tree expands
5. Reflection prompt evaluates and scores each new candidate
6. Best "trajectory" scores are updated
7. Next N candidates are generated from best child node, cycle repeats
8. Process continues until sufficient score is reached or maximum search depth is hit

### Plan-and-Execute

**Source:** _Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought Reasoning by Large Language Models_ (05/26/2023)

**Workflow:**

1. User request enters the system
2. Initial planning prompt forms step-by-step plan for request execution
3. First plan step is passed to agent for generation or tool execution
4. Original request, original plan, and previous step results are passed to re-planning prompt
5. Re-planner either updates plan or returns result to user
6. Updated step is passed back to agent
7. Cycle repeats N times until re-planner considers response sufficient

### ReWOO - Reasoning Without Observation

**Source:** _ReWOO: Decoupling Reasoning from Observations for Efficient Augmented Language Models_ (05/23/2023)

Combines multi-step planner with variable substitution for efficient tool usage, reducing token consumption and execution time.

**Execution Flow:**

1. User request enters the system
2. Planner generates plan as list of tasks with special placeholder variables
3. Plan is parsed, and each step is executed by LLM agent
4. Each step result is substituted into variables of next step and passed back to agent
5. After all steps complete, plan and "evidence" from tool execution are passed to Solver prompt
6. Solver generates and returns final response to user

### LLMCompiler

**Source:** _An LLM Compiler for Parallel Function Calling_ (02/06/2024)

LLMCompiler uses directed acyclic graph ideas from compiler design for automatic generation of optimized orchestration of parallel ReAct-style function calls.

**Key Ideas:**
- Use of directed acyclic graph (DAG)
- Automatic optimization of tool call order
- ReAct-style execution

**Workflow:**

1. User request enters the system
2. Planner generates task list with placeholder variables for dependencies and "thought" strings for reasoning
3. Task extraction module analyzes plan and determines inter-task dependencies
4. Independent tasks are sent to executor in parallel
5. Executor results return to task extraction module for dependency resolution
6. Cycle repeats until plan is complete
7. Full result is passed to Joiner prompt:
   - either final response is formed
   - or new "thought" is added and plan sent for re-planning
8. If needed, plan continuation is created (not entirely new plan)
9. Process repeats until Joiner determines sufficient information for user response

---

## Comparative Testing

**Query:**
> _Current trends in digital marketing for technology companies_

**Model:** GPT-4-Turbo

| Architecture       | Execution Time | Tokens  |
| ------------------ | -------------- | ------- |
| Basic Reflection   | 118.99 s       | 18,106  |
| Actor-Reflector    | 69.04 s        | 24,608  |
| Tree of Thoughts   | 29.52 s        | 8,493   |
| Plan-and-Execute   | 24.72 s        | 2,922   |
| ReWOO              | 21.64 s        | 5,828   |
| LLMCompiler        | 11.29 s        | 2,745   |

### Performance Analysis

#### Basic Reflection
Forced rework causes token count to **increase** with long input data, such as website text.

#### Language Agent Tree Search
Surprisingly fast despite generating large number of variants.

Can exponentially "run away" if search depth is high.

Using LLM as evaluator can be **very non-deterministic**.

#### Plan-And-Execute
Forced addition of planning stage makes process **slightly more efficient** than sequential revisions.

Tends to generate **good enough answers faster** using its own instructions.

#### Reasoning without Observation (ReWOO)
Optimization of plan-and-execute agents is **well evident** here.

More tokens, but **less processing time**.

#### LLMCompiler
Even deeper optimizations make architecture **very fast**, however it's **not configured for full report generation**.

---

## Notes and Limitations

- This is **not scientific comparison**
- These agents are **not configured** for the same task, prompt, or tools
- This is **not scientific comparison** and not a determination of "best" agent architecture
- Responses are **hallucinated**, not based on tool usage or external research
- Processing is slow, token usage is high
- Forced revisions increase token count with long input data (e.g., website text)
- Tree search can grow exponentially with large depth
- Using LLM as evaluator can be non-deterministic
- Planning stage makes process more efficient than series of revisions
- Plan-and-execute architectures show time optimization despite more tokens
- Additional optimizations make execution very fast but not oriented toward full report generation

---

## Sources

- [Reflexion: Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2303.11366)
- [Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2310.04406)
- [Language Agent Tree Search Unifies Reasoning, Acting and Planning in Language Models](https://arxiv.org/abs/2305.04091)
- [Plan-and-Solve Prompting: Improving Zero-Shot Chain-of-Thought Reasoning by Large Language Models](https://arxiv.org/abs/2305.18323)
- [ReWOO: Decoupling Reasoning from Observations for Efficient Augmented Language Models](https://arxiv.org/abs/2312.04511)

## About the Author

**Sergei Parfenov** - [LinkedIn Profile](https://www.linkedin.com/in/sergeiparfenov/)

Researcher and engineer in AI/machine learning, holding a bachelor's degree in Computer Information Systems (St. Petersburg State University of Economics and Finance) and completed CS231n: Deep Learning for Computer Vision at Stanford. Develops, creates, and implements production-ready machine learning/AI solutions that transform cutting-edge research into measurable business value.

---

## 🔗 Next Steps

After studying these architectures:

1. **Practice implementing** basic versions of each pattern
2. **Benchmark performance** for your specific use cases
3. **Combine patterns** for hybrid solutions
4. **Consider production requirements** (scalability, reliability, cost)
5. **Review the [Contributing Guidelines](../CONTRIBUTING.md)** if you want to help expand this content

---

*This module is based on research and analysis by Sergei Parfenov. For the complete research paper and detailed analysis, see the [PDF version](B1_agents_architecture.pdf).*