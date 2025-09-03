
type PostCategory = 'tutorial' | 'opinion' | 'review';

type User = {
    id: string
    email: string
    name: Name
    createdAt: Date
    posts: Post[]
    comments: PostComment[]
}

type Name = {
    first: string
    last: string
}

type Post = {
    id: string
    authorId: string
    category: PostCategory
    title: string
    createdAt: Date
    comments: Comment[]
}

type PostComment = {
    id: string
    postId: string
    authorId: string
    content: string
    createdAt: Date
}

