# Microservices Eksempel

Den kørbare implementering og dens instruktioner findes i
**[container-app/microservices](../container-app/microservices/README.md)**.

Denne mappe er kun til navigation. Den indeholder ikke `azure.yaml`, `infra/` eller `src/`.
Kør ikke `azd up` her.

Fra repositoryets rodmappe:

```bash
cd examples/container-app/microservices
```

Følg derefter den linkede README for forudsætninger, deployment, verifikation, lokal
udvikling, praktiske øvelser, omkostninger og oprydning.

Eksemplet indeholder en Node.js API Gateway og en read-only Python Product Service.
Order-, bruger-, notifikations-, database- og messaging-tjenester er idéer til udvidelse,
ikke implementeringer inkluderet i dette repository.

- [Forrige: Simple Flask API](../../../../examples/container-app/simple-flask-api)
- [Næste: Database app](../../../../examples/database-app)
- [AI udvikling](../../docs/chapter-02-ai-development/README.md)
- [Kursus startside](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->