// 文字数カウンター
$(document).ready(function() {
  const textArea = $("#answer_body");
  const bodyCount = $("#body-count");

  textArea.on("input", function() {
    const count = textArea.val().length;
    bodyCount.text(count + " / 300文字");
  });
});