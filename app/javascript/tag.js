document.addEventListener("DOMContentLoaded",() => {
if ( document.getElementById("item-tag")) {

  //タグ入力場所のid
  const inputElement = document.getElementById("item-tag");
  //キーボードが離れた瞬間のイベント発火
  inputElement.addEventListener("keyup", () => {
    //入力された値を取得
    const keyword = document.getElementById("item-tag").value;
    //サーバーサイドとやりとりするためにXHRオブジェクト生成
    const XHR = new XMLHttpRequest();
    //サーバーサイドに送る情報(メソッド、URL(searchアクション)、searchで指定したkeywordを上記で定義し送る、非同期通信の有無)
    XHR.open("GET", `/items/search/?keyword=${keyword}`, true);
    //レスポンスタイプ指定(json型)
    XHR.responseType = "json";
    //実際に送る
    XHR.send();

    //通信に成功した場合の処理
    XHR.onload = () => {
      //タグを表示させる場所のidを取得
      const tagView = document.getElementById("tag-view");
      //毎回空にしてその都度検索結果を表示させるため
      tagView.innerHTML = "";
      //レスポンスがあればという条件分岐
      if (XHR.response) {
      //レスポンスの中身のkeywordを取得
      const tagName = XHR.response.keyword;
      //キーワードが入力されるたびにメソッドが稼働
      tagName.forEach((tag) => {
        //予測変換を表示させる場所を作るためdiv生成
        const childElement = document.createElement("div");
        //生成したdivにクラスを付与
        childElement.setAttribute("class", "child");
        //生成したdivに対してid付与、tagが生成されるたびにそのidを付与
        childElement.setAttribute("id", tag.id);
        //生成したdivにタグを表示
        childElement.innerHTML = tag.tagname;
        //タグを表示させる場所に対して生成したdivを付与して実際に表示させる
        tagView.appendChild(childElement);

        //付与したタグをidで取得
        const clickElement = document.getElementById(tag.id);

        //予測変換ででたタグをクリック
        clickElement.addEventListener("click", () => {
          //タグに入力された値を予測変換ででた名前に置き換える
          document.getElementById("item-tag").value = clickElement.textContent;
          //上記の要素が入りHTML削除
          clickElement.remove();
        });
      });
    };
    };
  });
};
});