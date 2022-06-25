const { execSync } = require("child_process");
const output = execSync("ls", { encoding: "utf-8" });
console.log(output);
