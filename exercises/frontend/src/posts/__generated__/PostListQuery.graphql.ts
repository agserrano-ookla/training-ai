/**
 * @generated SignedSource<<bdf9ea0572afbff412e42c801a55afb7>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* tslint:disable */
/* eslint-disable */
// @ts-nocheck

import { ConcreteRequest } from 'relay-runtime';
import { FragmentRefs } from "relay-runtime";
export type PostListQuery$variables = Record<PropertyKey, never>;
export type PostListQuery$data = {
  readonly posts: {
    readonly nodes: ReadonlyArray<{
      readonly " $fragmentSpreads": FragmentRefs<"PostListItem">;
    }>;
  } | null | undefined;
};
export type PostListQuery = {
  response: PostListQuery$data;
  variables: PostListQuery$variables;
};

const node: ConcreteRequest = (function(){
var v0 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "PostListQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "PostsConnection",
        "kind": "LinkedField",
        "name": "posts",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "Post",
            "kind": "LinkedField",
            "name": "nodes",
            "plural": true,
            "selections": [
              {
                "args": null,
                "kind": "FragmentSpread",
                "name": "PostListItem"
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "PostListQuery",
    "selections": [
      {
        "alias": null,
        "args": null,
        "concreteType": "PostsConnection",
        "kind": "LinkedField",
        "name": "posts",
        "plural": false,
        "selections": [
          {
            "alias": null,
            "args": null,
            "concreteType": "Post",
            "kind": "LinkedField",
            "name": "nodes",
            "plural": true,
            "selections": [
              (v0/*: any*/),
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "title",
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "concreteType": "User",
                "kind": "LinkedField",
                "name": "author",
                "plural": false,
                "selections": [
                  (v0/*: any*/),
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "firstName",
                    "storageKey": null
                  },
                  {
                    "alias": null,
                    "args": null,
                    "kind": "ScalarField",
                    "name": "lastName",
                    "storageKey": null
                  }
                ],
                "storageKey": null
              },
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "content",
                "storageKey": null
              }
            ],
            "storageKey": null
          }
        ],
        "storageKey": null
      }
    ]
  },
  "params": {
    "cacheID": "36bd2683e821e1c06b49036511ac4c06",
    "id": null,
    "metadata": {},
    "name": "PostListQuery",
    "operationKind": "query",
    "text": "query PostListQuery {\n  posts {\n    nodes {\n      ...PostListItem\n      id\n    }\n  }\n}\n\nfragment PostListItem on Post {\n  id\n  title\n  author {\n    id\n    firstName\n    lastName\n  }\n  content\n}\n"
  }
};
})();

(node as any).hash = "c2fa0cd5163b361844ec87fee2d289f9";

export default node;
