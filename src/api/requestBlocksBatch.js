const request = require("superagent");
require('superagent-retry-delay')(request);
const { USER_AGENT } = require("./constants");

function unfold(fn, seed) {
  var pair = fn(seed);
  var result = [];
  while (pair && pair.length) {
    result[result.length] = pair[0];
    pair = fn(pair[1]);
  }
  return result;
}

// split {blockData},{blockData},{blockData} to array of {blockData}
// blockData may contain symbols {}, so its need to count
const splitBlocks = s =>
  unfold(cur => {
    // position after last close curve bracket
    let end = -1;
    // counter of curve brackets
    let c = 1;
    // current position
    let i = 0;
    // whether current processing part of s is quoted
    let quoted = 0;
    // whether block found 
    let found = false;
    while (i < cur.length && !found) {
      if (cur[i] === '"') {
        let isEscapedQuote = false;
        // escaped quote, but not escaped slash
        if (i > 1 && cur[i - 1] == "\\" && cur[i - 2] !== "\\") {
          isEscapedQuote = true;
        }
        // whether it is not escaped quote (syntax quote, but not in the text)
        if (i == 0 || !isEscapedQuote) {
          quoted = !quoted;
        }
      }

      // it doesn't need to handle quoted text
      if (quoted) {
        i++;
        continue;
      } else {
        if (cur[i] === "{") c++;
        else if (cur[i] === "}") c--;

        if (c === 1) {
          end = i;
          found = true;
        } else {
          i++;
        }
      }
    }

    // there are no blocks in the specified string
    if (end === -1) {
      return false;
    } else {
      return [cur.slice(0, end + 1), cur.slice(end + 2)];
    }
  }, s);

const parseBlocks = sanitize => (res, fn) => {
  res.text = "";
  res.setEncoding("utf8");
  res.on("data", chunk => (res.text += chunk));
  res.on("end", err => fn(err, splitBlocks(sanitize(res.text).slice(1, -1))));
};

// \u0000 in JSON is problematic for PostgreSQL
// removing it from strings
const sanitize = text => text.replace(/\\u0000/g, "");

const requestBlocksBatch = (start, options) =>
  request
    .get(
      `${options.nodeAddress}/blocks/seq/${start}/${start +
        options.blocksPerRequest -
        1}`
    )
    .set("User-Agent", USER_AGENT)
    .retry(options.nodePollingRetriesCount, options.nodePollingRetriesDelay)
    .buffer(true)
    .parse(parseBlocks(sanitize))
    .then(r => r.body);

module.exports = requestBlocksBatch;
