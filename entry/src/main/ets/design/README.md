# Design System — Token Reference

> **Owner:** Agent 1 — Design System  
> **Source of truth:** `DesignSystem.ets` (same folder)  
> **Rule:** Every other agent imports ONLY from `DesignSystem.ets`. Never hardcode a hex, pixel, or font name.

---

## How to Import

```typescript
import { Colors, Typography, Spacing, Radius, Shadows, Motion, FontFamily } from './design/DesignSystem'
```

---

## 🎨 Colors

| Token | Value | Use by |
|---|---|---|
| `Colors.bgPrimary` | `#0A0A0A` | All agents — root screen background |
| `Colors.bgSurface` | `#141414` | Agent 3 (Fridge), Agent 5 (Result) — card & input backgrounds |
| `Colors.bgElevated` | `#1C1C1C` | Agent 4 (Vibe), any modal / bottom sheet |
| `Colors.bgSubtle` | `#242424` | All agents — dividers, hover states |
| `Colors.accent` | `#FF6B35` | All agents — primary CTA, focus rings, left borders |
| `Colors.accentSoft` | `#FF6B3520` | Agent 3 — ingredient chip background |
| `Colors.accentHover` | `#FF8552` | All agents — button press / hover state |
| `Colors.textPrimary` | `#F7F7F2` | All agents — main readable text |
| `Colors.textSecondary` | `#9A9A8E` | All agents — subtitles, hints |
| `Colors.textMuted` | `#4A4A44` | All agents — placeholders, disabled text |
| `Colors.success` | `#4ADE80` | Agent 5 (Result) — ingredient matched indicator |
| `Colors.warning` | `#FBBF24` | Agent 5 (Result) — ingredient close but missing |
| `Colors.error` | `#F87171` | All agents — error states |
| `Colors.gradientMEA` | `['#FF6B35','#C94B1A']` | Agent 4 (Vibe) — Middle-East & Africa cuisine card |
| `Colors.gradientAsia` | `['#A78BFA','#6D28D9']` | Agent 4 (Vibe) — Asia cuisine card |
| `Colors.gradientEU` | `['#60A5FA','#1D4ED8']` | Agent 4 (Vibe) — Europe cuisine card |
| `Colors.gradientLatam` | `['#34D399','#059669']` | Agent 4 (Vibe) — Latin America cuisine card |

---

## ✍️ Typography

| Token | Size / Family | Use by |
|---|---|---|
| `Typography.displayXL` | 40 / Playfair Bold | Agent 2 (Splash/Onboarding) — hero title |
| `Typography.displayL` | 32 / Playfair Bold | Agent 2 — section display title |
| `Typography.headingL` | 24 / DM Serif | Agent 3, 5 — screen headings |
| `Typography.headingM` | 20 / DM Serif | Agent 4, 5 — card / sub-section headings |
| `Typography.bodyL` | 18 / DM Sans | Agent 5 — recipe step primary text |
| `Typography.bodyM` | 16 / DM Sans | All agents — standard body text |
| `Typography.bodyS` | 14 / DM Sans | Agent 3 — ingredient chip label |
| `Typography.labelL` | 16 / DM Sans Medium | All agents — button labels, tab items |
| `Typography.labelS` | 12 / DM Sans Medium UPPERCASE | Agent 4, 5 — step numbers, micro-labels |

### Font Families

| Constant | Font string | Use |
|---|---|---|
| `FontFamily.playfairBold` | `PlayfairDisplay-Bold` | Display only |
| `FontFamily.dmSerifRegular` | `DMSerifDisplay-Regular` | Headings |
| `FontFamily.dmSansRegular` | `DMSans-Regular` | Body text |
| `FontFamily.dmSansMedium` | `DMSans-Medium` | Labels, buttons |

---

## 📐 Spacing (8 pt Grid)

