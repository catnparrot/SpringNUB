console.log("Reply Module.........");

var replyService = (function () {
  function add(reply, callback, error) {
    console.log("add reply...................");

    $.ajax({
      type: "post",
      url: "replies/new",
      data: JSON.stringify(reply),
      contentType: "application/json; charset=utf-8",
      success: function (success, status, xhr) {
        if (callback) {
          callback(success);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      },
    });
  }

  return { add: add };
})();
