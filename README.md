# README

# OTOMO

## アプリケーションの概要
深い関係（恋人・友人）ではなくライトなつながりを作ることを目的としたマッチングアプリ

## 具体的には
「ちょっとした空き時間」に「近く」の「一時的な関係」の「お伴（おとも）」を募れるマッチングアプリです。

たとえば・・・
「時間ができたのでちょっとだけ人と会って話したい」
「友人のプレゼントを一緒に選んでほしい」
「犬のお散歩のお供を募りたい」
 →家族や恋人、友人に声をかけるほどでない「気軽な誰かがいてくれたらもっといいよね」というときに活用できるアプリ

## 企画のきっかけ
自分自身が友人や関係の深い人に声をかける事に気を遣うタイプで、なんとなく人と話したい、意見を聞きたいと思ったときに、もっと気軽に声をかけられる人間関係が周りに増えたらうれしいな～と思ったことがきっかけ。

ここでいう「気軽な人間関係」は、例えば、居酒屋で隣の席になった人とか、偶然旅先で出会った人とか…「その場に偶然居合わせた」「一時的な」関係をイメージしてもらうとよいと思います。

恋人を作ったり、パートナーを探したり、深い関係を気づくことを目的としたアプリは多いけど、ライトなつながりを作ることをメインとしたアプリはあまりないかなと思い企画に至りました。

## 解決したい課題
アプリによって気楽に会える人を探せる

●ライトなつながり（気負いしない関係）の条件
 わざわざ時間を作らせない = 「ちょっとした空き時間」
 わざわざ出向かなくてよい = 「近く」
 今後関係を続けなくてもOK = 「一時的な関係」
 お互いにとってメリットがある = 「一方的でない」
 危険性がない = 「安全」

## ターゲット
18～35歳くらいまでの男女。
(SNSでDMして直接会う事に抵抗が少ない世代)
その中でも特に単身者や独身者をメインターゲットにする。

## 想定する使い方
1.OTOMO（お伴）を募集する
2.参加したいOTOMOイベント検索
3.メッセージのやりとり

## 必要な機能

1.ユーザー管理機能（サインイン・ログイン・プロフィール編集）
2.新規イベント(=OTOMO募集)作成機能
3.イベント編集、募集停止機能
4.イベント検索機能
5.メッセージ機能


## テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false |
| gender_id          | integer | null: false | 
| birthday           | date   | null: false |
| age                | integer | null: false |
| prefecture_id      | integer | null: false |
| introduction       | text   | null: false |

登録時、メールアドレスで認証できるよう設定(時間ないのであとにするかも…)
ログインに必要なのはemailとpassword
生年月日は利用者の傾向を探るためにとる想定

ユーザーが相手のプロフィールの項目を参照して求めるOTOMOの条件と
一致しているか確認できるようにしておく
prefecture_idはユーザーが住んでいる県のイベントを表示させるため

### Association
- has_many :messages
- has_many :events

## events テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | null: false |
| description        | text   | null: false |
| prefecture_id      | integer | null: false |
| date               | date | null: false |
| start_time         | time | null: false |
| duration_id        | integer | null: false |
| generation_id      | integer |
| gender_id          | integer |
| status_id          | integer |
| user               | references | null: false , foreign_key: true |

### Association
- belongs_to user
- has_many messages

## messages テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text | null: false |
| event              | references | null: false , foreign_key: true |
| user               | references | null: false , foreign_key: true |

### Association
belongs_to event
belongs_to user

## maps テーブル (追加実装)

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| address            | string | null: false |
| latitude           | float   | null: false |
| longitude          | float | null: false |
| event              | references | null: false , foreign_key: true |

belongs_to event
