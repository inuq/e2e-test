module.exports = {
  tags: ['google'],
  "Demo test Google" : function (client) {
    client
      .url("http://www.google.co.jp")
      .waitForElementVisible("body", 1000)
      .assert.title("Google")
      .assert.visible("input[type=text]")
      .setValue("input[type=text]", "nightwatch")
      .waitForElementVisible("button[name=btnG]", 1000)
      .click("button[name=btnG]")
      .pause(1000)
      .assert.title("nightwatch - Google 検索")
      .end();
  }
};
