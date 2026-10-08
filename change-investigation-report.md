# 🔎 Change Investigation Report

**Target**: `src/component/Footer.jsx:171-182` *(resolved to `src/components/Footer.jsx`, lines 171–182)*
**Investigation Date**: 2026-10-07
**Repository**: https://github.com/raghabsingh99/JOB-PORTAL-UI.git
**Branch**: main

---

## 📋 Investigation Summary

| Detail                  | Value                                      |
| ----------------------- | ------------------------------------------ |
| File(s) Analyzed        | `src/components/Footer.jsx`                |
| Lines Investigated      | 171–182                                    |
| Total Commits on File   | 3                                          |
| Unique Authors          | 1 (Raghab Singh, two name casings)         |
| File Age (First Commit) | 2026-10-02                                 |
| Last Modified           | 2026-10-05 by raghab singh                 |

---

## 👥 Author Breakdown

| # | Author        | Email                    | Commits | Lines Owned | First Contribution | Last Contribution |
|---|---------------|--------------------------|---------|-------------|-------------------|-------------------|
| 1 | Raghab Singh  | raghabsingh99@gmail.com  | 2       | 197 (97%)   | 2026-10-02        | 2026-10-05        |
| 2 | raghab singh  | raghabsingh99@gmail.com  | 1       | 6 (3%)      | 2026-10-05        | 2026-10-05        |

> *These are the same person — the name casing differs between direct commits and the GitHub PR merge.*

**Primary Owner**: Raghab Singh (97% of current lines)
**Most Recent Contributor**: raghab singh (via PR #11, 2026-10-05)
**CODEOWNERS**: Not configured

---

## 📅 Change Timeline

### `367873a` — 2026-10-05

- **Author**: raghab singh &lt;raghabsingh99@gmail.com&gt;
- **Message**: `fix: show help tooltip on footer contact us hover (#11)`
- **Body**: Co-authored by claude[bot] and Claude Sonnet 5.5
- **Ticket References**: `#11` (GitHub PR)
- **Lines Changed**: +6 / -0 (Footer.jsx only)
- **What Changed**:
  > Added the hover tooltip for the **"Contact Us"** footer link (lines 179–182). The tooltip displays: *"Facing a problem? Send a message to our admin team and we will help you out."* inside a styled card (`bg-white`, rounded-lg, shadow-lg). This is a pure feature addition — the link was already present but had no tooltip; this fix brings it in line with the Privacy Policy and Terms of Service links which received the same tooltip treatment in the previous commit.

---

### `3e0fc33` — 2026-10-05

- **Author**: Raghab Singh &lt;raghabsingh99@gmail.com&gt;
- **Message**: `chore:Claude workflow updates`
- **Body**: —
- **Ticket References**: None
- **Lines Changed**: +18 / -6 (Footer.jsx, among other files)
- **What Changed**:
  > Refactored the footer's legal/policy links (Privacy Policy, Terms of Service, Contact Us) from plain gradient hover overlays to a tooltip-based UX pattern. Each `<a>` gained `cursor-pointer`, its old `inset-0` gradient div was replaced with an absolutely-positioned tooltip bubble (`bottom-full`, `w-56`, `pointer-events-none`), and a small rotated diamond arrow (`w-2 h-2 rotate-45`) was added beneath each tooltip. Lines 171–172 are the closing `</div>` and gradient background div that cap the Terms of Service tooltip block introduced here.

---

### `933acd5` — 2026-10-02

- **Author**: Raghab Singh &lt;raghabsingh99@gmail.com&gt;
- **Message**: `Initial commit`
- **Body**: —
- **Ticket References**: None
- **Lines Changed**: Full file creation
- **What Changed**:
  > Created `Footer.jsx` from scratch. Lines 173–178 (the `<Link to="/contact">` element and its span) originate here — these are the original Contact Us nav link before any tooltip was added.

---

## 🔬 Line-by-Line Blame (Lines 171–182)

| Line | Code (truncated)                                                         | Author       | Date       | Commit Message                              |
|------|--------------------------------------------------------------------------|--------------|------------|---------------------------------------------|
| 171  | `</div>`                                                                 | Raghab Singh | 2026-10-05 | chore:Claude workflow updates               |
| 172  | `<div className="absolute -inset-2 bg-gradient-to-r ...`                 | Raghab Singh | 2026-10-05 | chore:Claude workflow updates               |
| 173  | `</a>`                                                                   | Raghab Singh | 2026-10-02 | Initial commit                              |
| 174  | `<Link`                                                                  | Raghab Singh | 2026-10-02 | Initial commit                              |
| 175  | `to="/contact"`                                                          | Raghab Singh | 2026-10-02 | Initial commit                              |
| 176  | `className="group relative hover:text-white ..."`                        | Raghab Singh | 2026-10-02 | Initial commit                              |
| 177  | `>`                                                                      | Raghab Singh | 2026-10-02 | Initial commit                              |
| 178  | `<span className="relative z-10">Contact Us</span>`                      | Raghab Singh | 2026-10-02 | Initial commit                              |
| 179  | `<div className="absolute bottom-full left-1/2 ...`                      | raghab singh | 2026-10-05 | fix: show help tooltip on footer contact us |
| 180  | `<div className="bg-white dark:bg-gray-800 ... rounded-lg shadow-lg ...` | raghab singh | 2026-10-05 | fix: show help tooltip on footer contact us |
| 181  | `Facing a problem? Send a message to our admin team ...`                 | raghab singh | 2026-10-05 | fix: show help tooltip on footer contact us |
| 182  | `</div>`                                                                 | raghab singh | 2026-10-05 | fix: show help tooltip on footer contact us |

---

## 🎫 Linked Tickets & References

| Ticket | Commit    | Author       | Date       | Commit Subject                              |
|--------|-----------|--------------|------------|---------------------------------------------|
| #11    | `367873a` | raghab singh | 2026-10-05 | fix: show help tooltip on footer contact us |

---

## 💡 Insights

- **Churn Assessment**: Low — 3 commits over 3 days, all from the initial build sprint. No churn indicators.
- **Bus Factor**: High risk — 1 author owns 100% of lines. No other contributor has ever touched this file.
- **Stale Code Risk**: None — file was last modified 2026-10-05, 2 days before this investigation.
- **Review Gaps**: The `chore:Claude workflow updates` commit (`3e0fc33`) has no ticket reference and introduced non-trivial UI changes (the tooltip pattern). The commit message does not reflect the actual scope. One of three commits lacks a ticket reference.
