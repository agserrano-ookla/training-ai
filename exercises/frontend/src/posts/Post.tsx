import { graphql, useFragment } from "react-relay";
import {
  PostListItem$data,
  PostListItem$key,
} from "./__generated__/PostListItem.graphql";

export default function PostListItem(props: { post: PostListItem$key }) {
  const post = useFragment<PostListItem$key>(
    graphql`
      fragment PostListItem on Post {
        id
        title
        author {
          id
          firstName
          lastName
        }
        content
      }
    `,
    props.post,
  );

  return (
    <li>
      <b>{post.title}</b>: <i>{fullName(post.author)} </i>
    </li>
  );
}

function fullName(author: PostListItem$data["author"] | null): string {
  if (!author) return "Unknown Author";
  return `${author.lastName}, ${author.firstName}`;
}
