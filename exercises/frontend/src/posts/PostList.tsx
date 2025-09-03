import { PostListQuery } from "./__generated__/PostListQuery.graphql";
import { graphql, useLazyLoadQuery } from "react-relay";
import Post from "./Post";

export function PostList() {
  const data = useLazyLoadQuery<PostListQuery>(
    graphql`
      query PostListQuery {
        posts {
          nodes {
            ...PostListItem
          }
        }
      }
    `,
    {},
  );

  const posts = data?.posts?.nodes ?? [];

  return (
    <div>
      <h1>List of posts</h1>
      {posts.map((post, i) => (
        <Post key={i} post={post} />
      ))}
    </div>
  );
}
