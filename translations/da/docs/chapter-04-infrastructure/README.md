# Kapitel 4: Infrastruktur som kode & Udrulning

**📚 Kursus**: [AZD For Begyndere](../../README.md) | **⏱️ Varighed**: 1-1.5 timer | **⭐ Kompleksitet**: Mellem

---

## Oversigt

Dette kapitel dækker Infrastructure as Code (IaC)-mønstre med Bicep-skabeloner, ressourceprovisionering og udrulningsstrategier ved hjælp af Azure Developer CLI.

> Valideret mod `azd 1.25.6` i juni 2026.

## Læringsmål

Efter at have gennemført dette kapitel vil du:
- Forstå strukturen og syntaksen i Bicep-skabeloner
- Oprette Azure-ressourcer med `azd provision`
- Udrulle applikationer med `azd deploy`
- Implementere blue-green og rullende udrulningsstrategier

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure-ressourcestyring med AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Applikationsudrulningsstrategier | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Byg og udgiv genanvendelige azd-skabeloner | 30 min |

---

## 🚀 Kom godt i gang

```bash
# Initialiser fra skabelon
azd init --template azure-functions-python-v2-http

# Forhåndsvis hvad der vil blive oprettet
azd provision --preview

# Provisionér kun infrastruktur
azd provision

# Udrul kun kode
azd deploy

# Eller begge dele sammen
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
| `azd init` | Initialiser projektet |
| `azd provision` | Opret Azure-ressourcer |
| `azd deploy` | Udrul applikationskode |
| `azd up` | opret + udrul |
| `azd down` | Slet alle ressourcer |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 3: Configuration](../chapter-03-configuration/README.md) |
| **Næste** | [Kapitel 5: Multi-Agent-løsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterede ressourcer

- [Tjek før udrulning](../chapter-06-pre-deployment/README.md)
- [Eksempler på container-apps](../../examples/container-app/README.md)
- [Eksempel på database-app](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->