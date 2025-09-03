# PostGraphile Backend

This backend uses PostGraphile in library mode with Express and includes full Relay support with classic IDs.

## Features

- ✅ PostGraphile in library mode
- ✅ Relay support with classic IDs
- ✅ GraphiQL interface (development mode)
- ✅ Real-time subscriptions
- ✅ CORS enabled for frontend
- ✅ TypeScript support
- ✅ Environment configuration
- ✅ Health check endpoint

## Setup

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Configure environment variables:**
   - Copy `env.example` to `.env`
   - Update the DATABASE_URL with your PostgreSQL connection details
   ```bash
   cp env.example .env
   ```

3. **Set up the database:**
   ```bash
   # Run from the root directory
   ./setup/init_database.sh
   ```

## Development

**Start the development server:**
```bash
npm run dev
```

The server will start on `http://localhost:5000` with:
- GraphQL endpoint: `http://localhost:5000/graphql`
- GraphiQL interface: `http://localhost:5000/graphiql`
- Health check: `http://localhost:5000/health`

## Production

**Build and start:**
```bash
npm run build
npm start
```

## PostGraphile Configuration

The PostGraphile server is configured with:

- **Relay Support**: `classicIds: true` enables classic Relay node IDs
- **Real-time**: Subscriptions enabled for live data updates
- **Security**: RBAC respected, proper error handling
- **Performance**: Query batching, optimized for production
- **Development**: GraphiQL, enhanced debugging, schema watching

## Database Schema

The backend automatically generates GraphQL schema from your PostgreSQL database tables:

- `users` - User accounts
- `posts` - Blog posts with categories
- `post_comments` - Comments on posts
- `user_post_stats` - View with user statistics

## Relay Integration

This backend is fully compatible with Relay Modern. The frontend can use:

- Node interface for refetching
- Connection specification for pagination
- Classic IDs for stable object identification
- Subscriptions for real-time updates

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DATABASE_URL` | `postgres://localhost:5432/postgres` | PostgreSQL connection string |
| `PORT` | `5000` | Server port |
| `NODE_ENV` | `development` | Environment mode |
| `FRONTEND_URL` | `http://localhost:5173` | Frontend URL for CORS |
| `DATABASE_VISITOR` | `postgres` | Default PostgreSQL role |
