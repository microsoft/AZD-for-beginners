# Kapitel 3: Konfiguration & Autentisering

**📚 Kurs**: [AZD för nybörjare](../../README.md) | **⏱️ Varaktighet**: 45-60 minuter | **⭐ Svårighetsgrad**: Medel

---

## Översikt

Detta kapitel behandlar miljökonfiguration, autentiseringsmönster och säkerhetsbästa praxis för distributioner med Azure Developer CLI.

> Validerad mot `azd 1.25.6` i juni 2026.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Behärska AZD:s konfigurationshierarki
- Hantera flera miljöer (dev, staging, prod)
- Implementera säker autentisering med hanterade identiteter
- Konfigurera miljöspecifika inställningar

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Konfigurationsguide](configuration.md) | Miljöinställning och hantering | 30 min |
| 2 | [Autentisering och säkerhet](authsecurity.md) | Mönster för hanterad identitet och RBAC | 30 min |

---

## 🚀 Snabbstart

```bash
# Skapa flera miljöer
azd env new dev
azd env new staging
azd env new prod

# Växla mellan miljöer
azd env select prod

# Ställ in miljövariabler
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Visa konfiguration
azd env get-values
```

---

## 🔧 Konfigurationshierarki

AZD tillämpar inställningar i denna ordning (senare åsidosätter tidigare):

1. **Standardvärden** (inbyggda i mallar)
2. **azure.yaml** (projektkonfiguration)
3. **Miljövariabler** (`azd env set`)
4. **Kommandoradsflaggor** (`--location eastus`)

---

## 🔐 Säkerhetsbästa praxis

```bash
# Använd hanterad identitet (rekommenderas)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrollera AZD-autentiseringsstatus
azd auth status

# Valfritt: verifiera Azure CLI-kontexten om du planerar att köra az-kommandon
az account show

# Autentisera igen vid behov
azd auth login

# Valfritt: uppdatera Azure CLI-autentiseringen för az-kommandon
az login
```

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 2: AI-utveckling](../chapter-02-ai-development/README.md) |
| **Nästa** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Relaterade resurser

- [Kontroller före distribution](../chapter-06-pre-deployment/README.md)
- [Felsökning](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->