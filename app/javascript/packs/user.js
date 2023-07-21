// 画像ファイルが選択された際に画像のプレビューを表示
  $(document).ready(function() {
    var imagePreview = $("#image-preview");
    var fileInput = $("#user_profile_image");

    imagePreview.hide();

    fileInput.on("change", function(event) {
      var file = event.target.files[0];

      if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
          imagePreview.attr("src", e.target.result).show();
        }
        reader.readAsDataURL(file);
      } else {
        imagePreview.hide();
      }
    });
  });

// 文字数カウンター
  $(document).ready(function() {
    const textField = $("#user_introduction");
    const introductionCount = $("#introduction-count");

    textField.on("input", function() {
      const count = textField.val().length;
      introductionCount.text(count + " / 100文字");
    });
  });