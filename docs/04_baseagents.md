---
layout: default
title: "Writing Specs and Agent Patterns"
order: 4
---

# Writing Specs and Agent Patterns

Learn to write atomic, precise specs that force specific architecture patterns based on your project's actual needs. Create CLAUDE.md with project-specific rules that eliminate generic responses and enforce your preferred patterns.

## Learning Objectives

After completing this module, you will be able to:
- Write atomic specs that are precise and testable
- Create CLAUDE.md that enforces your project's architecture patterns
- Design contracts that force specific implementation approaches
- Test and verify all changes after implementation
- Move beyond generic knowledge to project-specific requirements

## Prerequisites

- Completion of [03_claudecode](03_claudecode.md)
- You have a real project to work on
- Ready to enforce specific patterns, not generic advice

## Writing Atomic Specs: The Key to Reliable Agent Work

### What Makes a Good Spec Atomic?

A spec is atomic when it:
- **Does ONE thing well** - Not "implement auth" but "add JWT login endpoint"
- **Has clear success criteria** - You can objectively test if it's done
- **Specifies exact files and locations** - No ambiguity about where code goes
- **Includes constraints** - What NOT to change is as important as what to change
- **Provides validation steps** - How to verify the implementation works

### Example: Vague vs Atomic Spec

[FAIL] Vague Spec:
```markdown
# User Authentication
Implement user authentication in the app.
```

[PASS] Atomic Spec:
```markdown
# Add JWT Login Endpoint

## File to Modify
`src/controllers/authController.ts` - ADD login function

## Exact Implementation
export async function login(req: Request, res: Response) {
  // 1. Validate email/password input
  // 2. Find user by email
  // 3. Compare password with bcrypt
  // 4. Generate JWT token
  // 5. Return {success: true, token: string}
}

## Route to Add
POST /api/auth/login

## Success Criteria
- [ ] Returns 200 for valid credentials with JWT token
- [ ] Returns 401 for invalid email/password
- [ ] Uses bcrypt.compare() for password verification
- [ ] JWT token expires in 24 hours
- [ ] Response format: {success: boolean, token?: string, error?: string}

## Test Steps
1. Create test user via existing register endpoint
2. POST to /api/auth/login with valid credentials → should return token
3. POST with wrong password → should return 401
4. POST with non-existent email → should return 401
5. Verify JWT token validity with jwt.io
```

## Creating CLAUDE.md That Enforces Your Patterns

### Why CLAUDE.md Matters

Without CLAUDE.md, agents give generic advice. With CLAUDE.md, they follow YOUR rules.

### Example CLAUDE.md for a TypeScript Express Project

```markdown
# Project Architecture Rules

## File Structure (FOLLOW EXACTLY)
src/
├── controllers/     # HTTP request handlers ONLY
├── services/       # Business logic ONLY
├── models/         # Database models ONLY
├── middleware/     # Express middleware ONLY
├── types/          # TypeScript interfaces ONLY
└── utils/          # Pure utility functions ONLY

## Rules - NO EXCEPTIONS

1. **Controllers**: ONLY handle HTTP request/response. NO business logic.

   // GOOD
   async function login(req: Request, res: Response) {
     const result = await authService.login(req.body);
     res.json(result);
   }

   // BAD - business logic in controller
   async function login(req: Request, res: Response) {
     const user = await User.findOne({email: req.body.email});
     // ... business logic here
   }

2. **Services**: ONLY business logic. NO HTTP request/response objects.
   - Use dependency injection for database connections
   - Return structured data, never HTTP responses

3. **Error Handling**: Use createError() utility, never throw strings

   // GOOD
   if (!user) {
     throw createError(401, 'Invalid credentials');
   }

   // BAD
   throw 'User not found';

4. **Database**: Use Prisma client ONLY. Never raw queries.
   - All database operations in services layer
   - Use transactions for multi-step operations

5. **Testing**: Every service function MUST have unit tests
   - Use Jest with supertest for integration tests
   - Minimum 80% coverage required

6. **Validation**: Use Joi schemas, not manual validation
   - Validation middleware before controllers
   - Sanitize all inputs

## Required Patterns

### Service Function Pattern
export async function functionName(params: Type): Promise<ReturnType> {
  // 1. Input validation (if not in middleware)
  // 2. Business logic
  // 3. Database operations
  // 4. Return structured data
}

### Error Pattern
import { createError } from '../utils/errors';
// Always use createError(statusCode, message)
throw createError(404, 'Resource not found');

### Response Pattern
// Always return consistent structure
{
  success: boolean;
  data?: any;
  error?: string;
  message?: string;
}

## Technology Stack - USE ONLY THESE
- Runtime: Node.js 18+
- Framework: Express.js with TypeScript
- Database: PostgreSQL with Prisma ORM
- Auth: JWT with bcrypt
- Validation: Joi
- Testing: Jest + Supertest
- Logging: Winston

## What NOT to Do
- NO business logic in controllers
- NO raw SQL queries
- NO console.log() for debugging (use winston)
- TODO comments MUST have GitHub issue numbers
- NO empty catch blocks - always handle or rethrow

## Current Project Context
- Auth uses JWT tokens stored in HTTP-only cookies
- Database runs on port 5432
- Redis runs on port 6379 for sessions
- API versioning: /api/v1/
- Environment: .env files with dotenv
```

