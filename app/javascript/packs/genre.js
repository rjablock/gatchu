// 「新しくジャンルを作成する」の選択時にポップアップを表示
$(document).ready(function() {
  var newGenreButton = $("#new-genre-button");
  var newGenreForm = $("#new-genre-form");

  newGenreButton.on("click", function() {
    event.stopPropagation();
    slideDown(newGenreForm);
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

// 編集ボタン押下後、フォームが出現し保存ボタンに切り替わる
$(document).ready(function() {
  $(".edit-button").click(function() {
    var row = $(this).closest("tr");
    var nameCell = row.find(".genre-name");
    var editInput = row.find(".genre-edit-input");
    var saveButton = row.find(".save-button");

    nameCell.hide();
    editInput.show().focus();
    $(this).hide();
    saveButton.show();
  });

  $(".save-button").click(function() {
    var row = $(this).closest("tr");
    var nameCell = row.find(".genre-name");
    var editInput = row.find(".genre-edit-input");
    var editButton = row.find(".edit-button");

    nameCell.text(editInput.val()).show();
    editInput.hide();
    $(this).hide();
    editButton.show();
  });
});