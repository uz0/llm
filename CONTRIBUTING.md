# Contributing to LLM Agents Workflow Course

Thank you for your interest in contributing to this educational resource! This guide will help you understand how to write high-quality technical articles and contribute effectively to the course materials.

## Local Development

### Requirements
- **Ruby** 2.7+
- **Bundler**: `gem install bundler`

### Quick Setup
```bash
# Navigate to docs folder (contains Jekyll files)
cd docs/

# Install dependencies
bundle install

# Ruby 3.0+ fix (if needed)
bundle add webrick
```

### Development Commands
```bash
# Serve locally with live reload
bundle exec jekyll serve --livereload

# Build static files only
bundle exec jekyll build

# Clean build artifacts
bundle exec jekyll clean
```

**Access**: http://localhost:4000

### GitHub Pages
- **Source**: `/docs` folder
- **Automatic build** on push
- **URL**: https://llm.uz0.dev

## Goals: Contribution Philosophy

We believe in creating educational content that is:
- **Practical**: Focus on real-world applications and examples
- **Accurate**: All technical content must be verified and correct
- **Accessible**: Write for developers with varying levels of expertise
- **Comprehensive**: Provide complete coverage with clear explanations
- **Actionable**: Include exercises, examples, and hands-on activities

## Content Writing Guidelines

### Content Structure

Follow this proven structure for technical articles:

#### 1. Title and Introduction
- **Clear, descriptive title** that indicates the topic and level
- **Brief introduction** that explains what the reader will learn
- **Prerequisites** list (if applicable)
- **Learning objectives** with specific, measurable outcomes

#### 2. Main Content Organization
```markdown
## Section 1: [Clear Section Title]
### Key Concept
- Explanation of the concept
- Why it matters
- Common pitfalls or misconceptions

### Practical Example
- Step-by-step implementation
- Code examples with explanations
- Expected vs. actual behavior
```

#### 3. Examples and Exercises
- **Code examples** should be complete and runnable
- **Exercises** should reinforce learning objectives
- **Solutions** should be provided separately or clearly marked
- **Real-world scenarios** should be included when possible

#### 4. Summary and Next Steps
- **Key takeaways** section
- **Further reading** recommendations
- **Related topics** in the course
- **Practice suggestions**

### Writing Style

#### DO [PASS]
- Write in clear, active voice
- Use simple, direct sentences
- Include specific, concrete examples
- Explain concepts from first principles
- Define terminology before using it
- Use analogies and metaphors when helpful
- Include code comments for complex examples
- Provide context for why concepts matter

#### DON'T [FAIL]
- Use jargon without definition
- Assume prior knowledge without stating prerequisites
- Write overly theoretical content without practical application
- Use vague statements like "it's easy" or "obviously"
- Include code without explanation
- Skip error handling in examples (unless intentionally teaching it)

## Analysis Technical Requirements

### Code Standards
- **Complete examples**: All code should be runnable as-is
- **Error handling**: Include proper error handling unless teaching specific concepts
- **Comments**: Add explanatory comments for complex logic
- **Formatting**: Use consistent code formatting (follow language conventions)
- **Dependencies**: List all required dependencies and versions
- **Testing**: Include tests or instructions for verifying the code works

### Documentation Standards
- **Accuracy**: All technical claims must be verified
- **Links**: Ensure all links are working and relevant
- **Versions**: Specify versions for tools, libraries, and APIs
- **Platforms**: Note any platform-specific requirements
- **Performance**: Include performance considerations where relevant

## Review Process

### Before Submitting
1. **Self-review**: Read through your content using our checklist
2. **Technical verification**: Test all code examples and commands
3. **Fact-checking**: Verify all technical claims and data
4. **Link checking**: Ensure all external links work
5. **Formatting**: Check for consistent formatting and style

### Submission Process
1. **Create an issue** describing your proposed contribution
2. **Wait for feedback** from maintainers before starting
3. **Create a feature branch** from the latest `main`
4. **Write your content** following these guidelines
5. **Submit a pull request** with:
   - Clear description of changes
   - Links to related issues
   - Testing instructions
   - Any breaking changes

