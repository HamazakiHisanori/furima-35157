function preview() {
  if ( document.getElementById("item-image")) {
  const ImagePreview = document.getElementById("image-preview");
  const ItemImage = document.getElementById("item-image");

  //選択した画像を表示する関数定義
  const ImageHTML = (fileUrl) => {
    //div生成
    const imageDiv = document.createElement('div');
    imageDiv.setAttribute('class',"number"); //divに選択ボタン用のクラスを付与
    let itemNumber = document.querySelectorAll('.number').length; //何番目かわかるようにlengthメソッド
    //実際に表示する画像を入れる場所
    const fileImage = document.createElement('img');
    fileImage.width = 200;
    fileImage.height = 200;

    //選択ボタン生成
    const inputHTML = document.createElement('input');
    inputHTML.setAttribute('id', `item-image-${itemNumber}`); //ファイル選択ボタン(数)
    inputHTML.setAttribute('name', 'item[images][]');
    inputHTML.setAttribute('type', 'file');

    //imgの中に画像URLをセット
    fileImage.setAttribute('src', fileUrl);
    //<div><画像URL></div>の形
    imageDiv.appendChild(fileImage);
    //生成したファイルに選択ボタンを付与
    imageDiv.appendChild(inputHTML);
    //上記で作成したHTMLをプレビュー
    ImagePreview.appendChild(imageDiv);

    //生成されたファイル選択ボタン使用時
    inputHTML.addEventListener('change', function(e) {
    //画像情報
    file = e.target.files[0];
    //画像URL
    fileUrl = window.URL.createObjectURL(file);

    //プレビュー表示
    ImageHTML(fileUrl)
  });
};

    //ファイル選択ボタン使用時
    ItemImage.addEventListener('change', function(e) {
    //画像情報
    let file = e.target.files[0];
    //画像URL
    let fileUrl = window.URL.createObjectURL(file);

    //プレビュー表示
    ImageHTML(fileUrl);
    });
  };
};

window.addEventListener('load', preview)