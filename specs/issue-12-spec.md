# Technical Specification — Issue #12

## 1. Issue Overview

| Field       | Value                                                              |
| ----------- | ------------------------------------------------------------------ |
| Title       | Add persistent labels to job search fields for accessibility       |
| Description | Search fields on the home page and Jobs page lose their context when a user starts typing, because placeholder text is the only label. This creates an accessibility gap for screen-reader users and a usability gap for sighted users who forget which field they are in. |
| Labels      | (none)                                                             |
| Priority    | Medium — accessibility + search-form usability                     |

---

## 2. Problem Analysis

Two files contain the affected search inputs:

**`src/components/Hero.jsx`** (home-page hero search form)
- Line 91–98: keywords input — `placeholder="Job title, keywords, or company"`, no `<label>`, no `aria-label`, no `id`.
- Line 124–131: location input — `placeholder="City, state, or country"`, same omissions.

**`src/pages/Jobs.jsx`** (Jobs listing page filter bar)
- Line 234–240: keywords input — `placeholder="Job title, company, or keywords..."`, same omissions.
- Line 249–255: location input — `placeholder="City, state, or country..."`, same omissions.

Root cause: the inputs rely solely on `placeholder` text for identification. Once the user types, the placeholder disappears, leaving no programmatic or visible label. Screen readers have no `<label>` or `aria-label` to announce, so the field purpose is unknown to assistive technology.

---

## 3. Proposed Solution

Add a visually hidden but screen-reader-accessible `<label>` above each input, plus an `aria-label` attribute on the `<input>` itself as a redundant fallback. No architectural change is needed — this is a targeted markup patch in two files.

Approach:
- Add a `<label htmlFor="…">` element styled with Tailwind's `sr-only` class (already available in Tailwind CSS 4) so it is invisible to sighted users but announced by screen readers.
- Add matching `id` attributes to the `<input>` elements so the label association is unambiguous.
- Keep the existing placeholder text — it still helps sighted users before they type.

Trade-offs:
- `sr-only` is the minimal, standards-compliant solution; it avoids redesigning the visible layout.
- Alternatively, visible labels could be shown above the fields. The issue says "visibly above the fields **or** through properly associated screen-reader labels", so `sr-only` satisfies the acceptance criteria with the smallest diff.

---

## 4. Step-by-Step Implementation

1. **Patch `Hero.jsx` — keywords field** — Add `id="hero-job-search"` to the input and a `<label htmlFor="hero-job-search" className="sr-only">Keywords</label>` immediately before the `<div className="relative group">` wrapper.

2. **Patch `Hero.jsx` — location field** — Add `id="hero-location"` to the input and a `<label htmlFor="hero-location" className="sr-only">Location</label>` immediately before the `<div className="relative group">` wrapper.

3. **Patch `Jobs.jsx` — keywords field** — Add `id="jobs-search-term"` to the input and a `<label htmlFor="jobs-search-term" className="sr-only">Keywords</label>` immediately before the icon wrapper.

4. **Patch `Jobs.jsx` — location field** — Add `id="jobs-location"` to the input and a `<label htmlFor="jobs-location" className="sr-only">Location</label>` immediately before the icon wrapper.

5. **Verify with `npm run lint`** — confirm no new lint errors introduced.

---

## 5. Verification Strategy

### Unit Tests
*(No unit-test infrastructure is present in this project; manual checks cover verification.)*

### Manual Checks

- Home page, keywords field: focus the input → screen reader (VoiceOver / NVDA) announces "Keywords" before reading the placeholder or value.
- Home page, location field: same, announces "Location".
- Type text into both home-page fields → placeholder disappears, but the accessible label is still announced when re-focusing.
- Jobs page, keywords field: same behaviour as home-page keywords.
- Jobs page, location field: same behaviour as home-page location.
- Visual regression: `sr-only` labels are invisible to sighted users; no layout shifts.
- Dark-mode regression: no style breakage.
- Keyboard navigation: Tab order is unchanged.

---

## 6. Files to Modify

| File Path                       | Nature of Change                                          |
| ------------------------------- | --------------------------------------------------------- |
| `src/components/Hero.jsx`       | Add `<label>` + `id` to both search inputs               |
| `src/pages/Jobs.jsx`            | Add `<label>` + `id` to both search/filter inputs        |

---

## 7. New Files to Create

*(None)*

---

## 8. Existing Utilities to Leverage

| Utility                    | Benefit                                                   |
| -------------------------- | --------------------------------------------------------- |
| Tailwind `sr-only` class   | Hides labels visually while keeping them in the a11y tree — already available, no new dependency |

---

## 9. Acceptance Criteria

- Each search input on the home page has a programmatically associated label that screen readers announce.
- Each search input on the Jobs page has a programmatically associated label.
- Placeholder text is retained (still useful before typing).
- No visible layout change for sighted users.
- `npm run lint` passes with no new errors.
- No regressions in search functionality (Hero navigation to `/jobs`, Jobs page filtering).

---

## 10. Out of Scope

- Visible floating/above-field labels (not required by the issue; `sr-only` satisfies it).
- Labelling the salary, category, experience, work-type, or sort-by controls on the Jobs page (not mentioned in the issue).
- Any changes to search logic, routing, or state management.
