/**
 * DesignSystem.ets
 * ─────────────────────────────────────────────────────────────────────────────
 * Kitchen Companion — HarmonyOS Design System
 * Owner : Agent 1 (Design System)
 * Rule  : ALL other agents import ONLY from this file.
 *         No agent ever writes a raw hex, pixel, or font name elsewhere.
 * ─────────────────────────────────────────────────────────────────────────────
 */

// ─── COLORS ──────────────────────────────────────────────────────────────────

export const Colors = {
  // ── Backgrounds ────────────────────────────────────────────────────────────
  /** True deep black — main app background */
  bgPrimary:      '#0A0A0A',
  /** Cards, input fields */
  bgSurface:      '#141414',
  /** Modals, bottom sheets */
  bgElevated:     '#1C1C1C',
  /** Hover states, dividers */
  bgSubtle:       '#242424',

  // ── Brand / Accent ──────────────────────────────────────────────────────────
  /** Warm orange — primary CTA */
  accent:         '#FF6B35',
  /** Orange at 12 % opacity — chip backgrounds */
  accentSoft:     '#FF6B3520',
  /** Lighter orange on press / hover */
  accentHover:    '#FF8552',

  // ── Text ───────────────────────────────────────────────────────────────────
  /** Main text — warm white, not cold white */
  textPrimary:    '#F7F7F2',
  /** Subtitles, hints */
  textSecondary:  '#9A9A8E',
  /** Placeholders, disabled */
  textMuted:      '#4A4A44',

  // ── Semantic ───────────────────────────────────────────────────────────────
  /** Ingredient matched */
  success:        '#4ADE80',
  /** Ingredient missing but close */
  warning:        '#FBBF24',
  /** Something went wrong */
  error:          '#F87171',

  // ── Cuisine card gradients (start → end) ───────────────────────────────────
  /** Middle-East & Africa — warm desert */
  gradientMEA:    ['#FF6B35', '#C94B1A'] as string[],
  /** Asia — deep violet */
  gradientAsia:   ['#A78BFA', '#6D28D9'] as string[],
  /** Europe — cool blue */
  gradientEU:     ['#60A5FA', '#1D4ED8'] as string[],
  /** Latin America — tropical green */
  gradientLatam:  ['#34D399', '#059669'] as string[],
} as const

// ─── TYPOGRAPHY ──────────────────────────────────────────────────────────────

/**
 * FontFamily constants — reference these to avoid raw string typos.
 */
export const FontFamily = {
  playfairBold:    'PlayfairDisplay-Bold',
  dmSerifRegular:  'DMSerifDisplay-Regular',
  dmSansRegular:   'DMSans-Regular',
  dmSansMedium:    'DMSans-Medium',
} as const

export const Typography = {
  // ── Display (Playfair Display Bold) — editorial, cultural ──────────────────
  /** Hero titles, splash screens */
  displayXL: {
    fontFamily:    FontFamily.playfairBold,
    fontSize:      40,
    lineHeight:    48,
    letterSpacing: -0.5,
  },
  /** Section display titles */
  displayL: {
    fontFamily:    FontFamily.playfairBold,
    fontSize:      32,
    lineHeight:    40,
    letterSpacing: -0.3,
  },

  // ── Headings (DM Serif Display) — warm, readable ───────────────────────────
  /** Large screen headings */
  headingL: {
    fontFamily:  FontFamily.dmSerifRegular,
    fontSize:    24,
    lineHeight:  32,
  },
  /** Card / section headings */
  headingM: {
    fontFamily:  FontFamily.dmSerifRegular,
    fontSize:    20,
    lineHeight:  28,
  },

  // ── Body (DM Sans Regular) — clean, highly readable ───────────────────────
  /** Primary reading text */
  bodyL: {
    fontFamily:  FontFamily.dmSansRegular,
    fontSize:    18,
    lineHeight:  28,
  },
  /** Standard body text */
  bodyM: {
    fontFamily:  FontFamily.dmSansRegular,
    fontSize:    16,
    lineHeight:  24,
  },
  /** Supporting / caption text */
  bodyS: {
    fontFamily:  FontFamily.dmSansRegular,
    fontSize:    14,
    lineHeight:  20,
  },

  // ── Labels (DM Sans Medium) — uppercase, spaced ────────────────────────────
  /** Button labels, tab labels */
  labelL: {
    fontFamily:    FontFamily.dmSansMedium,
    fontSize:      16,
    lineHeight:    20,
    letterSpacing: 0.1,
  },
  /** Micro-labels, tags, step numbers (uppercase) */
  labelS: {
    fontFamily:    FontFamily.dmSansMedium,
    fontSize:      12,
    lineHeight:    16,
    letterSpacing: 0.5,
    textTransform: 'uppercase' as 'uppercase',
  },
} as const

// ─── SPACING (8 pt Grid) ─────────────────────────────────────────────────────

export const Spacing = {
  /** 4 dp — hair gap, icon padding */
  xs:   4,
  /** 8 dp — tight internal padding */
  sm:   8,
  /** 16 dp — standard component padding */
  md:   16,
  /** 24 dp — section gap */
  lg:   24,
  /** 32 dp — large section gap */
  xl:   32,
  /** 48 dp — hero spacing */
  xxl:  48,
  /** 64 dp — screen-level margin on large tablets */
  xxxl: 64,
} as const

// ─── BORDER RADIUS ───────────────────────────────────────────────────────────

export const Radius = {
  /** 8 dp — small elements, tags */
  sm:   8,
  /** 16 dp — input fields, cards */
  md:   16,
  /** 24 dp — large cards, sheets */
  lg:   24,
  /** 32 dp — extra-large surfaces */
  xl:   32,
  /** 9999 dp — pills, chips, FAB */
  full: 9999,
} as const

// ─── SHADOWS & ELEVATION ─────────────────────────────────────────────────────

export const Shadows = {
  /** Subtle lift — chips, small cards */
  sm: {
    radius:  8,
    color:   '#00000040',
    offsetX: 0,
    offsetY: 2,
  },
  /** Standard elevation — modals, bottom sheets */
  md: {
    radius:  20,
    color:   '#00000060',
    offsetX: 0,
    offsetY: 8,
  },
  /** Orange glow — primary CTA buttons */
  accent: {
    radius:  24,
    color:   '#FF6B3540',
    offsetX: 0,
    offsetY: 4,
  },
} as const

// ─── MOTION ──────────────────────────────────────────────────────────────────

export const Motion = {
  // ── Durations (ms) ──────────────────────────────────────────────────────────
  /** 100 ms — press feedback, instant toggle */
  instant:  100,
  /** 200 ms — chip appear/dismiss, border focus */
  fast:     200,
  /** 300 ms — screen slide transitions */
  normal:   300,
  /** 500 ms — large surface reveals */
  slow:     500,
  /** 800 ms — splash / hero animations */
  verySlow: 800,

  // ── Easing curves (ArkUI cubicBezier strings) ──────────────────────────────
  /** Deceleration — elements entering the screen */
  easeOut:   'cubicBezier(0.0, 0.0, 0.2, 1.0)',
  /** Acceleration — elements leaving the screen */
  easeIn:    'cubicBezier(0.4, 0.0, 1.0, 1.0)',
  /** Standard — general transitions */
  easeInOut: 'cubicBezier(0.4, 0.0, 0.2, 1.0)',
  /** Bouncy spring — chip appear, bottom-sheet open */
  spring:    'cubicBezier(0.34, 1.56, 0.64, 1.0)',
  /** Silky smooth — hero image reveals */
  smooth:    'cubicBezier(0.25, 0.46, 0.45, 0.94)',
} as const
