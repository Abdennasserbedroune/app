import UIAbility from '@ohos.app.ability.UIAbility'
import hilog from '@ohos.hilog'
import window from '@ohos.window'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'

import { registerFonts } from '../design/FontLoader'

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    registerFonts()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate')
  }

  onDestroy(): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy')
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate')

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR)
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s',
          JSON.stringify(err) ?? '')
        return
      }
      hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '')
    })
  }

  onWindowStageDestroy(): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy')
  }

  onForeground(): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground')
  }

  onBackground(): void {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO)
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground')
  }
}