| Token | Value | Use by |
|---|---|---|
| `Spacing.xs` | 4 dp | All agents — icon internal padding, hair gaps |
| `Spacing.sm` | 8 dp | All agents — tight chip padding, inline gaps |
| `Spacing.md` | 16 dp | All agents — standard component inner padding |
| `Spacing.lg` | 24 dp | All agents — between sections |
| `Spacing.xl` | 32 dp | Agent 2, 5 — large section gaps |
| `Spacing.xxl` | 48 dp | Agent 2 — hero vertical spacing |
| `Spacing.xxxl` | 64 dp | All agents — tablet side margins |

---

## 🔵 Border Radius

| Token | Value | Use by |
|---|---|---|
| `Radius.sm` | 8 dp | All agents — small tags, badges |
| `Radius.md` | 16 dp | Agent 3 — input fields; Agent 5 — step cards |
| `Radius.lg` | 24 dp | Agent 4 — cuisine cards; Agent 5 — recipe card |
| `Radius.xl` | 32 dp | Any extra-large surface / modal |
| `Radius.full` | 9999 dp | All agents — pills, chips, FAB, CTA buttons |

---

## 🌑 Shadows

| Token | Blur / Color | Use by |
|---|---|---|
| `Shadows.sm` | 8 / `#00000040` | Agent 3 — chips; Agent 4 — small cards |
| `Shadows.md` | 20 / `#00000060` | Agent 4 — cuisine cards; any modal |
| `Shadows.accent` | 24 / `#FF6B3540` | All agents — primary CTA button orange glow |

---

## 🎬 Motion

### Durations

| Token | Value | Use by |
|---|---|---|
| `Motion.instant` | 100 ms | All agents — press scale feedback |
| `Motion.fast` | 200 ms | Agent 3 — chip appear/dismiss, input focus border |
| `Motion.normal` | 300 ms | All agents — screen slide transitions |
| `Motion.slow` | 500 ms | Agent 2, 5 — large surface reveals |
| `Motion.verySlow` | 800 ms | Agent 2 — splash / hero animations |

### Easing Curves

| Token | Curve | Use by |
|---|---|---|
| `Motion.easeOut` | `cubicBezier(0.0,0.0,0.2,1.0)` | All agents — elements entering |
| `Motion.easeIn` | `cubicBezier(0.4,0.0,1.0,1.0)` | All agents — elements leaving |
| `Motion.easeInOut` | `cubicBezier(0.4,0.0,0.2,1.0)` | All agents — general transitions |
| `Motion.spring` | `cubicBezier(0.34,1.56,0.64,1.0)` | Agent 3 — chip appear; Agent 4 — bottom sheet open |
| `Motion.smooth` | `cubicBezier(0.25,0.46,0.45,0.94)` | Agent 2, 5 — hero image / result reveal |

---

## Screen Transitions (reference, not tokens)

| Transition | Spec |
|---|---|
| Fridge → Vibe | Slide left, `Motion.normal`, `Motion.easeOut` |
| Vibe → Ad → Result | Fade to black `Motion.fast`, then fade-in result |
| Back navigation | Slide right, 250 ms, `Motion.easeOut` |
| Bottom sheet open | Slide up, `Motion.spring`, `Motion.slow` (400 ms) |

---

## Tablet Layout Rules (all agents must follow)

| Breakpoint | Layout |
|---|---|
| `< 600 dp` | Single column (phone) |
| `≥ 600 dp` | Two columns where applicable |
| `≥ 900 dp` | Add `Spacing.xxxl` side padding |
| Cuisine grid phone | 2 columns |
| Cuisine grid tablet | 4 columns |
| Result page tablet | Left = info, Right = steps |
| Min tap target | **56 dp always — no exceptions** |
| Base font scale | 1.1× on tablet |

---

## RTL (Arabic) Rules (all agents must follow)

**Things that flip in RTL:** padding L/R, icon positions, text alignment, navigation slide direction, chip row flow.

**Things that do NOT flip:** flag emojis, numbers, food images.

```typescript
// Pattern to use for directional properties:
padding: direction === 'rtl' ? { left: Spacing.lg, right: Spacing.md }
                             : { left: Spacing.md, right: Spacing.lg }
```
