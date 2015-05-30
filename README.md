# watch_camera_sample
Sample project for sharing data to Apple Watch project

### Consts.swift
定数を管理。本体とExtensionどちらも同じ内容にする必要がある。

### Utils.swift
特定のクラスに依存しない独自の関数を管理

### データの共有方法
App Groupsを使って本体とExtension間でデータ共有。
画像はNSDataに変換後、NSUserDefaultsに保存している。
http://qiita.com/_tid_/items/dfff60ec8e93fefe1af4

### その他
App GroupのIDはgroup.me.ytakzk.watch-sampleなので、
変更する必要があるときは
本体とExtensionいずれもTarget->Capabilities->App Groupsで
適宜変更して下さい。
