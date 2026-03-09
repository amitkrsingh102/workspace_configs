local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("lc", {
    t({
      "#include <iostream>",
      "#include <vector>",
      "#include <string>",
      "#include <algorithm>",
      "#include <unordered_map>",
      "#include <unordered_set>",
      "#include <queue>",
      "#include <stack>",
      "",
      "using namespace std;",
      "",
      "class Solution {",
      "public:",
      "    ",
    }),
    i(1, "int solve(vector<int>& nums) {\n        return 0;"),
    t({
      "",
      "    }",
      "};",
      "",
      "",
      "int main() {",
      "    ios::sync_with_stdio(false);",
      "    cin.tie(nullptr);",
      "",
      "    Solution sol;",
      "    vector<int> nums = {1, 2, 3};",
      "    cout << sol.solve(nums) << '\\n';",
      "",
      "    return 0;",
      "}",
    }),
  }),
}