## Why This Works

1. **Forces Consistency**: Every developer (human or AI) follows same patterns
2. **Eliminates Ambiguity**: Specific rules, not generic advice
3. **Matches Your Needs**: Based on YOUR actual project requirements
4. **Testable**: You can verify if agents follow the rules
5. **Versionable**: CLAUDE.md evolves with your project

## The Full Workflow: From Spec to Verified Code

### Step 1: Write Atomic Spec
```bash
# specs/add-user-creation.md
# Add User Creation Endpoint

## Implementation
- File: src/controllers/userController.ts
- Add: createUser() function
- Route: POST /api/users
- Validation: email, name, password
- Success: returns 201 with user object (no password)
```

### Step 2: Execute with Claude Code
```bash
claude
> @specs/add-user-creation.md
```

### Step 3: If Wrong - Update Spec, Don't Edit Code
```bash
# Update the spec
echo "- Add rate limiting: max 5 requests per minute per IP" >> specs/add-user-creation.md

# Execute again
claude
> @specs/add-user-creation.md
```

### Step 4: Test and Verify Implementation
```bash
# Run tests
npm run test

# Manual testing
curl -X POST http://localhost:3000/api/users \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","name":"Test User","password":"password123"}'

# Verify in database
psql -d myapp -c "SELECT * FROM users WHERE email='test@example.com';"
```

### Step 5: Branch, Commit, Create PR
```bash
git checkout -b feature/user-creation
git add .
git commit -m "feat: add user creation endpoint

- Implement POST /api/users endpoint
- Add input validation for email, name, password
- Include rate limiting (5/minute per IP)
- Add comprehensive unit tests
- Update API documentation"

git push origin feature/user-creation
gh pr create --title "Add User Creation Endpoint" --body "Implements user registration with validation and rate limiting"
```

### Step 6: Mandatory Web UI Review
**This step is NOT optional** - it's where you learn:

1. **Review the PR in GitHub UI**
   - Check the diff for unexpected changes
   - Verify only intended files were modified
   - Ensure CLAUDE.md rules were followed

2. **Run automated checks**
   - All tests must pass
   - Linting must be clean
   - Type checking must succeed

3. **Manual testing in staging**
   - Deploy to staging environment
   - Test the actual endpoint
   - Verify error handling works

4. **Only merge when:**
   - All checks pass
   - Code follows project patterns
   - Implementation matches spec
   - Tests cover edge cases

## Why This Process Works

- **Spec-driven**: No ambiguity about what to build
- **Iterative**: Fix the spec, not the code
- **Testable**: Every change can be verified
- **Version controlled**: All specs and changes tracked
- **Team-friendly**: Anyone can review and understand

## Common Pitfalls and How to Avoid Them

### Pitfall 1: "The agent didn't do what I meant"
**Solution**: Your spec was ambiguous. Update it with more specific instructions.

### Pitfall 2: "The agent changed files I didn't want"
**Solution**: Add explicit "DO NOT MODIFY" section to your spec.

### Pitfall 3: "The code works but doesn't follow our patterns"
**Solution**: Your CLAUDE.md is incomplete. Add the missing pattern rules.

### Pitfall 4: "Tests are failing"
**Solution**: Add specific test requirements to your spec, including test cases.

### Pitfall 5: "The implementation is incomplete"
**Solution**: Add more detailed success criteria and validation steps.

## Summary: From Generic Patterns to Project-Specific Excellence

### What You've Learned

1. **Atomic Specs**: Break complex features into small, testable units
2. **Project-Specific Rules**: CLAUDE.md eliminates generic advice and enforces YOUR patterns
3. **Iterative Development**: Fix specs, not code - maintain clean context
4. **Verification**: Always test and review changes before merging
5. **Workflow Discipline**: Spec → Execute → Test → Commit → PR → Review

### Key Takeaways

- **Generic knowledge is useless** without project-specific context
- **Patterns must be enforced** through CLAUDE.md, not hoped for
- **Atomic specs prevent** misunderstandings and incomplete work
- **Testing is mandatory** - never skip verification
- **Code review in web UI** is where you learn what works

### Next Steps

1. **Create your first CLAUDE.md** with your project's actual rules
2. **Write an atomic spec** for your next feature
3. **Follow the workflow** exactly - don't skip steps
4. **Learn from your mistakes** - update specs and CLAUDE.md as needed
5. **Build discipline** - the process matters more than individual features

Remember: The goal isn't just to get code written, it's to build a system where anyone (or any AI) can reliably contribute to your project following your exact standards.