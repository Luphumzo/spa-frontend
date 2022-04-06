module.exports = {
    env: {
        browser: true,
        es6: true,
        node: true
    },
    extends: ["prettier", "prettier/prettier"],
    globals: {
        Atomics: "readonly",
        SharedArrayBuffer: "readonly",
        order: "readonly",
        import: "readonly"
    },
    parser: "vue-eslint-parser",
    parserOptions: {
        parser: "babel-eslint",
        ecmaVersion: 2020,
        sourceType: "module"
    },
    plugins: ["vue"],
    rules: {
        "vue/max-attributes-per-line": "off",
        // "max-len": ["warning", { code: 210 }],
        "linebreak-style": 0,
        "no-unused-vars": "off"
    }
};
/* eslint-disable linebreak-style */
