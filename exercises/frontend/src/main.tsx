import { StrictMode, Suspense } from "react";
import { createRoot } from "react-dom/client";
import "./index.css";
import { PostList } from "./posts/PostList.tsx";
import { RelayEnvironmentProvider } from "react-relay";
import { environment } from "./graphql/relayEnvironment.ts";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <RelayEnvironmentProvider environment={environment}>
      <Suspense fallback="Loading...">
        <PostList />
      </Suspense>
    </RelayEnvironmentProvider>
  </StrictMode>,
);
