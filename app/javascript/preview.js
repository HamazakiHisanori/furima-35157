function preview() {
  if ( document.getElementById("item-image")) {
  const ImagePreview = document.getElementById("image-preview");
  const ItemImage = document.getElementById("item-image");
  ItemImage.addEventListener('change', function(e){

    // 画像が存在する場合のみ削除
    const imgDestroy = document.querySelector('img');
    if (imgDestroy){
      imgDestroy.remove();
    };

          //画像情報
    const file = e.target.files[0];
          //画像URL
    const fileUrl = window.URL.createObjectURL(file);
          //div生成
    const imageDiv = document.createElement('div');
          //実際に表示する画像を入れる場所
    const fileImage = document.createElement('img');
    fileImage.width = 200;
    fileImage.height = 200;
    //imgの中に画像URLをセット
    fileImage.setAttribute('src', fileUrl);
    //<div><画像URL></div>の形
    imageDiv.appendChild(fileImage);
    //上記で作成したHTMLをプレビュー
    ImagePreview.appendChild(imageDiv);
  });
};
};

window.addEventListener('load', preview)