# CodeJudge Database System - Part 3

## Objective

This repository audits the imported CodeJudge database for integrity issues and proposes safe repair actions.

The work includes:

* import validation
* row-count checks
* primary key audits
* foreign key audits
* domain validation
* repair planning
* staging repair scripts
* before and after verification

---

## Files Included

| File                       | Purpose                                   |
| -------------------------- | ----------------------------------------- |
| import_validation.sql      | Row-count and import validation queries   |
| integrity_audit.sql        | PK/FK and relationship audit queries      |
| domain_rule_checks.sql     | Invalid value and rule validation queries |
| repair_plan.md             | Repair strategy and dataset examples      |
| staging_repair_scripts.sql | Safe repair scripts using staging tables  |
| before_after_evidence.md   | Evidence of repairs                       |

---

## Notes

The original imported tables are not directly modified.

Repairs are demonstrated using staging copies.