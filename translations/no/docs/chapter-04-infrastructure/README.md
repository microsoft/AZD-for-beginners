# Kapittel 4: Infrastruktur som kode og utrulling

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1.5 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapittelet dekker Infrastruktur som kode (IaC)-mønstre med Bicep-maler, ressursprovisjonering og utrullingsstrategier ved bruk av Azure Developer CLI.

> Validert mot `azd 1.27.1` i juli 2026.

## Læringsmål

Ved å fullføre dette kapittelet vil du:
- Forstå Bicep-malens struktur og syntaks
- Provisjonere Azure-ressurser med `azd provision`
- Rulle ut applikasjoner med `azd deploy`
- Implementere blue-green og rullerende utrullingsstrategier

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure ressursstyring med AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Applikasjonsutrullingsstrategier | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Bygg og publiser gjenbrukbare azd-maler | 30 min |

---

## 🚀 Kom i gang raskt

```bash
# Initialiser fra mal
azd init --template azure-functions-python-v2-http

# Forhåndsvis hva som vil bli opprettet
azd provision --preview

# Tilrettelegg kun infrastruktur
azd provision

# Distribuer kun kode
azd deploy

# Eller begge sammen
azd up
```

---

## 📁 AZD prosjekstruktur

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

## 🔧 Viktige kommandoer

| Kommando | Beskrivelse |
|---------|-------------|
| `azd init` | Initialiser prosjekt |
| `azd provision` | Opprett Azure-ressurser |
| `azd deploy` | Rull ut applikasjonskode |
| `azd up` | provisjoner + rull ut |
| `azd down` | Slett alle ressurser |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Neste** | [Kapittel 5: Multi-agent løsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterte ressurser

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->