module.exports = {
  tags: ['yahoo'],
  "Demo test Yahoo" : function (client) {
    client
      .url("http://www.yahoo.co.jp")
      .waitForElementVisible("body", 1000)
      .assert.title("Yahoo! JAPAN")
      .assert.visible("#srchtxt")
      .setValue("#srchtxt", "nightwatch")
      .waitForElementVisible("#srchbtn", 1000)
      .click("#srchbtn")
      .pause(1000)
      .assert.title("「nightwatch」の検索結果 - Yahoo!検索")
      .end();
  }
};
