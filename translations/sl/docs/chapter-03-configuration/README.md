# Poglavje 3: Konfiguracija in avtentikacija

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 90–150 minut vključno s prakso integracije | **⭐ Kompleksnost**: Srednja

---

## Pregled

To poglavje zajema konfiguracijo okolja, vzorce avtentikacije in varnostne dobre prakse za uvajanje z Azure Developer CLI.

> Cilj pregleda ukazov in konfiguracije: `azd 1.37.2` (november 2026). Med pregledom ni bilo izvedeno dejansko uvajanje na Azure.

## Cilji učenja

Po dokončanju tega poglavja boste:
- Obvladovali hierarhijo konfiguracije AZD
- Upravili več okolij (dev, staging, prod)
- Izvedli varno avtentikacijo z upravljanimi identitetami
- Konfigurirali nastavitve specifične za okolje

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vodnik za konfiguracijo](configuration.md) | Nastavitev in upravljanje okolja | 30 min |
| 2 | [Avtentikacija in varnost](authsecurity.md) | Vzorec upravljanih identitet in RBAC | 30 min |

---

## 🚀 Hiter začetek

Zaženite iz korena **že inicializirane azd aplikacije**, ne iz repozitorija tečaja. Uporabite neuporabljena imena okolij, če ta že obstajajo.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` je ilustrativen: vpliva na infrastrukturo le, če ga vaš predloga izrecno uporablja. Običajne vrednosti `azd env set` se shranjujejo lokalno v jasnem besedilu in niso varno skrivno shranjevanje.

---

## 🔧 Hierarhija konfiguracije

Ohranite ločene tri različne ravni konfiguracije: globalne nastavitve (`azd config`), strukturo projekta (`azure.yaml`) in vrednosti posameznega okolja (`azd env`). Zastavice preglasijo le tiste nastavitve, ki jih dejansko podpirajo; ni univerzalnega prekrivanja poljubnih okoljskih spremenljivk na `azure.yaml` ali Bicep.

---

## 🔐 Najboljše varnostne prakse

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 2: Razvoj umetne inteligence](../chapter-02-ai-development/README.md) |
| **Naslednje** | [Poglavje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Sorodni viri

- [Preverjanja pred uvajanjem](../chapter-06-pre-deployment/README.md)
- [Odpravljanje težav](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->