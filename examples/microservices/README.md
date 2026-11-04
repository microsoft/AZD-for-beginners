# Microservices Example

The runnable implementation and its instructions are in
**[container-app/microservices](../container-app/microservices/README.md)**.

This directory is navigation only. It has no `azure.yaml`, `infra/`, or `src/`.
Do not run `azd up` here.

From the repository root:

```bash
cd examples/container-app/microservices
```

Then follow the linked README for prerequisites, deployment, verification, local
development, practical exercises, costs, and cleanup.

The sample contains a Node.js API Gateway and a read-only Python Product Service.
Order, user, notification, database, and messaging services are extension ideas,
not implementations included in this repository.

- [Previous: Simple Flask API](../container-app/simple-flask-api/)
- [Next: Database app](../database-app/)
- [AI development](../../docs/chapter-02-ai-development/README.md)
- [Course home](../../README.md)
