# React + Relay + TypeScript + Vite

This template provides a minimal and comfortable setup to get Vite, React and Relay working with a real GraphQL API.

## Stack

- **TypeScript**
  - Is there a substitute?
- **Vite**
  - Bundler, provides a GraphQL proxy
- **React**
  - Frontend framework, no additional dependencies
- **Relay**
  - Pre-configured GraphQL compiler and query client

## Requirements

- node.js
- [watchman](https://facebook.github.io/watchman/docs/install.html)
  - Required for the full Relay compiler watch mode high fidelity experience

## Pre-configurations

- TypeScript with strict config
- `npm run dev` for concurrent Relay Compiler and Vite HMR
- prettier formatter with defaults

## Setup

- Review the GraphQL proxy configuration in `vite.config.ts`
- Run the `npm run dev` development server
- Replace the [schema.graphql](./schema.graphql) with your schema
- Update the sample queries in [src/posts/] to match something present in your schema
- Watch Relay perform it's magic
- Hard driving 🚀
