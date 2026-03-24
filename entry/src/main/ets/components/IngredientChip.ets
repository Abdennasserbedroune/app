import { Colors, FontFamily, Spacing, Radius } from '../design/DesignSystem'

@Component
export struct IngredientChip {
  @Prop label: string = ''
  onDismiss: () => void = () => {}

  @State private chipScale: number = 0
  @State private chipOpacity: number = 0

  aboutToAppear(): void {
    animateTo(
      { duration: 200, curve: 'cubicBezier(0.34,1.56,0.64,1.0)' },
      () => {
        this.chipScale = 1
        this.chipOpacity = 1
      }
    )
  }

  private dismissWithAnimation(): void {
    animateTo(
      { duration: 150, curve: 'cubicBezier(0.4,0.0,1.0,1.0)' },
      () => {
        this.chipScale = 0
        this.chipOpacity = 0
      }
    )
    setTimeout(() => {
      this.onDismiss()
    }, 155)
  }

  build() {
    Row() {
      Text(this.label)
        .fontFamily(FontFamily.dmSansRegular)
        .fontSize(14)
        .fontColor(Colors.accent)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Text('×')
        .fontSize(16)
        .fontColor(Colors.textMuted)
        .padding({ left: 6 })
        .onClick(() => {
          this.dismissWithAnimation()
        })
    }
    .height(40)
    .padding({ left: Spacing.md, right: Spacing.md, top: Spacing.sm, bottom: Spacing.sm })
    .backgroundColor(Colors.accentSoft)
    .border({ width: 1, color: '#FF6B3566' })
    .borderRadius(Radius.full)
    .scale({ x: this.chipScale, y: this.chipScale })
    .opacity(this.chipOpacity)
  }
}
