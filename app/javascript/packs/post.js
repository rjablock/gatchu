// 「新しくジャンルを作成する」の選択時にポップアップを表示
  $(document).ready(function() {
    var genreSelect = $("#genre-select");
    var newGenreForm = $("#new-genre-form");
    var submitButton = $("#submit-button");

    genreSelect.on("change", function() {
      if (genreSelect.val() === "new") {
        slideDown(newGenreForm);
        submitButton.prop("disabled", true);
      } else {
        slideUp(newGenreForm);
        submitButton.prop("disabled", false);
      }
    });

    function slideDown(element) {
      element.slideDown(300);
      $(document).on("click", outsideClick);
    }

    function outsideClick(event) {
      if (!$(event.target).closest(newGenreForm).length) {
        slideUp(newGenreForm);
      }
    }

    function slideUp(element) {
      element.slideUp(300);
      $(document).off("click", outsideClick);
    }
  });

// 画像ファイルが選択された際に画像のプレビューを表示
  $(document).ready(function() {
    var imagePreview = $("#image-preview");
    var fileInput = $("#post_image");

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