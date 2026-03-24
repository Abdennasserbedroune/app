import router from '@ohos.router'
import { Colors, FontFamily, Spacing } from '../design/DesignSystem'

@Entry
@Component
struct VibePage {
  build() {
    Stack() {
      Column() {
        Text('Vibe Page — coming soon')
          .fontColor(Colors.textMuted)
          .fontFamily(FontFamily.dmSansRegular)
          .fontSize(16)
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Colors.bgPrimary)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Button('← Back')
        .position({ x: Spacing.md, y: 48 })
        .backgroundColor(Colors.bgSurface)
        .fontColor(Colors.textSecondary)
        .fontFamily(FontFamily.dmSansRegular)
        .fontSize(16)
        .onClick(() => { router.back() })
    }
  }
}
