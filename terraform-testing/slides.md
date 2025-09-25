---
theme: default
title: Terraform Test and Check
export:
  format: pdf

colorSchema: 'light'
---
---
layout: image
image: images/start.png
backgroundSize: 75% 99%
---

---
zoom: 1.3
---

# Why some companies do not test IaC 


- Mindset / culture "It’s just infrastructure"
- Knowledge gaps, no background with tests mentality
- Tooling gaps
- Complexity of testing some components
- Cost and speed

---
layout: two-cols
zoom: 1.2
---

# Plan-based Tests

- 🚀 Very fast (no infra provisioned)
- 💰 Cheap (no cloud resources spin up)
- ✅ No risk of accidentally touching production
- 📌 Limited: checks only configuration & plan output
- ⚡️ Quick unit/compliance checks;

::right::

# Apply-based Tests

- 🐢 Slower (must provision and destroy)
- 💸 Can be expensive (for resources paid per hour)
- ⚠️ Risk if tests run against wrong env
- 🔋 Full: can check real state + runtime behavior 
- ⏳ Integration, end-to-end, and functional validation of infra. 


---
zoom: 0.9
---

## Testing tools

| Feature / Tool         | tftest ⚰️ | Terratest | Native Terraform Test Framework |
|------------------------|--------------------|---------------|-------------------------------|
| Language               | Python             | Go            | HCL (Terraform syntax)        |
| What it does           | Parses plans and uses Python to assert conditions | Runs Terraform commands, provisions infra, and verifies with Go assertions | Write `.tftest.hcl` files with runs, variables, mocks, and assertions |
| Test type              | Unit-style (plan output only) | Unit + Integration (plan + apply) | Unit (plan) and Integration (apply) |
| Ease of use            | Just Python | Requires Go knowledge | No aditional language       |
| Speed                  | Fast (just plan)   | Slow - needs apply | Medium (plan, apply, supports mocks) |
| Ecosystem              | Small and now read-only | Mature, widely used | New (since v1.6+)              |
| Dependencies           | Python runtime     | Go runtime + Terratest lib | None (built into Terraform CLI) |

---
layout: center
---

# Code

---
zoom: 1.1
---

# Terraform linters and checkers

| Tool    | terraform validate (Native) | TFLint         | Checkov                                  |
|-------------|-----------------------------|----------------|-------------------------------------------|
| Focus       | Syntax & config validation | Linting & best practices | Security & compliance                |
| Strengths   | Built-in, fast, ensures HCL is valid | Detects invalid/deprecated provider attributes, configurable, CI-friendly | Large rule set (CIS, NIST, etc.), multi-IaC, custom policies, rich CI integration |
| Limitations | No best practices or security checks | Doesn’t cover deep security/compliance | Slower, more complex, may give false positives |

---
layout: center
---

# Code

---
zoom: 1.3
---

# Conclusion

- Testing and linter tools are easy to use
- Are easy to integrate on CI pipelines 
- Enforce organizational rules and external standards (CIS, NIST, etc.).
- No single silver bullet, many tools are complementary
