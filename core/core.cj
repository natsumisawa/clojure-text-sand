(ns othe.core ;名前空間を定義
    (:use
        othe.view
        othe.model))

(defn on-command ;関数を定義
    "Viewからのコマンド通知を処理するハンドラ"
    [cmdline] ;引数
    (let [cmd (first cmdline)
        pos (second cmdline)]
    (cond
        (= cmd :move) (play-move pos)
        (= cmd :exit) (System/exit 0)
        :else nil)))

(defn -main ;関数を定義
    "エントリポイント"
    [& args] ;引数
    (init-view on-command) ;viewを初期化
    (init-game on-state-changed) ;modelを初期化
    (start-ui) ;ゲーム開始