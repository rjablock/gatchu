// 文字数カウンター
$(document).ready(function() {
  const textField = $("#question_title");
  const textArea = $("#question_body");
  const titleCount = $("#title-count");
  const bodyCount = $("#body-count");

  textField.on("input", function() {
    const count = textField.val().length;
    titleCount.text(count + " / 50文字");
  })

  textArea.on("input", function() {
    const count = textArea.val().length;
    bodyCount.text(count + " / 300文字");
  });
});