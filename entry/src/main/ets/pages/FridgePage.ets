import router from '@ohos.router'
import display from '@ohos.display'
import { Colors, FontFamily, Spacing, Radius, Shadows, Motion } from '../design/DesignSystem'
import { IngredientChip } from '../components/IngredientChip'

@Entry
@Component
struct FridgePage {
  @State ingredients: string[] = []
  @State inputValue: string = ''
  @State isFocused: boolean = false

  @State labelOpacity: number = 0
  @State labelTranslateY: number = 20
  @State titleOpacity: number = 0
  @State titleTranslateY: number = 30
  @State inputOpacity: number = 0
  @State inputTranslateY: number = 20
  @State suggestionsOpacity: number = 0
  @State ctaOpacity: number = 0
  @State ctaTranslateY: number = 40

  private screenWidth: number = px2vp(display.getDefaultDisplaySync().width)

  private readonly SUGGESTIONS: string[] = [
    'Eggs', 'Tomato', 'Rice', 'Onion', 'Garlic',
    'Chicken', 'Lemon', 'Olive Oil', 'Pasta', 'Potato'
  ]

  aboutToAppear(): void {
    setTimeout(() => {
      animateTo({ duration: Motion.slow, curve: Motion.easeOut }, () => {
        this.labelOpacity = 1
        this.labelTranslateY = 0
      })
    }, 0)

    setTimeout(() => {
      animateTo({ duration: Motion.slow, curve: Motion.easeOut }, () => {
        this.titleOpacity = 1
        this.titleTranslateY = 0
      })
    }, 150)

    setTimeout(() => {
      animateTo({ duration: 400, curve: Motion.easeOut }, () => {
        this.inputOpacity = 1
        this.inputTranslateY = 0
      })
    }, 300)

    setTimeout(() => {
      animateTo({ duration: Motion.normal, curve: Motion.easeOut }, () => {
        this.suggestionsOpacity = 1
      })
    }, 400)

    setTimeout(() => {
      animateTo({ duration: 400, curve: Motion.spring }, () => {
        this.ctaOpacity = 1
        this.ctaTranslateY = 0
      })
    }, 500)
  }

  private handleAddIngredient(): void {
    const trimmed = this.inputValue.trim().toLowerCase()
    if (!trimmed) return
    if (this.ingredients.includes(trimmed)) return
    if (this.ingredients.length >= 20) return
    this.ingredients = [...this.ingredients, trimmed]
    this.inputValue = ''
  }

  private handleQuickAdd(item: string): void {
    const lower = item.toLowerCase()
    if (this.ingredients.includes(lower)) return
    this.ingredients = [...this.ingredients, lower]
  }

  private navigateToVibe(): void {
    router.pushUrl({
      url: 'pages/VibePage',
      params: { ingredients: this.ingredients }
    })
  }

