const express = require('express');
const { postgraphile } = require('postgraphile');
const cors = require('cors');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 5000;

// Database connection string
const databaseUrl = process.env.DATABASE_URL || 'postgres://postgres:super_secret@localhost:5432/postgres';

// CORS configuration
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173',
  credentials: true
}));

// PostGraphile middleware configuration with Relay support
app.use(
  postgraphile(databaseUrl, 'public', {
    // Relay support with classic IDs
    classicIds: true,

    // Development features
    watchPg: process.env.NODE_ENV !== 'production',
    graphiql: process.env.NODE_ENV !== 'production',
    enhanceGraphiql: process.env.NODE_ENV !== 'production',

    // Production optimizations
    retryOnInitFail: true,
    dynamicJson: true,
    setofFunctionsContainNulls: false,
    ignoreRBAC: false,
    ignoreIndexes: false,

    // Enable subscriptions for real-time features
    subscriptions: true,
    simpleSubscriptions: true,

    // CRUD operations
    enableCrudMutations: true,

    // GraphQL schema settings
    appendPlugins: [],

    // Additional GraphQL context from request
    async additionalGraphQLContextFromRequest(req, res) {
      return {
        // Add user info if you have authentication
        // user: req.user,

        // Helper to get headers
        getHeader(name) {
          return req.get(name);
        }
      };
    },

    // PostgreSQL settings function
    async pgSettings(req) {
      const settings = {
        // Set the default role (replaces pgDefaultRole)
        role: process.env.DATABASE_VISITOR || 'postgres'
      };

      // Add custom settings here
      if (req.user) {
        settings['jwt.claims.user_id'] = req.user.id;
      }

      return settings;
    },

    // Error handling
    handleErrors: (errors) => {
      // In development, log all errors
      if (process.env.NODE_ENV !== 'production') {
        console.error('GraphQL errors:', errors);
      }

      // Return errors (you can filter/transform them here)
      return errors;
    },

    // Enable query batching
    enableQueryBatching: true,

    // Disable introspection in production
    disableQueryLog: process.env.NODE_ENV === 'production',

    // Additional options for Relay
    legacyRelations: 'omit', // Use 'only' if you need legacy relations

    // Schema export options
    exportGqlSchemaPath: process.env.NODE_ENV !== 'production' ? './schema.graphql' : undefined,

    // Body parser settings
    bodySizeLimit: '100kB'
  })
);

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// Start the server
app.listen(port, () => {
  console.log(`🚀 PostGraphile server running on http://localhost:${port}`);
  console.log(`📊 GraphiQL available at http://localhost:${port}/graphiql`);
  console.log(`🔗 GraphQL endpoint at http://localhost:${port}/graphql`);
  console.log(`🌟 Relay support enabled with classic IDs`);
});

// Graceful shutdown
process.on('SIGINT', () => {
  console.log('\n📴 Shutting down server...');
  process.exit(0);
});

process.on('SIGTERM', () => {
  console.log('\n📴 Shutting down server...');
  process.exit(0);
});