### Review Criteria
Our reviewers evaluate contributions on:

#### Technical Accuracy (40%)
- Are all technical claims correct?
- Do code examples work as described?
- Are best practices followed?
- Is the content up-to-date with current technologies?

#### Educational Value (30%)
- Does the content achieve stated learning objectives?
- Is it appropriate for the target audience?
- Are examples practical and relevant?
- Does it build logically on previous course content?

#### Quality and Clarity (20%)
- Is the writing clear and easy to understand?
- Is the structure logical and well-organized?
- Are examples well-explained?
- Is formatting consistent?

#### Completeness (10%)
- Is the coverage comprehensive?
- Are edge cases addressed?
- Prerequisites clearly stated?
- Next steps provided?

## Style Style Guide

### Markdown Formatting
- Use **ATX-style headers** (`# Header 1`, `## Header 2`)
- Include a **table of contents** for longer articles (>2000 words)
- Use **code blocks** with language specification
- Include **line numbers** for code examples longer than 10 lines
- Use **blockquotes** for important notes or warnings

### Linking Guidelines
- **Internal links**: Use relative paths (`[text](../other-file.md)`)
- **External links**: Include descriptive anchor text
- **Code links**: Link to official documentation when referencing APIs
- **Example links**: Provide working links to live examples when possible

### Visual Elements
- **Diagrams**: Use Mermaid syntax for flowcharts and sequence diagrams
- **Images**: Optimize for web, include alt text
- **Tables**: Use **Markdown** tables for structured data
- **Callouts**: Use emojis and formatting for important information

## Course Content Templates

### Tutorial Template
```markdown
# [Tutorial Title]

Learn how to [specific outcome] by building [specific project].

## Prerequisites
- [Requirement 1]
- [Requirement 2]

## Learning Objectives
After this tutorial, you will be able to:
- [Specific skill 1]
- [Specific skill 2]

## Step 1: [Clear Step Title]
[Explanation and code]

## Step 2: [Clear Step Title]
[Explanation and code]

## Summary
You've learned [key concepts]. Next, try [related activity].
```

### Reference Template
```markdown
TBD
```

## Quick Getting Help

### Resources for Writers
- [Essay.app Guide](https://essay.app/guide/) - Modern technical writing principles
- [Technical Article Guidelines](https://github.com/iamfortune/Technical-Article-Guideline-Template) - Comprehensive template
- [Google Technical Writing Courses](https://developers.google.com/tech/writing) - Free courses on technical writing
- [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/) - Style guidelines

### Community Support
- **Discussions**: Use GitHub Discussions for questions about writing
- **Issues**: Tag maintainers for specific questions about content
- **Review requests**: Ask for reviews in pull requests or discussions

## Summary Quality Checklist

Before submitting your contribution, ensure:

### Content Quality
- [ ] Content aligns with course learning objectives
- [ ] Examples are practical and relevant
- [ ] Explanations are clear and accessible
- [ ] Prerequisites are clearly stated
- [ ] Learning outcomes are measurable

### Technical Accuracy
- [ ] All code examples are tested and working
- [ ] Technical claims are verified
- [ ] Dependencies and versions are specified
- [ ] Error handling is included where appropriate
- [ ] Performance considerations are addressed

### Documentation Standards
- [ ] Links are working and relevant
- [ ] Formatting is consistent
- [ ] Structure is logical and easy to follow
- [ ] Language is clear and concise
- [ ] Typos and grammatical errors are fixed

### Course Integration
- [ ] Content fits logically in the course progression
- [ ] References to other course materials are included
- [ ] Consistent with existing terminology and style
- [ ] Builds upon previously covered topics

## Success Recognition

Contributors are recognized in:
- **README.md** acknowledgments section
- **Individual documentation files** with author attribution
- **Release notes** for significant contributions
- **Community highlights** for exceptional content

---

Thank you for helping make this course better for everyone! Your contributions help developers worldwide learn about LLM agents and build impactful solutions.

**Still have questions?** Open an issue or start a discussion, and we'll be happy to help!