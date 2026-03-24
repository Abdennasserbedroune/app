/**
 * FontLoader.ets
 * ─────────────────────────────────────────────────────────────────────────────
 * Kitchen Companion — Font Registration
 * Owner  : Agent 1 (Design System)
 * Call   : registerFonts() once in EntryAbility / onCreate, before any UI
 *          renders, so all Typography tokens resolve correctly at runtime.
 * ─────────────────────────────────────────────────────────────────────────────
 */

import font from '@ohos.font'

export function registerFonts(): void {
  font.registerFont({
    familyName: 'PlayfairDisplay-Bold',
    familySrc:  '$rawfile(fonts/PlayfairDisplay-Bold.ttf)'
  })

  font.registerFont({
    familyName: 'DMSerifDisplay-Regular',
    familySrc:  '$rawfile(fonts/DMSerifDisplay-Regular.ttf)'
  })

  font.registerFont({
    familyName: 'DMSans-Regular',
    familySrc:  '$rawfile(fonts/DMSans-Regular.ttf)'
  })

  font.registerFont({
    familyName: 'DMSans-Medium',
    familySrc:  '$rawfile(fonts/DMSans-Medium.ttf)'
  })
}
