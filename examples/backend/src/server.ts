import express from "express";
import { postgraphile } from "postgraphile";

const app = express();

app.use(
  postgraphile(
    process.env.DATABASE_URL || "postgres://postgres:super_secret@localhost:5432/postgres",
    "public",
    {
      watchPg: true,
      graphiql: true,
      enhanceGraphiql: true,
      classicIds: true,
      legacyRelations: "omit",
      dynamicJson: true,
      setofFunctionsContainNulls: false,
      ignoreRBAC: false,
      showErrorStack: "json",
      extendedErrors: ["hint", "detail", "errcode"],
      enableQueryBatching: true,
      appendPlugins: [require("@graphile-contrib/pg-simplify-inflector")],
      exportGqlSchemaPath: "schema.graphql",
      allowExplain: () => true,
    }
  )
);

app.listen(process.env.PORT || 3000, () => {
  console.log("PostGraphile server running on http://localhost:3000/graphql");
});