  build() {
    Column() {

      Blank().height(Spacing.xl)

      // ── [1] Label
      Text('KITCHEN COMPANION')
        .fontFamily(FontFamily.dmSansMedium)
        .fontSize(12)
        .letterSpacing(0.5)
        .fontColor(Colors.textMuted)
        .width('100%')
        .textAlign(TextAlign.Center)
        .opacity(this.labelOpacity)
        .translate({ y: this.labelTranslateY })

      Blank().height(Spacing.sm)

      // ── [2] Title
      Row() {
        Text("What's in your ")
          .fontFamily(FontFamily.playfairBold)
          .fontSize(32)
          .fontColor(Colors.textPrimary)
        Text('kitchen')
          .fontFamily(FontFamily.playfairBold)
          .fontSize(32)
          .fontColor(Colors.accent)
        Text('?')
          .fontFamily(FontFamily.playfairBold)
          .fontSize(32)
          .fontColor(Colors.textPrimary)
      }
      .width('100%')
      .opacity(this.titleOpacity)
      .translate({ y: this.titleTranslateY })

      Blank().height(Spacing.xl)

      // ── [3] Input
      TextInput({ text: this.inputValue, placeholder: 'Add an ingredient...' })
        .height(56)
        .width('100%')
        .borderRadius(Radius.md)
        .backgroundColor(Colors.bgSurface)
        .border({ width: 1, color: this.isFocused ? Colors.accent : Colors.bgSubtle })
        .fontColor(Colors.textPrimary)
        .placeholderColor(Colors.textMuted)
        .fontFamily(FontFamily.dmSansRegular)
        .fontSize(18)
        .padding({ left: Spacing.lg, right: Spacing.md })
        .opacity(this.inputOpacity)
        .translate({ y: this.inputTranslateY })
        .onChange((val: string) => { this.inputValue = val })
        .onSubmit(() => { this.handleAddIngredient() })
        .onFocus(() => { this.isFocused = true })
        .onBlur(() => { this.isFocused = false })

      Blank().height(Spacing.md)

      // ── [4] Chips area
      if (this.ingredients.length > 0) {
        Flex({ wrap: FlexWrap.Wrap }) {
          ForEach(this.ingredients, (item: string) => {
            IngredientChip({
              label: item,
              onDismiss: () => {
                this.ingredients = this.ingredients.filter((i: string) => i !== item)
              }
            })
              .margin({ right: Spacing.sm, bottom: Spacing.sm })
          }, (item: string) => item)
        }
        .width('100%')

        Blank().height(Spacing.sm)

        Row() {
          Blank().layoutWeight(1)
          Text('Clear all')
            .fontFamily(FontFamily.dmSansRegular)
            .fontSize(14)
            .fontColor(Colors.textMuted)
            .onClick(() => { this.ingredients = [] })
        }
        .width('100%')

        Blank().height(Spacing.md)
      }

      // ── [5] Quick-add row
      Column() {
        Text('Quick add')
          .fontFamily(FontFamily.dmSansMedium)
          .fontSize(12)
          .letterSpacing(0.5)
          .fontColor(Colors.textMuted)
          .width('100%')
          .margin({ bottom: Spacing.sm })

        Scroll() {
          Row({ space: Spacing.sm }) {
            ForEach(
              this.SUGGESTIONS.filter((s: string) => !this.ingredients.includes(s.toLowerCase())),
              (item: string) => {
                Text(item)
                  .height(32)
                  .padding({ left: Spacing.md, right: Spacing.md })
                  .border({ width: 1, color: Colors.bgSubtle })
                  .borderRadius(Radius.full)
                  .fontFamily(FontFamily.dmSansRegular)
                  .fontSize(13)
                  .fontColor(Colors.textSecondary)
                  .onClick(() => { this.handleQuickAdd(item) })
              },
              (item: string) => item
            )
          }
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
        .width('100%')
      }
      .opacity(this.suggestionsOpacity)
      .width('100%')

      // ── [6] Flex spacer
      Blank().layoutWeight(1)

      // ── [7] CTA button
      Button("Let's Cook →")
        .width('100%')
        .height(56)
        .borderRadius(Radius.full)
        .backgroundColor(this.ingredients.length > 0 ? Colors.accent : Colors.bgSubtle)
        .fontColor('#FFFFFF')
        .fontFamily(FontFamily.dmSansMedium)
        .fontSize(16)
        .enabled(this.ingredients.length > 0)
        .shadow(this.ingredients.length > 0 ? Shadows.accent : Shadows.sm)
        .opacity(this.ctaOpacity)
        .translate({ y: this.ctaTranslateY })
        .onClick(() => { this.navigateToVibe() })

      Blank().height(Spacing.lg)

    }
    .width(this.screenWidth >= 600 ? 560 : '100%')
    .alignSelf(this.screenWidth >= 600 ? ItemAlign.Center : ItemAlign.Start)
    .height('100%')
    .backgroundColor(Colors.bgPrimary)
    .padding({ left: Spacing.lg, right: Spacing.lg })
  }
}
