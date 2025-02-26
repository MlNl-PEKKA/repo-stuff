import baseConfig from "@repo-stuff/eslint-config/base";
import reactConfig from "@repo-stuff/eslint-config/react";

/** @type {import('typescript-eslint').Config} */
export default [
  {
    ignores: ["dist/**"],
  },
  ...baseConfig,
  ...reactConfig,
];
