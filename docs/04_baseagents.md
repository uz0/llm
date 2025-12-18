---
layout: default
title: "Basic Agent Patterns"
order: 4
---

# Basic Agent Patterns

Introduction to fundamental agent patterns and simple implementation strategies, including LLM calls vs agents, Chain of Thought, tools integration, and RAG basics.

## Learning Objectives

After completing this module, you will be able to:
- Understand the difference between simple LLM calls and agent-based approaches
- Implement basic Chain of Thought (CoT) patterns
- Use LLM tools effectively with Claude API
- Create basic RAG (Retrieval-Augmented Generation) systems
- Set up embedding search with OpenAI API
- Implement basic tracing with Langfuse
- Build your first functional agent

## Prerequisites

- Completion of [03_claudecode](03_claudecode.md)
- Experience with building simple agents
- Understanding of basic system design concepts
- Familiarity with APIs and HTTP requests

## Course Module Content

> **WARNING CONTENT IN DEVELOPMENT**
>
> This module is currently being developed. The TODO list below shows the planned content structure. Check back later or contribute to help complete this module.

## Context TODO List & Future Content Plan

### Section 1: LLM Calls vs Agent-Based Approaches
- [ ] **Simple LLM Call Patterns**
  - Direct API usage with Claude
  - One-shot vs few-shot prompting
  - When to use simple calls vs agents
  - Performance and cost considerations

- [ ] **When to Evolve to Agents**
  - Complexity indicators
  - Task decomposition needs
  - Multi-step reasoning requirements
  - Tool usage scenarios

### Section 2: Basic Chain of Thought (CoT)
- [ ] **CoT Fundamentals**
  - What is Chain of Thought
  - Basic prompting techniques
  - Step-by-step reasoning patterns
  - Practical examples and use cases

- [ ] **Implementation Examples**
  - Code: Basic CoT with Claude API
  - Code: CoT for problem-solving
  - Code: CoT for planning and execution
  - Best practices and common pitfalls

### Section 3: LLM Tools Integration
- [ ] **Claude API Tools**
  - Function calling with Claude
  - Tool definition and usage
  - Error handling and validation
  - Parallel tool execution

- [ ] **Custom Tool Development**
  - Building custom tools
  - Tool composition patterns
  - Advanced tool orchestration
  - Real-world examples

### Section 4: RAG Search Fundamentals
- [ ] **RAG Architecture Overview**
  - What is Retrieval-Augmented Generation
  - Vector databases and embeddings
  - Document chunking strategies
  - Search and retrieval patterns

- [ ] **Implementation with OpenAI API**
  - Creating embeddings with OpenAI
  - Vector similarity search
  - Context injection strategies
  - Performance optimization

### Section 5: Embedding Tools with OpenAI
- [ ] **OpenAI SDK Integration**
  - Setting up OpenAI client
  - Text embedding models
  - Batch processing considerations
  - Cost optimization strategies

- [ ] **Building Search Systems**
  - Document indexing workflows
  - Similarity search algorithms
  - Ranking and filtering techniques
  - Real-world use cases

### Section 6: Tracing Basics with Langfuse
- [ ] **Introduction to Observability**
  - Why tracing is important for agents
  - Key metrics and insights
  - Debugging with traces
  - Performance monitoring

- [ ] **Langfuse Node.js Implementation**
  - Setting up Langfuse client
  - Instrumenting LLM calls
  - Custom spans and metrics
  - Dashboard usage and analysis

- [ ] **Basic Tracing Patterns**
  - Agent lifecycle tracking
  - Tool execution tracing
  - Error tracking and debugging
  - Cost and performance analysis

### Section 7: Building Your First Agent
- [ ] **Agent Architecture Basics**
  - Simple reactive agents
  - State management patterns
  - Error handling strategies
  - Testing approaches

- [ ] **Complete Implementation Example**
  - End-to-end agent project
  - File structure and organization
  - Configuration and deployment
  - Monitoring and maintenance

## Practice Planned Code Examples

### Basic CoT Implementation
```javascript
// TODO: Add basic CoT example
async function chainOfThought(prompt) {
  // Implementation will be added
}
```

### Claude API Tools
```javascript
// TODO: Add Claude tools example
const claudeTools = {
  // Implementation will be added
};
```

### RAG with OpenAI
```javascript
// TODO: Add RAG implementation
class RAGSystem {
  // Implementation will be added
}
```

### Langfuse Tracing
```javascript
// TODO: Add Langfuse example
import { Langfuse } from 'langfuse';
// Implementation will be added
```

---

## Quick Getting Started (Preview)

While this module is in development, you can:

### Prerequisites Setup

```bash
# Install OpenAI SDK
npm install openai

# Install Langfuse for tracing
npm install langfuse

# Set up environment variables
export OPENAI_API_KEY='your-key-here'
export LANGFUSE_SECRET_KEY='your-langfuse-secret'
export LANGFUSE_PUBLIC_KEY='your-langfuse-public'
```

### Basic Reading

1. **OpenAI Documentation** - Function calling and embeddings
2. **Claude API Documentation** - Tool usage
3. **Langfuse Documentation** - Observability and tracing
4. **Research Papers** - Chain of Thought and RAG techniques

### Practice Projects

1. **Simple Q&A Bot** - Use CoT for answering questions
2. **Document Search** - Implement basic RAG with OpenAI embeddings
3. **API Assistant** - Build agent with function calling
4. **Task Automation** - Create agent for simple workflows

---

## 🤝 Contributing

We welcome contributions to complete this module! See our [Contributing Guidelines](../CONTRIBUTING.md) for details.

### How to Help

1. **Pick a section** from the TODO list above
2. **Write the content** following our guidelines
3. **Include working code examples**
4. **Add practical exercises**
5. **Submit a pull request**

### Content Priority

**High Priority:**
- Basic CoT implementation examples
- Claude API tools integration
- OpenAI SDK usage patterns
- Langfuse tracing basics

**Medium Priority:**
- Advanced RAG techniques
- Performance optimization
- Error handling patterns
- Testing strategies

**Low Priority:**
- Advanced agent architectures
- Multi-agent systems
- Production deployment
- Scaling considerations

---

## 🔗 Related Resources

### Documentation
- [OpenAI API Documentation](https://platform.openai.com/docs)
- [Claude API Documentation](https://docs.anthropic.com/claude/reference)
- [Langfuse Documentation](https://langfuse.com/docs)

### Research Papers
- ["Chain-of-Thought Prompting Elicits Reasoning in Large Language Models"](https://arxiv.org/abs/2201.11903)
- ["Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks"](https://arxiv.org/abs/2005.11401)

### Tools and Libraries
- [OpenAI Node.js SDK](https://github.com/openai/openai-node)
- [Langfuse](https://github.com/langfuse/langfuse)
- [Vector Database Options](https://github.com/weaviate/weaviate) (and alternatives)

---

## 📅 Development Timeline

- **Phase 1** (Current): Basic structure and TODO outline [PASS]
- **Phase 2** (Next): Core CoT and tool integration examples
- **Phase 3**: RAG implementation and OpenAI SDK usage
- **Phase 4**: Langfuse tracing and observability
- **Phase 5**: Complete agent implementation example

---

## 📞 Contact

Have questions or want to contribute?

- **GitHub Issues**: Open an issue for specific questions
- **Discussions**: Start a discussion for general topics
- **Contributing**: See [Contributing Guidelines](../CONTRIBUTING.md)

---

**Note**: This is a work-in-progress module. Content will be added progressively based on community contributions and development priorities.

**Last updated**: December 2025