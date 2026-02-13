# Kapittel 4: Infrastruktur som kode og distribusjon

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Varighet**: 1-1.5 hours | **⭐ Kompleksitet**: Middels

---

## Oversikt

Dette kapitlet dekker Infrastructure as Code (IaC)-mønstre med Bicep-maler, ressursprovisjonering og distribusjonsstrategier ved bruk av Azure Developer CLI.

## Læringsmål

Etter å ha gjennomført dette kapitlet vil du:
- Forstå Bicep-malens struktur og syntaks
- Opprette Azure-ressurser med `azd provision`
- Distribuere applikasjoner med `azd deploy`
- Implementere blue-green- og rullerende distribusjonsstrategier

---

## 📚 Leksjoner

| # | Leksjon | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Provisjonering av ressurser](provisioning.md) | Administrasjon av Azure-ressurser med AZD | 45 min |
| 2 | [Distribusjonsveiledning](deployment-guide.md) | Strategier for applikasjonsdistribusjon | 45 min |

---

## 🚀 Rask start

```bash
# Initialiser fra mal
azd init --template azure-functions-python-v2-http

# Forhåndsvis hva som vil bli opprettet
azd provision --preview

# Opprett kun infrastruktur
azd provision

# Distribuer kun kode
azd deploy

# Eller begge deler
azd up
```

---

## 📁 AZD-prosjektstruktur

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
| `azd deploy` | Distribuer applikasjonskode |
| `azd up` | opprette + distribuere |
| `azd down` | Slett alle ressurser |

---

## 🔗 Navigasjon

| Retning | Kapittel |
|-----------|---------|
| **Forrige** | [Kapittel 3: Konfigurasjon](../chapter-03-configuration/README.md) |
| **Neste** | [Kapittel 5: Multi-agentløsninger](../chapter-05-multi-agent/README.md) |

---

## 📖 Relaterte ressurser

- [Sjekker før distribusjon](../chapter-06-pre-deployment/README.md)
- [Container-app-eksempler](../../examples/container-app/README.md)
- [Database-app-eksempel](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->