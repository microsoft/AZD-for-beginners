# Kapittel 4: Infrastruktur som kode og distribusjon

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1,5 timer | **⭐ Vanskelighetsgrad**: Middels

---

## Oversikt

Dette kapitlet dekker Infrastructure as Code (IaC)-mønstre med Bicep-maler, ressursprovisjonering og distribusjonsstrategier ved bruk av Azure Developer CLI.

> Validert mot `azd 1.25.6` i juni 2026.

## Læringsmål

Ved å fullføre dette kapitlet vil du:
- Forstå Bicep-malstruktur og syntaks
- Provisionere Azure-ressurser med `azd provision`
- Distribuere applikasjoner med `azd deploy`
- Implementere blå-grønn og rullerende distribusjonsstrategier

---

## 📚 Lekser

| # | Leksjon | Beskrivelse | Tid |
|---|---------|-------------|-----|
| 1 | [Provisionering av ressurser](provisioning.md) | Azure ressursstyring med AZD | 45 min |
| 2 | [Distribusjonsguide](deployment-guide.md) | Strategier for applikasjonsdistribusjon | 45 min |
| 3 | [Skrive din egen mal](custom-templates.md) | Bygg og publiser gjenbrukbare azd-maler | 30 min |

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
|----------|-------------|
| `azd init` | Initialiser prosjekt |
| `azd provision` | Opprett Azure-ressurser |
| `azd deploy` | Distribuer applikasjonskode |
| `azd up` | provision + deploy |
| `azd down` | Slett alle ressurser |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|---------|----------|
| **Forrige** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Neste** | [Kapittel 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

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