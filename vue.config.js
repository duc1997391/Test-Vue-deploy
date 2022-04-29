const { defineConfig } = require("@vue/cli-service");

console.log(process.env.NODE_ENV);

module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: process.env.NODE_ENV === "github" ? "/Test-Vue-deploy/" : "/",
});
