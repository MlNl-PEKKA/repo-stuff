import baseConfig, { restrictEnvAccess } from "repo-stuff/eslint-config/base";
import nextjsConfig from "repo-stuff/eslint-config/nextjs";
import reactConfig from "repo-stuff/eslint-config/react";

/** @type {import('typescript-eslint').Config} */
export default [
  {
    ignores: [".next/**"],
  },
  ...baseConfig,
  ...reactConfig,
  ...nextjsConfig,
  ...restrictEnvAccess,
];
