# Kapitel 3: Konfiguration & Autentisering

**📚 Kurs**: [AZD För nybörjare](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Intermediate

---

## Översikt

Detta kapitel täcker miljökonfiguration, autentiseringsmönster och säkerhetsrekommendationer för Azure Developer CLI-distributioner.

> Validerad mot `azd 1.23.12` i mars 2026.

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
| 2 | [Autentisering & Säkerhet](authsecurity.md) | Mönster för hanterade identiteter och RBAC | 30 min |

---

## 🚀 Snabbstart

```bash
# Skapa flera miljöer
azd env new dev
azd env new staging
azd env new prod

# Byt mellan miljöer
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

## 🔐 Bästa säkerhetspraxis

```bash
# Använd hanterad identitet (rekommenderas)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Kontrollera AZD-autentiseringsstatus
azd auth status

# Valfritt: verifiera Azure CLI-kontexten om du planerar att köra az-kommandon
az account show

# Autentisera om det behövs
azd auth login

# Valfritt: uppdatera Azure CLI-autentisering för az-kommandon
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
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på sitt ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->