# Kapitel 4: Infrastruktur som kode & Udrulning

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 1-1,5 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel dækker Infrastruktur som kode (IaC)-mønstre med Bicep-skabeloner, oprettelse af ressourcer og udrulningsstrategier ved hjælp af Azure Developer CLI.

> Valideret mod `azd 1.23.12` i marts 2026.

## Læringsmål

Efter at have gennemført dette kapitel vil du:
- Forstå Bicep-skabelonens struktur og syntaks
- Oprette Azure-ressourcer med `azd provision`
- Udrulle applikationer med `azd deploy`
- Implementere blue-green og rullende udrulningsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisioning af ressourcer](provisioning.md) | Azure-ressourcestyring med AZD | 45 min |
| 2 | [Udrulningsvejledning](deployment-guide.md) | Strategier for udrulning af applikationer | 45 min |

---

## 🚀 Hurtig start

```bash
# Initialiser fra skabelon
azd init --template azure-functions-python-v2-http

# Forhåndsvis hvad der vil blive oprettet
azd provision --preview

# Provisionér kun infrastrukturen
azd provision

# Udrul kun kode
azd deploy

# Eller begge dele
azd up
```

---

## 📁 AZD-projektstruktur

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Vigtige kommandoer

| Kommando | Beskrivelse |
|---------|-------------|
| `azd init` | Initialiser projekt |
| `azd provision` | Opret Azure-ressourcer |
| `azd deploy` | Udrul applikationskode |
| `azd up` | opret + udrul |
| `azd down` | Slet alle ressourcer |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Næste** | [Kapitel 5: Multi-Agent-løsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterede ressourcer

- [Tjek før udrulning](../chapter-06-pre-deployment/README.md)
- [Eksempler på Container App](../../examples/container-app/README.md)
- [Eksempel på databaseapplikation](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i sit oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel, menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->