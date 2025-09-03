import { Environment, FetchFunction, Network } from "relay-runtime";

const HTTP_ENDPOINT = "/graphql";

const fetchGraphQL: FetchFunction = async (request, variables) => {
  /**
   * Bring your own rules, access tokens or other authentication
   * mechanisms here.
   */
  const resp = await fetch(HTTP_ENDPOINT, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ query: request.text, variables }),
  });
  if (!resp.ok) {
    throw new Error("Response failed.");
  }
  return await resp.json();
};

export const environment = new Environment({
  network: Network.create(fetchGraphQL),
});
